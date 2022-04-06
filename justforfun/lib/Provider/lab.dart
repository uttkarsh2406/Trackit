import 'package:flutter/material.dart';
import 'package:justforfun/Provider/labadmin.dart';
import 'package:provider/provider.dart';

class Lab with ChangeNotifier{
  final String id;
  final String labname;
  final String department;
  final String username;
  final String password;

  Lab({
    this.id,
    this.labname,
    this.department,
    this.username,
    this.password,
});



}