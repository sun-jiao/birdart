import 'dart:io';

import 'package:exif/exif.dart';
import 'package:flutter/foundation.dart';
import 'package:objectid/objectid.dart';
import 'package:shared/shared.dart';

import '../db/db_manager.dart';
import '../entity/user_profile.dart';
import '../widget/picture_grid.dart';

class ImageTool {
  String? path;
  Map<String, IfdTag>? exif;
  String? lat;
  String? lon;
  String? ele;
  String? name;

  ImageTool(this.path) {
    try {
      if (path != null) {
        getExifFromFile(path!).then((value) {
          exif = value;
          if (exif != null) {
            ele = exif!['GPSAltitude']?.printable.replaceAll(' m', '');
            var longitude = exif!['GPSLongitude']?.printable;
            lon = exif!['GPSLongitudeRef']?.printable == 'W'
                ? '-$longitude'
                : longitude;
            var latitude = exif!['GPSLatitude']?.printable;
            lat = exif!['GPSLatitudeRef']?.printable == 'S'
                ? '-$latitude'
                : latitude;
          }
        });
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<Map<String, IfdTag>?> getExifFromFile(String path) async {
    var file = File(path);
    var bytes = await file.readAsBytes();
    return await readExifFromBytes(bytes.buffer.asUint8List());
  }

  String asStringExif() {
    if (exif == null) {
      return '';
    }
    return exif.toString();
  }
}

Future<int> imageMapForEach(String type, PictureGridState pictureGrid,
    List<DbImage> oldImages, ObjectId recordId) async {
  List<DbImage> addImages = [];
  List<String> imgPaths = [];

  List<String?> imagePathList = [
    for (var i = 0; i < pictureGrid.imageData.length; i++)
      (await pictureGrid.imageData[i].file)?.path
  ];
  pictureGrid.imageData.asMap().forEach((index, img) {
    final imagePath = imagePathList[index];
    if (imagePath != null &&
        !oldImages.any((DbImage image) => image.imagePath == imagePath)) {
      imgPaths.add(imagePath);

      if (oldImages.isEmpty) {
        DbImage dbImage;
        ImageTool imageTool = ImageTool(imagePath);

        try {
          dbImage = DbImage.add(
            record: recordId,
            imagePath: imagePath,
            imageId: img.id,
            imageSize: (img.size.width * img.size.height).toInt(),
            exif: imageTool.asStringExif(),
            author: UserProfile.id,
          );
          addImages.add(dbImage);
        } catch (e) {
          if (kDebugMode) {
            print(e);
          }
        }
      }
    }
  });

  List<DbImage> deleteImages = [];
  for (DbImage image in oldImages) {
    if (!imagePathList
        .any((String? path) => image.imagePath == path.toString())) {
      deleteImages.add(image);
    }
  }

  int addNumber = (await DbManager.db.imageDao.insertList(addImages)).length;
  int deleteNumber = await DbManager.db.imageDao.deleteList(deleteImages);

  if (addNumber == addImages.length && deleteNumber == deleteImages.length) {
    return 1;
  }
  return 0;
}
