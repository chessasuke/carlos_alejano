// DO NOT EDIT. This is code generated via package:gen_lang/generate.dart

import 'dart:async';

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';
// ignore: implementation_imports
import 'package:intl/src/intl_helpers.dart';

final _$en = $en();

class $en extends MessageLookupByLibrary {
  get localeName => 'en';
  
  final messages = {
		"appTitle" : MessageLookupByLibrary.simpleMessage("Carlos Alejano"),
		"aboutTitle" : MessageLookupByLibrary.simpleMessage("About"),
		"aboutContent" : MessageLookupByLibrary.simpleMessage("About"),
		"profileCardName" : MessageLookupByLibrary.simpleMessage("Carlos Hevia Alejano"),
		"profileCardPosition" : MessageLookupByLibrary.simpleMessage("Software Engineer"),
		"profileCardLocation" : MessageLookupByLibrary.simpleMessage("Houston, TX"),
		"aboutHello" : MessageLookupByLibrary.simpleMessage("Hi, Carlos here"),
		"aboutDescription" : MessageLookupByLibrary.simpleMessage("I completed my Bachelor in Computer Science at the University of Texas Rio Grande Valley in 2019. Then I moved to Dallas to study for a Master of Science in Software Engineering at the University of Texas at Dallas. After graduation, I landed a couple of jobs working on Flutter, the technology that I enjoy the most working on.\n\nI am also a chess Grandmaster, before coming to the US in 2015, I was a professional chess player and part of the Cuban National Chess Team. In my free time (if I am not experimenting with Flutter or playing chess) I play racquetball or watch anime."),
		"resumeOpenPdf" : MessageLookupByLibrary.simpleMessage("Open PDF Resume"),
		"resumeExperienceTitle" : MessageLookupByLibrary.simpleMessage("Experience"),

  };
}



typedef Future<dynamic> LibraryLoader();
Map<String, LibraryLoader> _deferredLibraries = {
	"en": () => Future.value(null),

};

MessageLookupByLibrary? _findExact(localeName) {
  switch (localeName) {
    case "en":
        return _$en;

    default:
      return null;
  }
}

/// User programs should call this before using [localeName] for messages.
Future<bool> initializeMessages(String localeName) async {
  var availableLocale = Intl.verifiedLocale(
      localeName,
          (locale) => _deferredLibraries[locale] != null,
      onFailure: (_) => null);
  if (availableLocale == null) {
    return Future.value(false);
  }
  var lib = _deferredLibraries[availableLocale];
  await (lib == null ? Future.value(false) : lib());

  initializeInternalMessageLookup(() => CompositeMessageLookup());
  messageLookup.addLocale(availableLocale, _findGeneratedMessagesFor);

  return Future.value(true);
}

bool _messagesExistFor(String locale) {
  try {
    return _findExact(locale) != null;
  } catch (e) {
    return false;
  }
}

MessageLookupByLibrary? _findGeneratedMessagesFor(locale) {
  var actualLocale = Intl.verifiedLocale(locale, _messagesExistFor,
      onFailure: (_) => null);
  if (actualLocale == null) return null;
  return _findExact(actualLocale);
}

// ignore_for_file: unnecessary_brace_in_string_interps
