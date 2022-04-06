import 'package:flutter/material.dart';
import 'package:justforfun/widgets/Device_item_student.dart';

import 'package:justforfun/widgets/Devices_item.dart';
import 'package:provider/provider.dart';
import 'package:justforfun/Provider/Devices.dart';

class Devicegridstudent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final labData = Provider.of<Devices>(context);
    final labs = labData.items;
    return Container(
      child: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: labs.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 3 / 2,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
          value: labs[i],
          child: DeviceItemstudent(
            // labs[i].id,
            // labs[i].labname,
            // labs[i].department,
          ),
        ),
      ),
    );
  }
}
