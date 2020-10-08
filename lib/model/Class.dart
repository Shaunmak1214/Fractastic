import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fractastic/model/User.dart';
import 'dart:convert';

class Class {
  String classId = '';
  String classCode = '';
  String name = '';
  String teacherId = '';
  Settings settings = Settings(allowPushNotifications: true);
  bool selected = false;
  String appIdentifier = 'Flutter Login Screen ${Platform.operatingSystem}';

  Class({
    this.classId,
    this.classCode,
    this.name,
    this.teacherId,
  });

  get cid => this.classId;

  factory Class.fromJson(Map<String, dynamic> parsedJson) {
    return new Class(
      classId: parsedJson['classId'] ?? '',
      classCode: parsedJson['classCode'] ?? '',
      name: parsedJson['name'] ?? '',
      teacherId: parsedJson['teacherId'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "classId": this.classId,
      "classCode": this.classCode,
      "name": this.name,
      "teacherId": this.teacherId,
    };
  }
}
