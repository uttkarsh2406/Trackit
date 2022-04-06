import 'package:flutter/foundation.dart';

import 'lab.dart';

class Device with ChangeNotifier{

  final String id;
  final String name;
  final bool workingstatus;
  final String yearbought;
  final String expiryDate;
  final String supplierName;
  final String AMCDeadline;
  final String categry;
  final String labname;



  Device({
     this.id,
     this.name,
     this.workingstatus,
     this.yearbought,
     this.expiryDate,
     this.supplierName,
     this.AMCDeadline,
     this.categry,
     this.labname,
  });
}
