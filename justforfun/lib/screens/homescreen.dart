import 'package:flutter/material.dart';
import 'package:justforfun/screens/Device_overview.dart';
import 'package:justforfun/screens/auth_screen_labadmin.dart';
import 'package:justforfun/screens/auth_screen_superadmin.dart';
import 'package:justforfun/screens/device_overviewforstudents.dart';
import 'package:provider/provider.dart';
class  Homepage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("TrackIt",),),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 8.0,horizontal: 10.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  child: RawMaterialButton(
                    fillColor: Color(0xFF26C6DA),
                    child: Text("Lab Admin",style: TextStyle(color: Colors.white)),
                    onPressed: (){
                      Navigator.of(context).pushNamed(AuthScreen.routename);
                    },
                  ),
                ),

                Container(
                  width: double.infinity,
                  child: RawMaterialButton(
                    fillColor: Color(0xFF26C6DA),
                    child: Text("Student/Faculty",style: TextStyle(color: Colors.white)),
                    onPressed: (){
                      // Navigator.of(context).pushNamed(LabOverview);
                      Navigator.of(context).pushNamed(DeviceOverViewStudent.routeName);

                    },
                  ),
                ),
                SizedBox(height: 100,),
                Container(
                  width: double.infinity,
                  child: RawMaterialButton(
                    fillColor: Color(0xFF26C6DA),
                    child: Text("Super Admin",style: TextStyle(color: Colors.white)),
                    onPressed: (){
                      Navigator.of(context).pushNamed(AuthScreensuper.routename);

                    },
                  ),
                ),
              ]
          ),
        )
    );
  }
}
