import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:matrix/matrix.dart';

import 'package:fluffychat/pangea/constants/model_keys.dart';
import 'package:fluffychat/pangea/utils/error_handler.dart';
import '../constants/class_default_values.dart';
import '../constants/language_keys.dart';
import '../constants/pangea_event_types.dart';
import 'language_model.dart';

class ClassSettingsModel {
  String? city;
  String? country;
  String? schoolName;
  int? languageLevel;
  String dominantLanguage;
  String targetLanguage;

  ClassSettingsModel({
    this.dominantLanguage = ClassDefaultValues.defaultDominantLanguage,
    this.targetLanguage = ClassDefaultValues.defaultTargetLanguage,
    this.languageLevel,
    this.city,
    this.country,
    this.schoolName,
  });

  static ClassSettingsModel get newClass => ClassSettingsModel(
        city: null,
        country: null,
        dominantLanguage: ClassDefaultValues.defaultDominantLanguage,
        languageLevel: null,
        schoolName: null,
        targetLanguage: ClassDefaultValues.defaultTargetLanguage,
      );

  factory ClassSettingsModel.fromJson(Map<String, dynamic> json) {
    return ClassSettingsModel(
      city: json['city'],
      country: json['country'],
      dominantLanguage: LanguageModel.codeFromNameOrCode(
        json['dominant_language'] ?? LanguageKeys.unknownLanguage,
      ),
      targetLanguage: LanguageModel.codeFromNameOrCode(
        json['target_language'] ?? LanguageKeys.unknownLanguage,
      ),
      languageLevel: json['language_level'],
      schoolName: json['school_name'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    try {
      data['city'] = city;
      data['country'] = country;
      //check for and do "english" => en and "spanish" => es
      data['dominant_language'] = dominantLanguage;
      //check for and do "english" => en and "spanish" => es
      data['target_language'] = targetLanguage;
      data['language_level'] = languageLevel;
      data['school_name'] = schoolName;
      return data;
    } catch (e, s) {
      debugger(when: kDebugMode);
      ErrorHandler.logError(e: e, s: s);
      return data;
    }
  }

  //TODO: define enum with all possible values
  updateEditableClassField(String key, dynamic value) {
    switch (key) {
      case ModelKey.clientClassCity:
        city = value;
        break;
      case ModelKey.clientClassCountry:
        country = value;
        break;
      case ModelKey.clientClassDominantLanguage:
        dominantLanguage = value;
        break;
      case ModelKey.clientClassTargetLanguage:
        targetLanguage = value;
        break;
      case ModelKey.clientLanguageLevel:
        languageLevel = value;
        break;
      case ModelKey.clientSchool:
        schoolName = value;
        break;
      default:
        throw Exception('Invalid key for setting permissions - $key');
    }
  }

  StateEvent get toStateEvent => StateEvent(
        content: toJson(),
        type: PangeaEventTypes.classSettings,
      );
}

class PangeaRoomRules {
  // int? pangeaClassID; // this is id our database
  bool isPublic;
  bool isOpenEnrollment;
  bool oneToOneChatClass;
  bool isCreateRooms;
  bool isShareVideo;
  bool isSharePhoto;
  bool isShareFiles;
  bool isShareLocation;
  bool isCreateStories;
  bool isVoiceNotes;
  bool isInviteOnlyStudents;
  // 0 = forbidden, 1 = allow individual to choose, 2 = require
  int interactiveTranslator;
  int interactiveGrammar;
  int immersionMode;
  int definitions;
  int translations;

  PangeaRoomRules({
    this.isPublic = false,
    this.isOpenEnrollment = false,
    this.oneToOneChatClass = true,
    this.isCreateRooms = true,
    this.isShareVideo = true,
    this.isSharePhoto = true,
    this.isShareFiles = true,
    this.isShareLocation = false,
    this.isCreateStories = false,
    this.isVoiceNotes = true,
    this.isInviteOnlyStudents = true,
    this.interactiveTranslator = ClassDefaultValues.languageToolPermissions,
    this.interactiveGrammar = ClassDefaultValues.languageToolPermissions,
    this.immersionMode = ClassDefaultValues.languageToolPermissions,
    this.definitions = ClassDefaultValues.languageToolPermissions,
    this.translations = ClassDefaultValues.languageToolPermissions,
  });

  updatePermission(String key, bool value) {
    switch (key) {
      case 'isPublic':
        isPublic = value;
        break;
      case 'isOpenEnrollment':
        isOpenEnrollment = value;
        break;
      case 'oneToOneChatClass':
        oneToOneChatClass = value;
        break;
      case 'isCreateRooms':
        isCreateRooms = value;
        break;
      case 'isShareVideo':
        isShareVideo = value;
        break;
      case 'isSharePhoto':
        isSharePhoto = value;
        break;
      case 'isShareFiles':
        isShareFiles = value;
        break;
      case 'isShareLocation':
        isShareLocation = value;
        break;
      case 'isCreateStories':
        isCreateStories = value;
        break;
      case 'isVoiceNotes':
        isVoiceNotes = value;
        break;
      case 'isInviteOnlyStudents':
        isInviteOnlyStudents = value;
        break;
      default:
        throw Exception('Invalid key for setting permissions - $key');
    }
  }

  setLanguageToolSetting(ToolSetting setting, int value) {
    switch (setting) {
      case ToolSetting.interactiveTranslator:
        interactiveTranslator = value;
        break;
      case ToolSetting.interactiveGrammar:
        interactiveGrammar = value;
        break;
      case ToolSetting.immersionMode:
        immersionMode = value;
        break;
      case ToolSetting.definitions:
        definitions = value;
        break;
      case ToolSetting.translations:
        translations = value;
        break;
      default:
        throw Exception('Invalid key for setting permissions - $setting');
    }
  }

  StateEvent get toStateEvent => StateEvent(
        content: toJson(),
        type: PangeaEventTypes.rules,
      );

  factory PangeaRoomRules.fromJson(Map<String, dynamic> json) =>
      PangeaRoomRules(
        // pangeaClassID: json['pangea_class'];
        isPublic: json['is_public'],
        isOpenEnrollment: json['is_open_enrollment'],
        oneToOneChatClass: json['one_to_one_chat_class'],
        isCreateRooms: json['is_create_rooms'],
        isShareVideo: json['is_share_video'],
        isSharePhoto: json['is_share_photo'],
        isShareFiles: json['is_share_files'],
        isShareLocation: json['is_share_location'],
        isCreateStories: json['is_create_stories'],
        isVoiceNotes: json['is_voice_notes'],
        isInviteOnlyStudents: json['is_invite_only_students'] ?? true,
        interactiveTranslator: json['interactive_translator'] ??
            ClassDefaultValues.languageToolPermissions,
        interactiveGrammar: json['interactive_grammar'] ??
            ClassDefaultValues.languageToolPermissions,
        immersionMode: json['immersion_mode'] ??
            ClassDefaultValues.languageToolPermissions,
        definitions:
            json['definitions'] ?? ClassDefaultValues.languageToolPermissions,
        translations:
            json['translations'] ?? ClassDefaultValues.languageToolPermissions,
      );

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    // data['pangea_class'] = pangeaClassID;
    data['is_public'] = isPublic;
    data['is_open_enrollment'] = isOpenEnrollment;
    data['one_to_one_chat_class'] = oneToOneChatClass;
    data['is_create_rooms'] = isCreateRooms;
    data['is_share_video'] = isShareVideo;
    data['is_share_photo'] = isSharePhoto;
    data['is_share_files'] = isShareFiles;
    data['is_share_location'] = isShareLocation;
    data['is_create_stories'] = isCreateStories;
    data['is_voice_notes'] = isVoiceNotes;
    data['is_invite_only_students'] = isInviteOnlyStudents;
    data['interactive_translator'] = interactiveTranslator;
    data['interactive_grammar'] = interactiveGrammar;
    data['immersion_mode'] = immersionMode;
    data['definitions'] = definitions;
    data['translations'] = translations;
    return data;
  }

  int getToolSettings(ToolSetting setting) {
    switch (setting) {
      case ToolSetting.interactiveTranslator:
        return interactiveTranslator;
      case ToolSetting.interactiveGrammar:
        return interactiveGrammar;
      case ToolSetting.immersionMode:
        return immersionMode;
      case ToolSetting.definitions:
        return definitions;
      case ToolSetting.translations:
        return translations;
      default:
        throw Exception('Invalid key for setting permissions - $setting');
    }
  }

  String languageToolPermissionsText(
    BuildContext context,
    ToolSetting setting,
  ) {
    switch (getToolSettings(setting)) {
      case 0:
        return L10n.of(context)!.interactiveTranslatorNotAllowed;
      case 1:
        return L10n.of(context)!.interactiveTranslatorAllowed;
      case 2:
        return L10n.of(context)!.interactiveTranslatorRequired;
      default:
        return L10n.of(context)!.notYetSet;
    }
  }
}

enum ToolSetting {
  interactiveTranslator,
  itAutoPlay,
  interactiveGrammar,
  immersionMode,
  definitions,
  translations,
}

extension SettingCopy on ToolSetting {
  String toolName(BuildContext context) {
    switch (this) {
      case ToolSetting.interactiveTranslator:
        return L10n.of(context)!.interactiveTranslatorSliderHeader;
      case ToolSetting.itAutoPlay:
        return L10n.of(context)!.interactiveTranslatorAutoPlaySliderHeader;
      case ToolSetting.interactiveGrammar:
        return L10n.of(context)!.interactiveGrammarSliderHeader;
      case ToolSetting.immersionMode:
        return L10n.of(context)!.toggleImmersionMode;
      case ToolSetting.definitions:
        return L10n.of(context)!.definitionsToolName;
      case ToolSetting.translations:
        return L10n.of(context)!.messageTranslationsToolName;
    }
  }

  //use l10n to get tool name
  String toolDescription(BuildContext context) {
    switch (this) {
      case ToolSetting.interactiveTranslator:
        return L10n.of(context)!.itToggleDescription;
      case ToolSetting.interactiveGrammar:
        return L10n.of(context)!.igcToggleDescription;
      case ToolSetting.itAutoPlay:
        return L10n.of(context)!.interactiveTranslatorAutoPlayDesc;
      case ToolSetting.immersionMode:
        return L10n.of(context)!.toggleImmersionModeDesc;
      case ToolSetting.definitions:
        return L10n.of(context)!.definitionsToolDescription;
      case ToolSetting.translations:
        return L10n.of(context)!.translationsToolDescrption;
    }
  }
}
