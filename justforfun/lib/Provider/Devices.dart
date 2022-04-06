import 'package:flutter/cupertino.dart';
import 'package:justforfun/Provider/lab.dart';
import 'package:justforfun/screens/Device_detail_screen.dart';
import 'Device.dart';
import 'package:justforfun/Provider/labadmin.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class Devices with ChangeNotifier {
  final String authtoken;
  List<Device> _items = [];
  Devices(this.authtoken,this._items);

  List<Device> get items {
    return [..._items];
  }

  Device findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }



  Future<void> fetchdevice() async{
    final url=Uri.parse('https://just-do-it-d98ab-default-rtdb.firebaseio.com/devices.json');
    try {
      final value = await http.get(url);
      final List<Device>loaded_devices=[];
      final extdata=json.decode(value.body) as Map<String,dynamic>;
      extdata.forEach((key, value) {
        loaded_devices.add(Device(
          id: key,
          name: value['name'],
          workingstatus: true,
          yearbought: value['yearbought'],
          expiryDate: value['expiryDate'],
          AMCDeadline: value['AMCDeadline'],
          categry: value['categry'],
          supplierName: value['supplierName'],
          labname: value['labname'],
        ));
      });
      _items=loaded_devices;
      notifyListeners();

    }
    catch(error){
      throw(error);
    }
  }
  Future<void> addDevice(Device device) async {
    final url = Uri.https(
        'just-do-it-d98ab-default-rtdb.firebaseio.com', '/devices.json');
    try {
      final value = await http.post(
        url,
        body: json.encode(
          {
            'name': device.name,
            'workingstatus': '1',
            'yearbought': device.yearbought,
            'expiryDate': device.expiryDate,
            'AMCDeadline': device.AMCDeadline,
            'supplierName': device.supplierName,
            'categry': device.categry,
            'labname':device.labname,
          },
        ),
      );
      // print(json.decode(value.body));
      final newdevice = Device(
        id: json.decode(value.body)['name'].toString().substring(2, 6),
        name: device.name,
        workingstatus: device.workingstatus,
        yearbought: device.yearbought,
        expiryDate: device.expiryDate,
        AMCDeadline: device.AMCDeadline,
        supplierName: device.supplierName,
        categry: device.categry,
        labname: device.labname,

      );

      _items.add(newdevice);
      notifyListeners();
    } catch (error) {
      throw error;
    }

    // items.add();
  }

  Future<void> updateDevice(String id, Device d) async{

    final index = _items.indexWhere((element) => element.id == id);
    if (index >= 0) {
      final url=Uri.parse('https://just-do-it-d98ab-default-rtdb.firebaseio.com/devices/$id.json');
     try {
       await http.patch(url, body: json.encode({
         'name': d.name,
         'workingstatus': '1',
         'yearbought': d.yearbought,
         'expiryDate': d.expiryDate,
         'AMCDeadline': d.AMCDeadline,
         'supplierName': d.supplierName,
         'categry': d.categry,
         'labname':d.labname,
       }));
       _items[index] = d;
       notifyListeners();

    }catch(error){
       throw error;
     }
    } else {
      print('...');
    }
  }

  void deleteDevice(String id) {
    final url=Uri.parse('https://just-do-it-d98ab-default-rtdb.firebaseio.com/devices/$id.json');
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
