import 'package:flutter/material.dart';
import 'package:justforfun/Provider/Device.dart';
import 'package:justforfun/screens/edit_Device_screen.dart';
import 'package:justforfun/screens/Device_detail_screen.dart';
import 'package:provider/provider.dart';
import 'package:justforfun/screens/edit_Device_screen.dart';
import '../Provider/Devices.dart';
import 'package:justforfun/Provider/Labs.dart';
import 'package:justforfun/Provider/lab.dart';
class LabItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final wlab1 = Provider.of<Lab>(context);

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
                      'Lab Name : ${wlab1.labname}  ',
                      style: TextStyle(height: 5, fontSize: 15),
                    ),
                    Spacer(),
                    Text(
                      'Lab Id : ${wlab1.id.substring(1,5)}..',
                      style: TextStyle(height: 5, fontSize: 15),
                    )
                  ],
                ),
                Text(
                  'Department : ${wlab1.department}',
                  style: TextStyle(height: 2, fontSize: 15),
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .pushNamed(LabDetail.routename, arguments: wlab1.id);
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

                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(EditDeviceScreen.routeName,
                            arguments: wlab1.id);
                      },
                      child: RichText(
                        text: TextSpan(
                          children: [
                            WidgetSpan(
                              child: Icon(
                                Icons.edit,
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            TextSpan(
                              text: "Edit Details",
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Provider.of<Devices>(context, listen: false)
                            .deleteDevice(wlab1.id);
                      },
                      child: RichText(
                        text: TextSpan(
                          children: [
                            WidgetSpan(
                              child: Icon(
                                Icons.delete,
                                color: Theme.of(context).errorColor,
                              ),
                            ),
                            TextSpan(
                              text: "Delete Lab",
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // IconButton(onPressed: (){}, icon: Icon(Icons.edit),)
                  ],
                ),
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
