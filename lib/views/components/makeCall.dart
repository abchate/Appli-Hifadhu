// ignore_for_file: file_names

import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';

void makeCall(phone) async {
  String telephoneUrl = "tel:$phone";
  if (await canLaunch(telephoneUrl)) {
    await launch(telephoneUrl);
  } else {
    throw "Error occured trying to call that number.";
  }
}

makeSMS(phone) async {
  String smsUrl = "sms:$phone";
  if (await canLaunch(smsUrl)) {
    await launch(smsUrl);
  } else {
    throw "Error occured trying to send a message that number.";
  }
}

sosCall(number) async {
 var num = '$number';
  await FlutterPhoneDirectCaller.callNumber(num);
} 
