import 'package:floor_annotation/floor_annotation.dart';
import 'package:objectid/objectid.dart';

@entity
class Track {
  @primaryKey
  ObjectId id;
  ObjectId author;

  double startLon = 0.0;
  double startLat = 0.0;
  double startEle = 0.0;
  double endLon = 0.0;
  double endLat = 0.0;
  double endEle = 0.0;

  DateTime startTime;
  DateTime endTime;

  int pointCount = 0;
  double distance = 0.0;
  bool sync;

  String file = '';

  bool isSelected = false;

  Track({
    required this.id,
    required this.author,
    required this.startTime,
    required this.endTime,
    required this.sync,
    required this.file,
    this.startLon = 0.0,
    this.startLat = 0.0,
    this.startEle = 0.0,
    this.endLon = 0.0,
    this.endLat = 0.0,
    this.endEle = 0.0,
    this.pointCount = 0,
    this.distance = 0.0,
  });

  factory Track.fromJson(Map<String, dynamic> json) => Track(
        id: ObjectId.fromHexString(json['_id']),
        author: ObjectId.fromHexString(json['author']),
        startLon: double.parse(json['startLon']),
        startLat: double.parse(json['startLat']),
        startEle: double.parse(json['startEle']),
        endLon: double.parse(json['endLon']),
        endLat: double.parse(json['endLat']),
        endEle: double.parse(json['endEle']),
        startTime: DateTime.fromMillisecondsSinceEpoch(json['startTime']),
        endTime: DateTime.fromMillisecondsSinceEpoch(json['endTime']),
        pointCount: int.parse(json['pointCount']),
        distance: double.parse(json['distance']),
        sync: true,
        file: json['file'],
      );

  Map<String, dynamic> toJson() => {
        '_id': id.hexString,
        'author': author.hexString,
        'startLon': startLon,
        'startLat': startLat,
        'startEle': startEle,
        'endLon': endLon,
        'endLat': endLat,
        'endEle': endEle,
        'startTime': startTime.millisecondsSinceEpoch,
        'endTime': endTime.millisecondsSinceEpoch,
        'pointCount': pointCount,
        'distance': distance,
      };

  Track.empty(this.author)
      : id = ObjectId(),
        startTime = DateTime.fromMillisecondsSinceEpoch(0),
        endTime = DateTime.fromMillisecondsSinceEpoch(0),
        sync = false;
}

@dao
abstract class TrackDao {
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<int> insertOne(Track track);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<List<int>> insertList(List<Track> tracks);

  @delete
  Future<int> deleteOne(Track track);

  @delete
  Future<int> deleteList(List<Track> tracks);

  @update
  Future<int> updateOne(Track track);

  @update
  Future<int> updateList(List<Track> tracks);

  @Query("DELETE FROM track WHERE id = :trackId")
  Future<int?> deleteById(String trackId);

  @Query("SELECT * FROM track ORDER BY datetime(startTime) desc")
  Future<List<Track>> getAll();

  @Query("SELECT * FROM track WHERE id = :trackId")
  Future<List<Track>> getById(String trackId);

  @Query("SELECT * FROM track WHERE sync <> 1")
  Future<List<Track>> getUnsynced();

  @Query(
      "SELECT * FROM track WHERE instr(startTime, :date) ORDER BY datetime(startTime) desc")
  Future<List<Track>> getByDate(String date);
}
