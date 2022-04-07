import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
class QrcodeResult extends StatelessWidget {
  static const routename='/QrcodeResult';
  @override
  Widget build(BuildContext context) {
    String  result1=ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(title: Text('Qr Code Results'),),
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Card(
            elevation: 15,
            
            child: Container(
              child: Text(result1,style: TextStyle(height: 10,fontSize: 13),),
            ),
          ),
        ),
      ),

    );
  }
}
