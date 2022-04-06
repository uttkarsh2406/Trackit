import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:justforfun/Model/http_exception.dart';
import 'package:justforfun/screens/Device_overview.dart';

class Auth with ChangeNotifier {
   String _token;
   DateTime _expiryDate;
   String _userid;
//   Auth({
//     required this._token,
//     required this._expiryDate,
//     required this._userid,
// });
  bool get is_auth {
    return token.length>0;
  }

  String get token {
    print(_expiryDate);
    if (_expiryDate != null &&
        _expiryDate.isAfter(DateTime.now()) &&
        _token != null) {
      return _token;
    }
    return '';
  }

  Future<void> _authenticate(
      String email, String password, String urlsegment) async {
    final url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:$urlsegment?key=AIzaSyDwTxcc2uSdPdYWz4wgwIMXpojj_LEAwIk');
    try {
      final value = await http.post(
        url,
        body: json.encode(
          {'email': email, 'password': password, 'returnSecureToken': true},
        ),
      );
      final resdata = json.decode(value.body);
      if (resdata['error'] != null) {
        throw HttpException(resdata['error']['message']);
      }
      _token=resdata['idToken'];
      _userid=resdata['loacalId'];
      _expiryDate=DateTime.now().add(Duration(seconds: int.parse(resdata['expiresIn'],),),);
      notifyListeners();
      
    } catch (error) {
      throw error;
    }
  }

  Future<void> login(String email, String password) async {
    //   final url = Uri.parse(
    //       'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyDwTxcc2uSdPdYWz4wgwIMXpojj_LEAwIk');
    //   final value = await http.post(url, body: json.encode({
    //     'email': email,
    //     'password': password,
    //     'returnSecureToken': true,
    //   },),);
    //   print(json.decode(value.body));
    // }
    return _authenticate(email, password, 'signInWithPassword');
  }
}
