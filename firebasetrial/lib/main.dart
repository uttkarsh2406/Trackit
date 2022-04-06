
import 'package:flutter/material.dart';
import 'package:firebasetrial/screens/Device_overview.dart';
import 'package:firebasetrial/screens/Device_detail_screen.dart';
import 'package:firebasetrial/Provider/Devices.dart';
import 'package:firebasetrial/screens/QRcodeScanResult.dart';
import 'package:firebasetrial/screens/QrcodeScanner.dart';
import 'package:provider/provider.dart';
import 'package:firebasetrial/screens/edit_Device_screen.dart';
import 'package:firebasetrial/screens/Qrcode_gen.dart';
import 'package:firebasetrial/screens/Device_QR_code.dart';
import 'package:firebase_core/firebase_core.dart';


Future<void> main() async {
  await Firebase.initializeApp();
  runApp(MyApp());
}
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
