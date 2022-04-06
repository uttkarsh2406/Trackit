import 'package:flutter/material.dart';

import 'package:trakcit/widgets/Devices_item.dart';
import 'package:provider/provider.dart';
import 'package:trakcit/Provider/Devices.dart';

class Labgrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final labData = Provider.of<Devices>(context);
    final labs = labData.items;
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: labs.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        childAspectRatio: 3 / 2,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: labs[i],
        child: LabItem(
          // labs[i].id,
          // labs[i].labname,
          // labs[i].department,
        ),
      ),
    );
  }
}
