// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:provider/provider.dart';

import '../Provider/Devices.dart';

class DeviceQRCode extends StatelessWidget {
  static const routename='/Qr-code';
  // final id;
  // DeviceQRCode({
  //   required this.id,
  // });
  @override
  Widget build(BuildContext context) {
    final Device_id=ModalRoute.of(context)?.settings.arguments as String;

    final loadedProduct=Provider.of<Devices>(context,listen: false).findById((Device_id));
    return Scaffold(
      appBar: AppBar(
        title: Text('Device QR Code'),
      ),
      body: Container(
        child:
          Column(
            children: [
              QrImage(
                data: 'Lab Id : ${loadedProduct.id}\n  Lab Name : ${loadedProduct.name}\n Working Status : ${loadedProduct.workingstatus}\n Year Of Bought : ${loadedProduct.yearbought}\n Expiry Date : ${loadedProduct.expiryDate}\n Supplier Name : ${loadedProduct.supplierName}\n AMC Deadline : ${loadedProduct.AMCDeadline}\n Device Category : ${ loadedProduct.categry}',
                version: QrVersions.auto,
                size: 320,
                gapless: false,
                embeddedImage: AssetImage('assets/images/my_embedded_image.png'),
                embeddedImageStyle: QrEmbeddedImageStyle(
                  size: Size(80, 80),
                ),
              ),
              ElevatedButton(onPressed: (){
                Navigator.of(context).pop();
              }, child: Text('Ok')),
            ],
          ),

      ),
    );
  }
}
