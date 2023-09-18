// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class BdL10n {
  BdL10n();

  static BdL10n? _current;

  static BdL10n get current {
    assert(_current != null,
        'No instance of BdL10n was loaded. Try to initialize the BdL10n delegate before accessing BdL10n.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<BdL10n> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = BdL10n();
      BdL10n._current = instance;

      return instance;
    });
  }

  static BdL10n of(BuildContext context) {
    final instance = BdL10n.maybeOf(context);
    assert(instance != null,
        'No instance of BdL10n present in the widget tree. Did you add BdL10n.delegate in localizationsDelegates?');
    return instance!;
  }

  static BdL10n? maybeOf(BuildContext context) {
    return Localizations.of<BdL10n>(context, BdL10n);
  }

  /// `Home`
  String get bottomHome {
    return Intl.message(
      'Home',
      name: 'bottomHome',
      desc: '',
      args: [],
    );
  }

  /// `Records`
  String get bottomRecords {
    return Intl.message(
      'Records',
      name: 'bottomRecords',
      desc: '',
      args: [],
    );
  }

  /// `Explore`
  String get bottomExplore {
    return Intl.message(
      'Explore',
      name: 'bottomExplore',
      desc: '',
      args: [],
    );
  }

  /// `My Birdart`
  String get bottomMyBirdart {
    return Intl.message(
      'My Birdart',
      name: 'bottomMyBirdart',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get homeDate {
    return Intl.message(
      'Date',
      name: 'homeDate',
      desc: '',
      args: [],
    );
  }

  /// `{month} {day}, {year}`
  String homeDateFormat(Object month, Object day, Object year) {
    return Intl.message(
      '$month $day, $year',
      name: 'homeDateFormat',
      desc: '',
      args: [month, day, year],
    );
  }

  /// `Time`
  String get homeTime {
    return Intl.message(
      'Time',
      name: 'homeTime',
      desc: '',
      args: [],
    );
  }

  /// `Enable track`
  String get homeEnableTrack {
    return Intl.message(
      'Enable track',
      name: 'homeEnableTrack',
      desc: '',
      args: [],
    );
  }

  /// `Let's birding`
  String get homeBirding {
    return Intl.message(
      'Let\'s birding',
      name: 'homeBirding',
      desc: '',
      args: [],
    );
  }

  /// `Join a team`
  String get homeJoinTeam {
    return Intl.message(
      'Join a team',
      name: 'homeJoinTeam',
      desc: '',
      args: [],
    );
  }

  /// `Tianditu`
  String get mapNameTDT {
    return Intl.message(
      'Tianditu',
      name: 'mapNameTDT',
      desc: '',
      args: [],
    );
  }

  /// `OSM`
  String get mapNameOSM {
    return Intl.message(
      'OSM',
      name: 'mapNameOSM',
      desc: '',
      args: [],
    );
  }

  /// `Satellite`
  String get mapNameSat {
    return Intl.message(
      'Satellite',
      name: 'mapNameSat',
      desc: '',
      args: [],
    );
  }

  /// `Latitude: {lat}\nLongitude: {lon}\nAltitude: {alt}`
  String mapCoordinate(String lat, String lon, String alt) {
    return Intl.message(
      'Latitude: $lat\nLongitude: $lon\nAltitude: $alt',
      name: 'mapCoordinate',
      desc: '',
      args: [lat, lon, alt],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<BdL10n> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'zh'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<BdL10n> load(Locale locale) => BdL10n.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
