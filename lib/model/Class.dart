import 'dart:io';
import 'package:fractastic/model/User.dart';

class Class {
  String classCode = '';
  String name = '';
  String teacherId = '';
  Settings settings = Settings(allowPushNotifications: true);
  bool selected = false;
  String appIdentifier = 'Flutter Login Screen ${Platform.operatingSystem}';

  Class({
    this.classCode,
    this.name,
    this.teacherId,
  });

  get cid => this.classCode;

  factory Class.fromJson(Map<String, dynamic> parsedJson) {
    return new Class(
      classCode: parsedJson['classCode'] ?? '',
      name: parsedJson['name'] ?? '',
      teacherId: parsedJson['teacherId'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "classCode": this.classCode,
      "name": this.name,
      "teacherId": this.teacherId,
    };
  }
}
