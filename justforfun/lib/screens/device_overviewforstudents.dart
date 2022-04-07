import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:justforfun/Provider/Device.dart';
import 'package:justforfun/screens/QRcodeScanResult.dart';
import 'package:justforfun/screens/QrcodeScanner.dart';
import 'package:justforfun/screens/edit_lab_screen.dart';
import 'package:justforfun/widgets/Device_grid.dart';
import 'package:image_picker/image_picker.dart';
import 'package:justforfun/widgets/Device_grid_student.dart';
import 'package:provider/provider.dart';
import '../Provider/Devices.dart';
import '../widgets/Devices_item.dart';
import 'Device_detail_screen.dart';
import 'edit_Device_screen.dart';
import 'package:flutter/services.dart';

import 'package:http/http.dart' as http;
class DeviceOverViewStudent extends StatefulWidget {
  static const routeName='/Deviceoverview-student';

  @override
  State<DeviceOverViewStudent> createState() => _DeviceOverViewStudentState();
}

class _DeviceOverViewStudentState extends State<DeviceOverViewStudent> {

  var _initst=true;
  String result = 'Hey There !!!';
  @override
  // void initstate(){
  //
  //   Future.delayed(Duration.zero).then((_) {
  //     Provider.of<Devices>(context).fetchdevice();
  //   });
  //   super.initState();
  // }
  void didChangeDependencies(){
    if(_initst) {
      Provider.of<Devices>(context).fetchdevice();
    }
    _initst=false;
    super.didChangeDependencies();
  }
  Future<void> _refreshdevice(BuildContext context) async{
    await Provider.of<Devices>(context,listen: false).fetchdevice();
  }



  Future _scanQR() async {

    try {
      ScanResult qrresutl = await BarcodeScanner.scan();
      if (qrresutl.rawContent.length != 0) {
        Navigator.of(context)
            .pushNamed(QrcodeResult.routename, arguments: qrresutl.rawContent);
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
        return;
        setState(() {
          result = "Unknown Error";
        });
      }
    } on FormatException catch (e) {
      return;
      Navigator.of(context).pop();

      setState(() {
        result = 'You Pressed The back button before scamming anything';
      });
    } catch (e) {
      return;
      Navigator.of(context).pop();

      setState(() {
        result = 'Unknown Error';
      });
    }
    // Navigator.of(context).pop();
  }

  // _ScanQrode;
  @override
  Widget build(BuildContext context) {
    final lab=Provider.of<Devices>(context);
    List<Device> loadedDeviec=lab.items;
    return Scaffold(
      appBar: AppBar(
        title: Text('Trackit'),
        actions: <Widget>[

          IconButton(
            onPressed: _scanQR,
            icon: Icon(Icons.camera),
          ),
          IconButton(onPressed: (){
            showSearch(context: context, delegate: MysearchDelegate(loaded_products: loadedDeviec));
          }, icon: Icon(Icons.search))
        ],
      ),
      body: RefreshIndicator(child: Devicegridstudent(),onRefresh:()=>_refreshdevice(context),),

    );
  }
}

class MysearchDelegate extends SearchDelegate{
  List<Device> loaded_products;
  MysearchDelegate({
    this.loaded_products,
  });
  List<String>searchTerms=[];

  @override
  List<Widget> buildActions(BuildContext context){
    return[ IconButton(onPressed: (){query='';}, icon: const Icon(Icons.clear)),];
  }

  @override
  Widget buildLeading(BuildContext context){
    return IconButton(onPressed: (){close(context,null);}, icon: Icon(Icons.arrow_back),);
  }
  Widget buildResults(BuildContext context){
    List<Device>matchQuery=[

    ];
    for(var i in loaded_products){
      if(i.id.toLowerCase().contains((query.toLowerCase()))){
        matchQuery.add(i);
      }
    }
    if(matchQuery.length>0){
      return ListView.builder(itemCount: matchQuery.length,itemBuilder: (context,i,){
        Device result=matchQuery[i];
        return Column(
          children: [
            GestureDetector(
              onTap: (){
                Navigator.of(context).pushNamed(
                  DeviceDetail.routename,
                  arguments: result.id,);
              },
              child: ClipRRect(
                borderRadius : BorderRadius.circular(25),
                child: Card(
                  color: Colors.white,
                  elevation: 10,
                  child: SizedBox(
                    width: double.infinity,
                    height: 200,
                    child: Row(
                      children: [
                        Text('Device id: ${result.id.substring(1,6)}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                        Spacer(),
                        Text('Device name : ${result.name}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),

                      ],
                    ),
                  ),
                ),
              ),
            ),

          ],

        );
      });
    }
    for(var i in loaded_products){
      if(i.name.toLowerCase().contains((query.toLowerCase()))){
        matchQuery.add(i);
      }

    }
    return ListView.builder(itemCount: matchQuery.length,itemBuilder: (context,i,){
      Device result=matchQuery[i];
      return Column(
        children: [
          GestureDetector(
            onTap: (){
              Navigator.of(context).pushNamed(
                DeviceDetail.routename,
                arguments: result.id,);
            },
            child: ClipRRect(
              borderRadius : BorderRadius.circular(25),
              child: Card(
                color: Colors.white,
                elevation: 10,
                child: SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: Row(
                    children: [
                      Text('Device id: ${result.id.substring(1,6)}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                      Spacer(),
                      Text('Device name : ${result.name}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),

                    ],
                  ),
                ),
              ),
            ),
          ),

        ],

      );
    });
  }
  Widget buildSuggestions(BuildContext context){
    List<String>matchQuery=[];

    for(var i in loaded_products){
      if(i.name.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(i.name);
      }
    }
    return ListView.builder(itemCount: matchQuery.length,itemBuilder: (context,i,){
      var result=matchQuery[i];
      return ListTile(
        title: Text(result),
        onTap: (){
          query=result;
        },
      );
    });
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
