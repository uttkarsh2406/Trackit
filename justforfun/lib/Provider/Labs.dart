import 'package:flutter/cupertino.dart';
import 'package:justforfun/Provider/Device.dart';
import 'package:justforfun/Provider/lab.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class Labs with ChangeNotifier{
  List<Lab> _items=[
    Lab(
      labname: 'ssl',
      department: 'cse',
      username: '124',
      password: '34',
    )
  ];
  final String authtoken;
  Labs(this.authtoken,this._items);



  List<Lab> get items{
    return [..._items];

  }
  Lab findbyid(String id){
    return _items.firstWhere((element) => element.id==id);
  }

  Future<void> fetchlab()async{
    final url=Uri.parse('https://just-do-it-d98ab-default-rtdb.firebaseio.com/labs.json');
    try {
      final value = await http.get(url);
      final List<Lab>loaded_devices=[];
      final extdata=json.decode(value.body) as Map<String,dynamic>;
      extdata.forEach((key, value) {
        loaded_devices.add(Lab(
          id: key,
          labname: value['labname'],
          department: value['department'],
          username: value['username'],
          password: value['password'],
        ));
      });
      _items=loaded_devices;
      notifyListeners();

    }
    catch(error){
      throw(error);
    }
  }

  Future<void> addLab(Lab lab) async {
    final url = Uri.https(
        'just-do-it-d98ab-default-rtdb.firebaseio.com', '/labs.json');
    try {
      final value = await http.post(
        url,
        body: json.encode(
          {
            'labname': lab.labname,
            'department': lab.department,
            'username': lab.username,
            'password': lab.password,
          },
        ),
      );
      // print(json.decode(value.body));
      final newlab = Lab(
        id: json.decode(value.body)['name'].toString(),
        labname: lab.labname,
        department: lab.department,
        username: lab.username,
        password: lab.password,
      );

      _items.add(newlab);
      notifyListeners();
    } catch (error) {
      throw error;
    }

    // items.add();
  }
  Future<void> updateLab(String id, Lab l) async{

    final index = _items.indexWhere((element) => element.id == id);
    if (index >= 0) {
      final url=Uri.parse('https://just-do-it-d98ab-default-rtdb.firebaseio.com/labs/$id.json');
      try {
        await http.patch(url, body: json.encode({
          'labname': l.labname,
          'yearbought': l.department,
          'username': l.username,
          'password': l.password,
        }));
        _items[index] = l;
        notifyListeners();

      }catch(error){
        throw error;
      }
    } else {
      print('...');
    }

  }
  void deleteLab(String id) {
    final url=Uri.parse('https://just-do-it-d98ab-default-rtdb.firebaseio.com/labs/$id.json');
    final exitingpr=_items.indexWhere((element) => element.id==id);
    final exitingdev=_items[exitingpr];
    _items.remove(exitingdev);
    http.delete(url).catchError((error){
      _items.insert(exitingpr, exitingdev);
      notifyListeners();
    });
    notifyListeners();
  }


}