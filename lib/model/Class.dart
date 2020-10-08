import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fractastic/model/User.dart';

class Class {
  String classCode;
  String name;
  List<User> studentList;
  Settings settings = Settings(allowPushNotifications: true);
  bool selected = false;
  String appIdentifier = 'Flutter Login Screen ${Platform.operatingSystem}';

  Class({
    this.classCode,
    this.name,
    this.studentList,
    this.settings,
  });

  get cid => this.classCode;

  factory Class.fromJson(Map<String, dynamic> parsedJson) {
    return new Class(
      classCode: parsedJson['classCode'] ?? '',
      name: parsedJson['name'] ?? '',
      settings: Settings.fromJson(
          parsedJson['settings'] ?? {'allowPushNotifications': true}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "classCode": this.classCode,
      "name": this.name,
      "settings": this.settings.toJson(),
    };
  }
}

class Settings {
  bool allowPushNotifications = true;

  Settings({this.allowPushNotifications});

  factory Settings.fromJson(Map<dynamic, dynamic> parsedJson) {
    return new Settings(
        allowPushNotifications: parsedJson['allowPushNotifications'] ?? true);
  }

  Map<String, dynamic> toJson() {
    return {'allowPushNotifications': this.allowPushNotifications};
  }
}
