import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/scheduler.dart';

class ScanQR extends StatefulWidget {
  const ScanQR({Key? key}) : super(key: key);
  static const routename = '/scan-qrcode';

  @override
  State<ScanQR> createState() => _ScanQRState();
}

class _ScanQRState extends State<ScanQR> {
  String result = 'Hey There !!!';

  Future _scanQR() async {
    try {
      ScanResult qrresutl = await BarcodeScanner.scan();
      if (qrresutl == null) {
        Navigator.of(context).pop();
      }
      setState(() {
        result = qrresutl.rawContent;
      });
    } on PlatformException catch (e) {
      if (e.code == BarcodeScanner.cameraAccessDenied) {
        Navigator.of(context).pop();
        setState(() {
          result = "Camera Permission is denied";
        });
      } else {
        Navigator.of(context).pop();

        setState(() {
          result = "Unknown Error";
        });
      }
    } on FormatException catch (e) {
      Navigator.of(context).pop();

      setState(() {
        result = 'You Pressed The back button before scamming anything';
      });
    } catch (e) {
      Navigator.of(context).pop();

      setState(() {
        result = 'Unknown Error';
      });
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR code scanner'),
      ),
      body: Center(
        child: Text(result),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _scanQR,
        label: Text('hello'),
        icon: Icon(Icons.camera_alt),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
