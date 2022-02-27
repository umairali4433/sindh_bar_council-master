import 'dart:convert';
import 'dart:io';

import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sindh_bar_council/models/Committemodel.dart';
import 'package:sindh_bar_council/models/Notification.dart';
import 'package:sindh_bar_council/models/Sbc_staff_model.dart';
import 'package:sindh_bar_council/models/chairman_exc_model.dart';
import 'package:sindh_bar_council/models/members.dart';
import 'package:http/http.dart' as http;


import 'models/Chairman.dart';
import 'models/Myprofilemodel.dart';
import 'models/News_model.dart';
import 'models/RegisteredFirmmodel.dart';
import 'models/Vicechairman.dart';
import 'models/due_detail_model.dart';
String Base_Url = 'https://sindhbarcouncil.org/index.php/';
String khimember = '/members/members_karachi_api';
String committee = 'Committee/committees_api';
String regfirms = 'firms/law_firms_api';
String chairmanval = 'chairman/chairman_api';
String vcchairmanval = 'vc/chairman_vc_api';
String chairman_exc = 'Chairmanexecutive/chairman_exc_api';
String sbc_staffval = 'staff/staff_api';




Future<List<Members>> Memberdata(String getone) async  {
  List<Members> tagObjs = [];
  String geterror = '';
  Uri uri = Uri.parse(Base_Url+getone);
  var response2;
  response2=  await http.get(uri );
  if (response2.statusCode == 200){
    tagObjs = membersFromJson(response2.body);
    return tagObjs;
  }
  else{
    return tagObjs;
  }


}



Future<List<Committee>> committeedata() async  {
  List<Committee> tagObjs = [];
  String geterror = '';
  Uri uri = Uri.parse(Base_Url+committee);
  var response2;
  response2=  await http.get(uri );
  if (response2.statusCode == 200){
    tagObjs = committeeFromJson(response2.body);
    return tagObjs;
  }
  else{
    return tagObjs;
  }


}

Future<List<Registeredfirms>> registeredfirms() async  {
  List<Registeredfirms> tagObjs = [];
  String geterror = '';
  Uri uri = Uri.parse(Base_Url+regfirms);
  var response2;
  response2=  await http.get(uri );
  if (response2.statusCode == 200){
    tagObjs = registeredfirmsFromJson(response2.body);
    return tagObjs;
  }
  else{
    return tagObjs;
  }

}

Future<List<Chairmanmodel>> chairmanget() async  {
  List<Chairmanmodel> tagObjs = [];
  String geterror = '';
  Uri uri = Uri.parse(Base_Url+chairmanval);
  var response2;
  response2=  await http.get(uri );
  if (response2.statusCode == 200){
    tagObjs = chairmanmodelFromJson(response2.body);
    return tagObjs;
  }

  else{
    return tagObjs;
  }

}

Future<List<Vicechairmanmodel>> vicechairman() async  {
  List<Vicechairmanmodel> tagObjs = [];
  String geterror = '';
  Uri uri = Uri.parse(Base_Url+vcchairmanval);
  var response2;
  response2=  await http.get(uri );
  if (response2.statusCode == 200){
    tagObjs = vicechairmanmodelFromJson(response2.body);
    return tagObjs;
  }
  else{
    return tagObjs;
  }

}


Future<List<ChairmanExcModel>> chairman_excmethod() async  {
  List<ChairmanExcModel> tagObjs = [];
  String geterror = '';
  Uri uri = Uri.parse(Base_Url+chairman_exc);
  var response2;
  response2=  await http.get(uri );
  if (response2.statusCode == 200){
    tagObjs = chairmanExcModelFromJson(response2.body);
    return tagObjs;
  }
  else{
    return tagObjs;
  }

}
Future<List<SbcStaffModel>> sbc_staff() async  {
  List<SbcStaffModel> tagObjs = [];
  String geterror = '';
  Uri uri = Uri.parse(Base_Url+sbc_staffval);
  var response2;
  response2=  await http.get(uri );
  if (response2.statusCode == 200){
    List<dynamic> userMap;
    userMap = jsonDecode(response2.body);

    var get = jsonEncode(userMap..removeAt(0));
    tagObjs = sbcStaffModelFromJson(get);
    return tagObjs;
  }
  else{
    return tagObjs;
  }

}

Future<Myprofilemodel> myprofile() async  {
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  _firebaseMessaging.getToken().then((token){
    print(token);
  });
  Myprofilemodel tagObjs;
  String geterror = '';
  Uri uri = Uri.parse('https://advocates.sindhbarcouncil.org/advocate_json_app_reg_no.php?password=sbc!!!&&sbc_reg_no=856&&dist_name=NAUSHAHRO%20FEROZE');
  var response2;
  response2=  await http.get(uri );
  if (response2.statusCode == 200){
    tagObjs = myprofilemodelFromJson(response2.body);
    return tagObjs;
  }
  else{
    return tagObjs;
  }

}

Future<DueDetailModel> duedetail(String regid,disname,myhlc) async  {
  DueDetailModel tagObjs;
  String geterror = '';
  Uri uri = Uri.parse('https://advocates.sindhbarcouncil.org/advocate_json_app_dues.php?password=sbc!!!&&sbc_reg_no='+regid+'&&dist_name='+disname+'&&enroll_type='+myhlc);
  var response2;
  response2=  await http.get(uri );
  if (response2.statusCode == 200){
    tagObjs = dueDetailModelFromJson(response2.body);
    return tagObjs;
  }
  else{
    return tagObjs;
  }

}

Future<List<NewsModel>> newsdata() async  {
  List<NewsModel> tagObjs;
  String geterror = '';
  Uri uri = Uri.parse('https://sindhbarcouncil.org/index.php/news/update');
  var response2;
  response2=  await http.get(uri );
  if (response2.statusCode == 200){
    tagObjs = newsModelFromJson(response2.body);
    return tagObjs;
  }
  else{
    return tagObjs;
  }

}
Future<Myprofilemodel> qrcodelogin(String id, hlc,String disname,deviceid) async  {
  Myprofilemodel tagObjs;
  String geterror = '';
  var params = {
    "password": 'sbc!!!',
    "sbc_reg_no":id,
    "dist_name":disname,
     "enroll_type":hlc,
    "device_id":deviceid
  };
  Uri uri = Uri.parse('https://advocates.sindhbarcouncil.org/advocate_json_app_reg_no.php');
  final newURI = uri.replace(queryParameters: params);
  var response2;
  response2=  await http.get(newURI );
  if (response2.statusCode == 200){
    tagObjs = myprofilemodelFromJson(response2.body);
    print(response2.body);
    if (tagObjs.preRegNo !=null){
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String user = jsonEncode(myprofilemodelFromJson(response2.body));
      prefs.setString('userData', user);
      prefs.setString('hlc', hlc);
      prefs.setString('dob', '');
    }

    return tagObjs;
  }
  else{
    return tagObjs;
  }

}

Future<List<NotificationModel>> Notificationmethod() async  {
  List<NotificationModel> tagObjs;
  String geterror = '';
  Uri uri = Uri.parse('https://sindhbarcouncil.org/index.php/news/news_text_api');
  var response2;
  response2=  await http.get(uri );
  if (response2.statusCode == 200){
    tagObjs = notificationModelFromJson(response2.body);
    return tagObjs;
  }
  else{
    return tagObjs;
  }
}
Future checkinterentnet() async {
  print("The statement 'this machine is connected to the Internet' is: ");
  print(await DataConnectionChecker().hasConnection);
  // returns a bool

  // We can also get an enum instead of a bool
  print("Current status: ${await DataConnectionChecker().connectionStatus}");
  // prints either DataConnectionStatus.connected
  // or DataConnectionStatus.disconnected

  // This returns the last results from the last call
  // to either hasConnection or connectionStatus
  print("Last results: ${DataConnectionChecker().lastTryResults}");

  // actively listen for status updates
  var listener = DataConnectionChecker().onStatusChange.listen((status) {
    switch (status) {
      case DataConnectionStatus.connected:
        print('Data connection is available.');
        break;
      case DataConnectionStatus.disconnected:
        print('You are disconnected from the internet.');
        break;
    }
  });

  // close listener after 30 seconds, so the program doesn't run forever
  await Future.delayed(Duration(seconds: 30));
  await listener.cancel();

}






















