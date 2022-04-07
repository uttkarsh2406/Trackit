import 'package:flutter/material.dart';
import 'package:justforfun/Provider/Device.dart';
import 'package:justforfun/Provider/lab.dart';
import 'package:justforfun/Provider/labadmin.dart';
import 'package:provider/provider.dart';
import '../Provider/Devices.dart';

class EditDeviceScreen extends StatefulWidget {
  static const routeName = '/edit-Device';
  @override
  State<EditDeviceScreen> createState() => _State();
}

class _State extends State<EditDeviceScreen> {
  final _form = GlobalKey<FormState>();
  bool is_working = false;
  var _isload = false;
  var _editedDevice = Device(
    id: '',
    name: '',
    workingstatus: true,
    yearbought: '',
    expiryDate: '',
    supplierName: '',
    AMCDeadline: '',
    categry: '',
    labname: '',
  );

  var _init_values = {
    'name': '',
    'isworking': '',
    'year_of_bought': '',
    'expiry_date': '',
    'supplier_name': '',
    'AMCdeadline': '',
    'category': '',
    'labname':'',
  };

  void _saveform() {
    final is_valid = _form.currentState?.validate();
    if (!is_valid) {
      return;
    }
    _form.currentState?.save();
    _isload = true;
    if (_editedDevice.id.length != 0) {
      Provider.of<Devices>(context, listen: false)
          .updateDevice(_editedDevice.id, _editedDevice);
      setState(() {
        _isload = false;
      });
      Navigator.of(context).pop();
    } else {
      Provider.of<Devices>(context, listen: false)
          .addDevice(_editedDevice)
          .catchError((error) {
        return showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text('An Error Occured'),
            content: Text('Something Went Wrong!!'),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OKAY'))
            ],
          ),
        );
      }).then((_) {
        setState(() {
          _isload = false;
        });
        Navigator.of(context).pop();
      });
    }
  }

  @override
  void dispose() {
    // observer.unsubscribe(this);
    super.dispose();
  }

  bool _isint = true;
  @override
  void didChangeDependencies() {
    if (_isint) {
      final Device_id = ModalRoute.of(context)?.settings.arguments as String;
      if (Device_id != null) {
        _editedDevice =
            Provider.of<Devices>(context, listen: false).findById(Device_id);
        _init_values = {
          'name': _editedDevice.name,
          'isworking': _editedDevice.workingstatus.toString(),
          'year_of_bought': _editedDevice.yearbought,
          'expiry_date': _editedDevice.expiryDate,
          'supplier_name': _editedDevice.supplierName,
          'AMCdeadline': _editedDevice.AMCDeadline,
          'category': _editedDevice.categry,
          'labname':_editedDevice.labname,
        };
      }
    }
    _isint = false;
    super.didChangeDependencies();
  }

  @override
  // void didChangeDependencies() {
  //   print(123);
  //   if(_isint){
  //     final Device_id=ModalRoute.of(context)?.settings.arguments as String;
  //     if(Device_id!=null) {
  //       _editedDevice = Provider.of(context, listen: false).findById(Device_id);
  //       _init_values = {
  //         'name': _editedDevice.name,
  //         'isworking': _editedDevice.workingstatus.toString(),
  //         'year_of_bought': _editedDevice.yearbought,
  //         'expiry_date': _editedDevice.expiryDate,
  //         'supplier_name': _editedDevice.supplierName,
  //         'AMCdeadline': _editedDevice.AMCDeadline,
  //         'category': _editedDevice.categry,
  //
  //
  //       };
  //     }
  //   }
  //   _isint=false;
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Device'),
        actions: [
          IconButton(
            onPressed: _saveform,
            icon: Icon(Icons.save),
          ),
        ],
      ),
      body: _isload
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _form,
                child: ListView(
                  children: <Widget>[
                    TextFormField(
                      initialValue: _init_values['name'],
                      decoration: InputDecoration(labelText: 'Name'),
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) {},
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return 'Please Provide Name';
                        }
                        return null;
                      },
                      onSaved: (va) {
                        _editedDevice = Device(
                            id: _editedDevice.id,
                            name: va.toString(),
                            workingstatus: _editedDevice.workingstatus,
                            yearbought: _editedDevice.yearbought,
                            expiryDate: _editedDevice.expiryDate,
                            supplierName: _editedDevice.supplierName,
                            AMCDeadline: _editedDevice.AMCDeadline,
                            categry: _editedDevice.categry,
                            labname: _editedDevice.labname,
                        );
                      },
                    ),
                    CheckboxListTile(
                      title: Text('Is Device Working'),
                      value: is_working,
                      onChanged: (bool value) {
                        setState(() {
                          is_working = value;
                        });
                      },
                    ),
                    // TextFormField(
                    //   decoration: InputDecoration(labelText: 'Working Status'),
                    //   textInputAction: TextInputAction.next,
                    //   validator: (value){
                    //     if(value==true || value==false){
                    //       return null;
                    //     }
                    //     return "Please Provide Device Working Status";
                    //   },
                    //   onSaved: (va) {
                    //     _editedDevice = Device(
                    //         id: _editedDevice.id,
                    //         name: _editedDevice.name,
                    //         workingstatus: va != null ? true : false,
                    //         yearbought: _editedDevice.yearbought,
                    //         expiryDate: _editedDevice.expiryDate,
                    //         supplierName: _editedDevice.supplierName,
                    //         AMCDeadline: _editedDevice.AMCDeadline,
                    //         categry: _editedDevice.categry,
                    //         labdetail: _editedDevice.labdetail);
                    //   },
                    // ),
                    TextFormField(
                      initialValue: _init_values['year_of_bought'],
                      decoration: InputDecoration(labelText: 'Year of Bought'),
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        String k = value.toString();
                        // if(int.parse(k[0])>=0 && int.parse(k[0])<4){
                        //   return 'Please Provide a valid Date';
                        //
                        // }
                        return null;
                      },
                      onSaved: (va) {
                        _editedDevice = Device(
                            id: _editedDevice.id,
                            name: _editedDevice.name,
                            workingstatus: _editedDevice.workingstatus,
                            yearbought: va.toString(),
                            expiryDate: _editedDevice.expiryDate,
                            supplierName: _editedDevice.supplierName,
                            AMCDeadline: _editedDevice.AMCDeadline,
                            categry: _editedDevice.categry,
                          labname: _editedDevice.labname,);

                      },
                    ),
                    TextFormField(
                      initialValue: _init_values['expiry_date'],
                      decoration: InputDecoration(labelText: 'Expiry Date'),
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) {
                        _saveform();
                      },
                      // validator: (value){
                      //   String k=value.toString();
                      //   if(int.parse(k[0])>=0 && int.parse(k[0])<4){
                      //     return 'Please Provide a valid Date';
                      //
                      //   }
                      //   return null;
                      //
                      // },
                      onSaved: (va) {
                        _editedDevice = Device(
                            id: _editedDevice.id,
                            name: _editedDevice.name,
                            workingstatus: is_working,
                            yearbought: _editedDevice.yearbought,
                            expiryDate: va.toString(),
                            supplierName: _editedDevice.supplierName,
                            AMCDeadline: _editedDevice.AMCDeadline,
                            categry: va.toString(),
                          labname: _editedDevice.labname,);

                      },
                    ),
                    TextFormField(
                      initialValue: _init_values['supplier_name'],
                      decoration: InputDecoration(labelText: 'Supplier Name'),
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return "Please Provide Supplier Name";
                        }
                        return null;
                      },
                      onSaved: (va) {
                        _editedDevice = Device(
                            id: _editedDevice.id,
                            name: _editedDevice.name,
                            workingstatus: _editedDevice.workingstatus,
                            yearbought: _editedDevice.yearbought,
                            expiryDate: _editedDevice.expiryDate,
                            supplierName: va.toString(),
                            AMCDeadline: _editedDevice.AMCDeadline,
                            categry: _editedDevice.categry,
                          labname: _editedDevice.labname,);

                      },
                    ),
                    TextFormField(
                      initialValue: _init_values['AMCdeadline'],
                      decoration: InputDecoration(labelText: 'AMC Deadline'),
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) {},
                      // validator: (value){
                      //   String k=value.toString();
                      //   if(int.parse(k[0])>=0 && int.parse(k[0])<4){
                      //     return 'Please Provide a valid Date';
                      //
                      //   }
                      //   return null;
                      //
                      // },
                      onSaved: (va) {
                        _editedDevice = Device(
                            id: _editedDevice.id,
                            name: _editedDevice.name,
                            workingstatus: _editedDevice.workingstatus,
                            yearbought: _editedDevice.yearbought,
                            expiryDate: _editedDevice.expiryDate,
                            supplierName: _editedDevice.supplierName,
                            AMCDeadline: va.toString(),
                            categry: _editedDevice.categry,
                          labname: _editedDevice.labname,);

                      },
                    ),TextFormField(
                      initialValue: _init_values['AMCdeadline'],
                      decoration: InputDecoration(labelText: 'Corresponding Lab'),
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) {},
                      // validator: (value){
                      //   String k=value.toString();
                      //   if(int.parse(k[0])>=0 && int.parse(k[0])<4){
                      //     return 'Please Provide a valid Date';
                      //
                      //   }
                      //   return null;
                      //
                      // },
                      onSaved: (va) {
                        _editedDevice = Device(
                          id: _editedDevice.id,
                          name: _editedDevice.name,
                          workingstatus: _editedDevice.workingstatus,
                          yearbought: _editedDevice.yearbought,
                          expiryDate: _editedDevice.expiryDate,
                          supplierName: _editedDevice.supplierName,
                          AMCDeadline: _editedDevice.AMCDeadline,
                          categry: _editedDevice.categry,
                          labname: va.toString(),);

                      },
                    ),
                    TextFormField(
                      initialValue: _init_values['category'],
                      decoration: InputDecoration(labelText: 'Category'),
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return "Please Provide Supplier Name";
                        }
                        return null;
                      },
                      onSaved: (va) {
                        _editedDevice = Device(
                            id: _editedDevice.id,
                            name: _editedDevice.name,
                            workingstatus: is_working,
                            yearbought: _editedDevice.yearbought,
                            expiryDate: _editedDevice.expiryDate,
                            supplierName: _editedDevice.supplierName,
                            AMCDeadline: _editedDevice.AMCDeadline,
                            categry: va.toString(),
                          labname: _editedDevice.labname,);

                      },
                      onFieldSubmitted: (_) {
                        _saveform();
                      },
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
