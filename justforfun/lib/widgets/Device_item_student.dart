import 'package:flutter/material.dart';
import 'package:justforfun/Provider/Device.dart';
import 'package:justforfun/screens/edit_Device_screen.dart';
import 'package:justforfun/screens/Device_detail_screen.dart';
import 'package:provider/provider.dart';
import 'package:justforfun/screens/edit_Device_screen.dart';
import '../Provider/Devices.dart';

class DeviceItemstudent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wlab = Provider.of<Device>(context);

    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: GridTile(
        child: SizedBox(
          width: 500,
          height: 150,
          child: Card(
            elevation: 10,
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Device Name : ${wlab.name}  ',
                      style: TextStyle(height: 5, fontSize: 15),
                    ),
                    Spacer(),
                    Text(
                      'Device Id : ${wlab.id.substring(1,5)}..',
                      style: TextStyle(height: 5, fontSize: 15),
                    )
                  ],
                ),
                Text(
                  'Device Category : ${wlab.categry}',
                  style: TextStyle(height: 2, fontSize: 15),
                ),
                Text(
                  'Corresponding Lab : ${wlab.labname}',
                  style: TextStyle(height: 2, fontSize: 15),
                ),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(DeviceDetail.routename, arguments: wlab.id);
                        },
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(text: '  '),
                              WidgetSpan(
                                child: Icon(
                                  Icons.remove_red_eye,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              TextSpan(
                                text: "View Details  ",
                                style: TextStyle(color: Colors.black),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),


                    // IconButton(onPressed: (){}, icon: Icon(Icons.edit),)


              ],
            ),
          ),
        ),

        // child: Column(
        //   children: <Widget>[
        //     SizedBox(
        //       width: 500,
        //       height: 200,
        //       child: Card(
        //           elevation: 10,
        //           child: Padding(
        //             padding: const EdgeInsets.all(8.0),
        //             child: Container(
        //               height: 250,
        //               child: Column(
        //                 mainAxisAlignment: MainAxisAlignment.start,
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //                 mainAxisSize: MainAxisSize.min,
        //                 children: <Widget>[
        //                   Text(
        //                     'LabName : ${Labname}',
        //                     style: TextStyle(height: 2, fontSize: 30),
        //                   ),
        //                   Text(
        //                     'Department : ${Departmant}',
        //                     style: TextStyle(height: 2, fontSize: 30),
        //                   ),
        //
        //                 ],
        //               ),
        //             ),
        //           )),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
