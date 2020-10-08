import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fractastic/model/Class.dart';

class User {
  String email = '';
  String firstName = '';
  String lastName = '';
  Settings settings = Settings(allowPushNotifications: true);
  String guardianEmail = '';
  bool active = false;
  Timestamp lastOnlineTimestamp = Timestamp.now();
  String userID;
  String profilePictureURL =
      'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png';
  bool selected = false;
  String appIdentifier = 'Flutter Login Screen ${Platform.operatingSystem}';
  String userType = '';
  String password = '';
  List<Class> classList = [];

  User(
      {this.email,
      this.firstName,
      this.lastName,
      this.guardianEmail,
      this.active,
      this.lastOnlineTimestamp,
      this.settings,
      this.userID,
      this.profilePictureURL,
      this.userType,
      this.password,
      this.classList});

  get uid => this.userID;

  String fullName() {
    return '$firstName $lastName';
  }

  factory User.fromJson(Map<String, dynamic> parsedJson) {
    return new User(
        email: parsedJson['email'] ?? '',
        firstName: parsedJson['firstName'] ?? '',
        lastName: parsedJson['lastName'] ?? '',
        guardianEmail: parsedJson['guardianEmail'] ?? '',
        active: parsedJson['active'] ?? false,
        lastOnlineTimestamp: parsedJson['lastOnlineTimestamp'],
        settings: Settings.fromJson(
            parsedJson['settings'] ?? {'allowPushNotifications': true}),
        userID: parsedJson['id'] ?? parsedJson['userID'] ?? '',
        profilePictureURL: parsedJson['profilePictureURL'] ??
            "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",
        userType: parsedJson['userType'] ?? '',
        password: parsedJson['password'] ?? '',
        classList: parsedJson['classList'] ?? []);
  }

  Map<String, dynamic> toJson() {
    return {
      "email": this.email,
      "firstName": this.firstName,
      "lastName": this.lastName,
      "settings": this.settings.toJson(),
      "guardianEmail": this.guardianEmail,
      "id": this.userID,
      'active': this.active,
      'lastOnlineTimestamp': this.lastOnlineTimestamp,
      "profilePictureURL": this.profilePictureURL,
      'appIdentifier': this.appIdentifier,
      'userType': this.userType,
      'password': this.password,
      'classList': this.classList,
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
