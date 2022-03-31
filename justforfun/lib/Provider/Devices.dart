import 'package:flutter/cupertino.dart';
import 'package:justforfun/Provider/lab.dart';
import 'Device.dart';
import 'package:justforfun/Model/labadmin.dart';


class Devices with ChangeNotifier{
  List<Device>_items=[
    Device(
      id: '123',
      name : 'Printer',
      workingstatus: false,
      yearbought: '29-03-2000',
      expiryDate: '29-03-3000',
      supplierName: 'Rishabh',
      AMCDeadline: '29-03',
      categry: 'Printer',
      labdetail: Lab(id: '1234',labname: 'SSl',department: 'CSE',admin: LabAdmin(username:'a', password: 'a')),

    ),
    Device(
      id: '124',
      name : 'Printer',
      workingstatus: false,
      yearbought: '29-03-2000',
      expiryDate: '29-03-3000',
      supplierName: 'Rishabh',
      AMCDeadline: '29-03',
      categry: 'Printer',
      labdetail: Lab(id: '1234',labname: 'SSl',department: 'CSE',admin: LabAdmin(username:'a', password: 'a')),


    ),
    Device(
      id: '125',
      name : 'Printer',
      workingstatus: false,
      yearbought: '29-03-2000',
      expiryDate: '29-03-3000',
      supplierName: 'Rishabh',
      AMCDeadline: '29-03',
      categry: 'Printer',
      labdetail: Lab(id: '1234',labname: 'SSl',department: 'CSE',admin: LabAdmin(username:'a', password: 'a')),


    ),
    Device(
      id: '126',
      name : 'Printer',
      workingstatus: false,
      yearbought: '29-03-2000',
      expiryDate: '29-03-3000',
      supplierName: 'Rishabh',
      AMCDeadline: '29-03',
      categry: 'Printer',
      labdetail: Lab(id: '1234',labname: 'SSl',department: 'CSE',admin: LabAdmin(username:'a', password: 'a')),


    ),
    Device(
      id: '127',
      name : 'Printer',
      workingstatus: false,
      yearbought: '29-03-2000',
      expiryDate: '29-03-3000',
      supplierName: 'Rishabh',
      AMCDeadline: '29-03',
      categry: 'Printer',
      labdetail: Lab(id: '1234',labname: 'SSl',department: 'CSE',admin: LabAdmin(username:'a', password: 'a')),

    ),


  ];

  List<Device> get items{
    return [..._items];
  }
  Device findById(String id){
    return _items.firstWhere((prod) => prod.id==id);
  }

  void addDevice(Device device){
    // items.add();
    final newdevice=Device(id:'123'.toString(),name: device.name,workingstatus: device.workingstatus,yearbought: device.yearbought,expiryDate: device.expiryDate,AMCDeadline: device.AMCDeadline,supplierName: device.supplierName,categry: device.categry, labdetail: device.labdetail);
    print(_items.length);
    _items.add(newdevice);
    print(_items.length);
    notifyListeners();

  }
  void updateDevice(String id,Device d){
    final index=_items.indexWhere((element) => element.id==id);
    if(index>=0){
      _items[index]=d;
      notifyListeners();
    }
    else{
      print('...');
    }
  }
  void deleteDevice(String id){
    _items.removeWhere((prod)=>prod.id==id);
    notifyListeners();
  }

}