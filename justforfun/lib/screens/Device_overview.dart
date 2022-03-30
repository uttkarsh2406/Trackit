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

import 'package:flutter/material.dart';

import 'package:justforfun/Provider/Device.dart';
import 'package:justforfun/widgets/Device_grid.dart';

import '../widgets/Devices_item.dart';
import 'edit_Device_screen.dart';

class LabOverview extends StatelessWidget {
  LabOverview({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trackit'),
        actions: <Widget>[
          IconButton(onPressed: (){
            Navigator.of(context).pushNamed(EditLabScreen.routeName);
          }, icon: Icon(Icons.add)),
        ],
      ),
      body: Labgrid(),
    );
  }
}


