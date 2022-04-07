import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:justforfun/Provider/Device.dart';
import 'package:justforfun/screens/Lab_detail_screen.dart';
import 'package:justforfun/screens/QRcodeScanResult.dart';
import 'package:justforfun/screens/QrcodeScanner.dart';
import 'package:justforfun/screens/edit_lab_screen.dart';
import 'package:justforfun/widgets/Device_grid.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../Provider/Devices.dart';
import '../widgets/Devices_item.dart';
import '../widgets/Lab_grid.dart';
import 'Device_detail_screen.dart';
import 'edit_Device_screen.dart';
import 'package:flutter/services.dart';
import 'package:justforfun/Provider/Labs.dart';
import 'package:http/http.dart' as http;
import 'package:justforfun/Provider/lab.dart';
class LabOverView extends StatefulWidget {
  static const routeName='/Laboverview';

  @override
  State<LabOverView> createState() => _LabOverViewtate();
}


class _LabOverViewtate extends State<LabOverView> {

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
      Provider.of<Labs>(context).fetchlab();
    }
    _initst=false;
    super.didChangeDependencies();
  }
  Future<void> _refreshdevice(BuildContext context) async{
    await Provider.of<Devices>(context,listen: false).fetchdevice();
  }




  // _ScanQrode;
  @override
  Widget build(BuildContext context) {
    final lab=Provider.of<Labs>(context);
    List<Lab> loadedDeviec=lab.items;
    return Scaffold(
      appBar: AppBar(
        title: Text('Trackit'),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(EditLabScreen.routeName);
              },
              icon: Icon(Icons.add)),

          IconButton(onPressed: (){
            showSearch(context: context, delegate: MysearchDelegate(loaded_products: loadedDeviec));
          }, icon: Icon(Icons.search))
        ],
      ),
      body: RefreshIndicator(child: Labgrid(),onRefresh:()=>_refreshdevice(context),),

    );
  }
}

class MysearchDelegate extends SearchDelegate{
  List<Lab> loaded_products;
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
    List<Lab>matchQuery=[

    ];
    for(var i in loaded_products){
      if(i.id.toLowerCase().contains((query.toLowerCase()))){
        matchQuery.add(i);
      }
    }
    if(matchQuery.length>0){
      return ListView.builder(itemCount: matchQuery.length,itemBuilder: (context,i,){
        Lab result=matchQuery[i];
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
                        Text('Device id: ${result.id.substring(1,5)}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                        Spacer(),
                        Text('Device name : ${result.labname}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),

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
      if(i.labname.toLowerCase().contains((query.toLowerCase()))){
        matchQuery.add(i);
      }

    }
    return ListView.builder(itemCount: matchQuery.length,itemBuilder: (context,i,){
      Lab result=matchQuery[i];
      return Column(
        children: [
          GestureDetector(
            onTap: (){
              Navigator.of(context).pushNamed(
                LabDetail.routename,
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
                      Text('Device id: ${result.id.substring(1,5)}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                      Spacer(),
                      Text('Device name : ${result.labname}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),

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
      if(i.labname.toLowerCase().contains(query.toLowerCase())){
        matchQuery.add(i.labname);
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


