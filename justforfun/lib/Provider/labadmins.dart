import 'package:flutter/cupertino.dart';
import 'package:justforfun/Provider/lab.dart';
import 'package:justforfun/screens/Device_detail_screen.dart';
import 'Device.dart';
import 'package:justforfun/Provider/labadmin.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class LabAdmins with ChangeNotifier {
  List<LabAdmin> _items = [

  ];

  List<LabAdmin> get items {
    return [..._items];
  }




  Future<void> addadmin(LabAdmin admin) async {
    final url = Uri.https(
        'just-do-it-d98ab-default-rtdb.firebaseio.com', '/devices.json');
    try {
      final value = await http.post(
        url,
        body: json.encode(
          {
            'username': admin.username,
            'password': admin.password,
          },
        ),
      );
      // print(json.decode(value.body));
      final newadmin = LabAdmin(
        username: admin.username,
        password: admin.password,
      );

      _items.add(newadmin);
      notifyListeners();
    } catch (error) {
      throw error;
    }

    // items.add();
  }

}
