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
  Lab labdetail;



  Device({
    required this.id,
    required this.name,
    required this.workingstatus,
    required this.yearbought,
    required this.expiryDate,
    required this.supplierName,
    required this.AMCDeadline,
    required this.categry,
    required this.labdetail,
  });
}
