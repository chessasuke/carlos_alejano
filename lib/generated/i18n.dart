// DO NOT EDIT. This is code generated via package:gen_lang/generate.dart

import 'dart:async';

import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import 'messages_all.dart';

class S {
 
  static const GeneratedLocalizationsDelegate delegate = GeneratedLocalizationsDelegate();

  static S of(BuildContext context) {
    final localization = Localizations.of<S>(context, S);
    
    assert(() {
      if (localization == null) {
        throw FlutterError(
            'S requested with a context that does not include S.');
      }
      return true;
    }());
    
    return localization!;
  }
  
  static Future<S> load(Locale locale) {
    final String name = locale.countryCode == null ? locale.languageCode : locale.toString();

    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return new S();
    });
  }
  
  String get appTitle {
    return Intl.message("Carlos Alejano", name: 'appTitle');
  }

  String get aboutTitle {
    return Intl.message("About", name: 'aboutTitle');
  }

  String get aboutContent {
    return Intl.message("About", name: 'aboutContent');
  }

  String get profileCardName {
    return Intl.message("Carlos Hevia Alejano", name: 'profileCardName');
  }

  String get profileCardPosition {
    return Intl.message("Software Engineer", name: 'profileCardPosition');
  }

  String get profileCardLocation {
    return Intl.message("Houston, TX", name: 'profileCardLocation');
  }

  String get aboutHello {
    return Intl.message("Hi, Carlos here", name: 'aboutHello');
  }

  String get aboutDescription {
    return Intl.message("I completed my Bachelor in Computer Science at the University of Texas Rio Grande Valley in 2019. Then I moved to Dallas to study for a Master of Science in Software Engineering at the University of Texas at Dallas. After graduation, I landed a couple of jobs working on Flutter, the technology that I enjoy the most working on.\n\nI am also a chess Grandmaster, before coming to the US in 2015, I was a professional chess player and part of the Cuban National Chess Team. In my free time (if I am not experimenting with Flutter or playing chess) I play racquetball or watch anime.", name: 'aboutDescription');
  }

  String get resumeOpenPdf {
    return Intl.message("Open PDF Resume", name: 'resumeOpenPdf');
  }

  String get resumeExperienceTitle {
    return Intl.message("Experience", name: 'resumeExperienceTitle');
  }


}

class GeneratedLocalizationsDelegate extends LocalizationsDelegate<S> {
  const GeneratedLocalizationsDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
			Locale("en", ""),

    ];
  }

  LocaleListResolutionCallback listResolution({Locale? fallback}) {
    return (List<Locale>? locales, Iterable<Locale> supported) {
      if (locales == null || locales.isEmpty) {
        return fallback ?? supported.first;
      } else {
        return _resolve(locales.first, fallback, supported);
      }
    };
  }

  LocaleResolutionCallback resolution({Locale? fallback}) {
    return (Locale? locale, Iterable<Locale> supported) {
      return _resolve(locale, fallback, supported);
    };
  }

  Locale _resolve(Locale? locale, Locale? fallback, Iterable<Locale> supported) {
    if (locale == null || !isSupported(locale)) {
      return fallback ?? supported.first;
    }

    final Locale languageLocale = Locale(locale.languageCode, "");
    if (supported.contains(locale)) {
      return locale;
    } else if (supported.contains(languageLocale)) {
      return languageLocale;
    } else {
      final Locale fallbackLocale = fallback ?? supported.first;
      return fallbackLocale;
    }
  }

  @override
  Future<S> load(Locale locale) {
    return S.load(locale);
  }

  @override
  bool isSupported(Locale? locale) =>
    locale != null && supportedLocales.contains(locale);

  @override
  bool shouldReload(GeneratedLocalizationsDelegate old) => false;
}

// ignore_for_file: unnecessary_brace_in_string_interps
