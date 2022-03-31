import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/scheduler.dart';
class ScanQR extends StatefulWidget {
  const ScanQR({Key? key}) : super(key: key);
  static const routename='/scan-qrcode';

  @override
  State<ScanQR> createState() => _ScanQRState();
}

class _ScanQRState extends State<ScanQR> {
  String result='Hey There !!!';

  Future _scanQR()async{
    try{
      String qrresutl = await BarcodeScanner.scan().toString();
      setState(() {
        result=qrresutl;
      });
    }on PlatformException catch(e){
      if(e.code==BarcodeScanner.cameraAccessDenied){
        setState(() {
          result="Camera Permission is denied";

        });

      }
      else{
        setState(() {
          result="Unknown Error";

        });
      }
    }
    on FormatException catch(e){
      setState(() {

        result='You Pressed The back button before scamming anything';
      });
    }
    catch (e){
      setState(() {
        result='Unknown Error';
      });
    }
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('QR code scanner'),),
     body: Center(
       child: Text('mi'),

     ),
      floatingActionButton: FloatingActionButton.extended(onPressed:
        _scanQR
      , label: Text(result),icon: Icon(Icons.camera_alt),),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
