import 'package:flutter/material.dart';
import 'package:justforfun/Provider/auth.dart';
import 'package:justforfun/screens/Device_overview.dart';
import 'package:justforfun/screens/Device_detail_screen.dart';
import 'package:justforfun/Provider/Devices.dart';
import 'package:justforfun/screens/Lab_detail_screen.dart';
import 'package:justforfun/screens/QRcodeScanResult.dart';
import 'package:justforfun/screens/QrcodeScanner.dart';
import 'package:justforfun/screens/auth_screen_labadmin.dart';
import 'package:justforfun/screens/edit_lab_screen.dart';
import 'package:provider/provider.dart';
import 'package:justforfun/screens/edit_Device_screen.dart';
import 'package:justforfun/screens/Qrcode_gen.dart';
import 'package:justforfun/screens/Device_QR_code.dart';
import 'package:justforfun/screens/homescreen.dart';
import 'package:justforfun/screens/auth_screen_superadmin.dart';
import 'package:justforfun/screens/LabOverview.dart';
import 'package:justforfun/Provider/Labs.dart';
import 'package:justforfun/Provider/auth.dart';
import 'package:justforfun/screens/device_overviewforstudents.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(
            value: Auth(),
          ),
          ChangeNotifierProxyProvider<Auth, Devices>(
            update: (ctx, auth, previousDevices) => Devices(auth.token,
                previousDevices == null ? [] : previousDevices.items),
          ),
          ChangeNotifierProxyProvider<Auth,Labs>(update: (ctx,auth,previouslabs) => Labs(auth.token,previouslabs==null?[]:previouslabs.items)),
        ],
        child: Consumer<Auth>(
          builder: (ctx, auth, _) => MaterialApp(
            title: 'Trackit',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            // auth.is_auth ? LabOverview() :
            home: Homepage(),
            routes: {
              DeviceOverViewStudent.routeName:(ctx)=>DeviceOverViewStudent(),
              LabOverView.routeName: (ctx) => LabOverView(),
              AuthScreensuper.routename: (ctx) => AuthScreensuper(),
              DeviceOverView.routeName: (ctx) => DeviceOverView(),
              AuthScreen.routename: (ctx) => AuthScreen(),
              DeviceDetail.routename: (ctx) => DeviceDetail(),
              EditLabScreen.routeName: (ctx) => EditLabScreen(),
              DeviceQRCode.routename: (ctx) => DeviceQRCode(),
              ScanQR.routename: (ctx) => ScanQR(),
              QrcodeResult.routename: (ctx) => QrcodeResult(),
              EditDeviceScreen.routeName: (ctx) => EditDeviceScreen(),
              DeviceDetail.routename:(ctx)=>DeviceDetail(),
              LabDetail.routename:(ctx)=>LabDetail(),
            },
          ),
        ));
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
