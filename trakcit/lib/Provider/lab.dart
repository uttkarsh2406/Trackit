import 'package:flutter/material.dart';
import 'package:trakcit/Model/labadmin.dart';

class Lab with ChangeNotifier{
  final String id;
  final String labname;
  final String department;
  LabAdmin admin;

  Lab({
    required this.id,
    required this.labname,
    required this.department,
    required this.admin,
});
}