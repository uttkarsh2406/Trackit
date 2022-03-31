
import 'package:flutter/material.dart';
import 'package:justforfun/screens/Device_overview.dart';
import 'package:justforfun/screens/Device_detail_screen.dart';
import 'package:justforfun/Provider/Devices.dart';
import 'package:justforfun/screens/QRcodeScanResult.dart';
import 'package:justforfun/screens/QrcodeScanner.dart';
import 'package:provider/provider.dart';
import 'package:justforfun/screens/edit_Device_screen.dart';
import 'package:justforfun/screens/Qrcode_gen.dart';
import 'package:justforfun/screens/Device_QR_code.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx)=> Devices(),
      child: MaterialApp(
        title: 'Trackit',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LabOverview(),
        routes: {
          LabDetail.routename : (ctx)=> LabDetail(),
          EditLabScreen.routeName: (ctx) => EditLabScreen(),
          DeviceQRCode.routename: (ctx) => DeviceQRCode(),
          ScanQR.routename : (ctx) => ScanQR(),
          QrcodeResult.routename: (ctx) => QrcodeResult(),
        },
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trackit'),
      ),
      body: Center(
        child: Text('Let\'s build a shop!'),

      ),
    );
  }
}
