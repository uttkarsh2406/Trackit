import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
class QrcodeResult extends StatelessWidget {
  static const routename='/QrcodeResult';
  @override
  Widget build(BuildContext context) {
    String  result1=ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(title: Text('Qr Code Results'),),
      body: Container(
        child: Text(result1),
      ),

    );
  }
}
