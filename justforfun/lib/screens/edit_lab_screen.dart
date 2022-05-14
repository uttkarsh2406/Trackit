import 'package:flutter/material.dart';
import 'package:justforfun/Provider/Device.dart';
import 'package:justforfun/Provider/lab.dart';
import 'package:justforfun/Provider/labadmin.dart';
import 'package:justforfun/Provider/labadmins.dart';
import 'package:provider/provider.dart';
import '../Provider/Labs.dart';
import 'package:justforfun/Provider/Labs.dart';

class EditLabScreen extends StatefulWidget {
  static const routeName = '/edit-lab';
  @override
  State<EditLabScreen> createState() => _State();
}

class _State extends State<EditLabScreen> {
  final _form = GlobalKey<FormState>();
  var _isload = false;
  var _editedLab = Lab(
    id: '',
    labname: '',
    department: '',
    username: '',
    password: '',
  );
  var _editedadmin=LabAdmin(
    username:'',
    password: '',
  );

  var _init_values = {
    'labname': '',
    'department': '',
    'username': '',
    'password': '',
  };

  void _saveform() {
    final is_valid = _form.currentState?.validate();
    if (!is_valid) {
      return;
    }
    _form.currentState?.save();
    _isload = true;
    if (_editedLab.id.length != 0) {
      Provider.of<Labs>(context, listen: false)
          .updateLab(_editedLab.id, _editedLab);
      setState(() {
        _isload = false;
      });
      Navigator.of(context).pop();
    } else {
      Provider.of<Labs>(context, listen: false)
          .addLab(_editedLab)
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
      final lab_id = ModalRoute.of(context)?.settings.arguments as String;
      if (lab_id != null) {
        _editedLab =
            Provider.of<Labs>(context, listen: false).findbyid(lab_id);
        _init_values = {
          'labname': _editedLab.labname,
          'department': _editedLab.department,
          'username': _editedLab.username,
          'password': _editedLab.password
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
  //       _editedLab = Provider.of(context, listen: false).findById(Device_id);
  //       _init_values = {
  //         'name': _editedLab.name,
  //         'isworking': _editedLab.workingstatus.toString(),
  //         'year_of_bought': _editedLab.yearbought,
  //         'expiry_date': _editedLab.expiryDate,
  //         'supplier_name': _editedLab.supplierName,
  //         'AMCdeadline': _editedLab.AMCDeadline,
  //         'category': _editedLab.categry,
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
        title: Text('Edit Lab'),
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
                      initialValue: _init_values['labname'],
                      decoration: InputDecoration(labelText: 'Lab Name'),
                      textInputAction: TextInputAction.next,
                      onFieldSubmitted: (_) {},
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return 'Please Provide Name';
                        }
                        return null;
                      },
                      onSaved: (va) {
                        _editedLab = Lab(
                          id: _editedLab.id,
                          labname: va.toString(),
                          department: _editedLab.department,
                          username: _editedLab.username,
                          password: _editedLab.password,
                        );
                      },
                    ),
                    TextFormField(
                      initialValue: _init_values['department'],
                      decoration: InputDecoration(labelText: 'Department'),
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
                        _editedLab = Lab(
                          id: _editedLab.id,
                          labname: _editedLab.labname,
                          department: va.toString(),
                          username: _editedLab.username,
                          password: _editedLab.password,
                        );
                      },
                    ),
                    TextFormField(
                      initialValue: _init_values['username'],
                      decoration:
                          InputDecoration(labelText: 'Lab Admin Username'),
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
                        _editedLab = Lab(
                          id: _editedLab.id,
                          labname: _editedLab.labname,
                          department: _editedLab.department,
                          username: va.toString(),
                          password: _editedLab.password,
                        );
                        _editedadmin=LabAdmin(
                          username: va.toString(),
                          password: _editedadmin.password,
                        );
                      },
                    ),
                    TextFormField(
                      initialValue: _init_values['password'],
                      decoration:
                          InputDecoration(labelText: 'Lab Admin Password'),
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value.toString().isEmpty) {
                          return "Please Provide Supplier Name";
                        }
                        return null;
                      },
                      onSaved: (va) {
                        _editedLab = Lab(
                          id: _editedLab.id,
                          labname: _editedLab.labname,
                          department: _editedLab.department,
                          username: _editedLab.username,
                          password: va.toString(),
                        );
                        _editedadmin=LabAdmin(
                          username: _editedadmin.username,
                          password: va.toString(),
                        );
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
