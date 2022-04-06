import 'package:flutter/material.dart';
import 'package:firebasetrial/screens/Device_QR_code.dart';
import 'package:provider/provider.dart';
import 'package:firebasetrial/Provider/Devices.dart';

class LabDetail extends StatelessWidget {
  // final String title;
  // LabDetail(this.title);
  String hel = '';
  static const routename = '/Lab-detail';
  @override
  Widget build(BuildContext context) {
    final Device_id = ModalRoute.of(context)?.settings.arguments as String;

    final loadedProduct = Provider.of<Devices>(
      context,
      listen: false,
    ).findById(Device_id);
    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProduct.name),
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
                      'Lab Name : ${loadedProduct.name}',
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
                          'Lab id \: ${loadedProduct.id}',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              height: 1,
                              fontSize: 20,
                              fontWeight: FontWeight.normal),
                        ),
                        Spacer(),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pushNamed(
                                  DeviceQRCode.routename,
                                  arguments: loadedProduct.id);
                            },
                            child: Text("Show QR Code"))
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: Text(
                      'Working Status \: ${loadedProduct.workingstatus}',
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
                      'Year of Bought \: ${loadedProduct.yearbought}',
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
                      'Expiry Date \: ${loadedProduct.expiryDate}',
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
                      'Supplier Name \: ${loadedProduct.supplierName}',
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
                      'Amc Deadline \: ${loadedProduct.AMCDeadline}',
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
                      'Device Category \: ${loadedProduct.categry}',
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
