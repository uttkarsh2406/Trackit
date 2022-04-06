import 'package:flutter/material.dart';
import 'package:justforfun/screens/Device_QR_code.dart';
import 'package:provider/provider.dart';
import 'package:justforfun/Provider/Devices.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:justforfun/Provider/Labs.dart';

class LabDetail extends StatelessWidget {
  // final String title;
  // LabDetail(this.title);
  String hel = '';
  static const routename = '/Lab-detail';
  @override
  Widget build(BuildContext context) {
    final Device_id = ModalRoute.of(context)?.settings.arguments as String;

    final loadedProduct = Provider.of<Labs>(
      context,
      listen: false,
    ).findbyid(Device_id);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.labname),
      ),
      body: ListView(
        children: [
          Container(
            // height: double.infinity,
            // width: double.infinity,
            child: Column(
              children: [
                // Expanded(child: Text('', style: TextStyle(height: 3.0, fontSize: 15.2, fontWeight: FontWeight.bold,))),
                SizedBox(
                  width: double.infinity,
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: Text(
                      'Lab Name : ${loadedProduct.labname}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          height: 1,
                          fontSize: 20,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Text(
                          'Lab id \: ${loadedProduct.id.substring(1,7)}',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              height: 1,
                              fontSize: 20,
                              fontWeight: FontWeight.normal),
                        ),

                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: Text(
                      'Department \: ${loadedProduct.department}',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          height: 1,
                          fontSize: 20,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: Text(
                      'Username \: ${loadedProduct.username}',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          height: 1,
                          fontSize: 20,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: Text(
                      'Password \: ${loadedProduct.password}',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          height: 1,
                          fontSize: 20,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
