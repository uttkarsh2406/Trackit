
import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:justforfun/Provider/Device.dart';
import 'package:justforfun/screens/QRcodeScanResult.dart';
import 'package:justforfun/screens/QrcodeScanner.dart';
import 'package:justforfun/widgets/Device_grid.dart';
import 'package:image_picker/image_picker.dart';
import '../widgets/Devices_item.dart';
import 'edit_Device_screen.dart';
import 'package:flutter/services.dart';
class LabOverview extends StatefulWidget {
  LabOverview({Key? key}) : super(key: key);

  @override
  State<LabOverview> createState() => _LabOverviewState();
}

class _LabOverviewState extends State<LabOverview> {


  String result='Hey There !!!';

  Future _scanQR() async{
    try{
      ScanResult qrresutl = await BarcodeScanner.scan();
      setState(() {
        result=qrresutl.rawContent;
        Navigator.of(context).pushNamed(QrcodeResult.routename, arguments: result);
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
    } on FormatException catch(e){
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

  // _ScanQrode;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trackit'),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(EditLabScreen.routeName);
              },
              icon: Icon(Icons.add)),
          IconButton(
            onPressed: _scanQR,

              // Navigator.of(context).pushNamed(ScanQR.routename);



            icon: Icon(Icons.camera),
          ),
        ],
      ),
      body: Labgrid(),
    );
  }
}




// import 'package:flutter/material.dart';
//
// class LabOverview extends StatefulWidget {
//   const LabOverview({Key? key}) : super(key: key);
//
//   @override
//   State<LabOverview> createState() => _LabOverviewState();
// }
//
// class _LabOverviewState extends State<LabOverview> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Trackit'),),
//     );
//   }
// }
//
//
//
//
// // class LabOverview extends StatefulWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('Labs'),
// //       ),
// //       // body: LabGrid(),
// //     );
// //   }
// // }
// //
//
