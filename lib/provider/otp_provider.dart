import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class OTPProvider extends ChangeNotifier {
  late Timer _timer;
  int time_count = 30;
  int? _start=30;
  int? get start => _start;

  Future<void> startTimer(BuildContext context) async{
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec, (Timer timer) {
        if (time_count == 0) {
          timer.cancel();
          _start=0;
        }
        else {
          time_count--;
          _start=time_count;
          print('time:::${time_count}');
          notifyListeners();
        }

      },
    );
  }

  void setReStart(BuildContext context) {
    time_count = 30;
    _start = 30;
  }

  void setStopTime() {
    _timer.cancel();
  }

  Future<void> sendSMS(BuildContext context,String otp, final String mno) async {
    String subUrl="http://sms.unitechitsolution.in:6005/api/v2/SendSMS?SenderId=UNITCH&Is_Unicode=false&Is_Flash=false&Message=Dear user $otp is your new password for Unitech IT Solution account.&MobileNumbers=91$mno&&ApiKey=AI2aF6zxu1Mtv0NcUYKzkNxa+Sb86MmfiLXLObO0mDQ=&ClientId=85d288ac-b598-4627-a46e-0696f0446bcd";
    var url = Uri.parse('${subUrl}');
    var response = await http.get(url);
    print('user_register:::::$url');
    if(response.statusCode==200){
      notifyListeners();
    }
    else{
      notifyListeners();
    }
  }
}
