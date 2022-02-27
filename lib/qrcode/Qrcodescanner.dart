import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:sindh_bar_council/home/home.dart';
import 'package:sindh_bar_council/models/Myprofilemodel.dart';

import '../Base.dart';



class QRViewExample extends StatefulWidget {
  const QRViewExample({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {

  Future<Myprofilemodel> getuserfuture;
  Barcode result;
  bool flag = false;
  QRViewController controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getdata('856','Naushahro Feroze');

  }
  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller.pauseCamera();
    }
    controller.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: flag?Center(child:Text('Please wait')):Column(
        children: <Widget>[
          Expanded(flex: 4, child: _buildQrView(context)),
          Expanded(flex: 1,child: Container(
            child: Chip(
              backgroundColor: Colors.green,
                label: Text('Please Scan you QR Code',style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),)),
          ),)
          // Expanded(
          //   flex: 1,
          //   child: FittedBox(
          //     fit: BoxFit.contain,
          //     child: Column(
          //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //       children: <Widget>[
          //           const Text('Scan Your QR Code'),
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           crossAxisAlignment: CrossAxisAlignment.center,
          //           children: <Widget>[
          //             Container(
          //               margin: const EdgeInsets.all(8),
          //               child: ElevatedButton(
          //                   onPressed: () async {
          //                     await controller?.toggleFlash();
          //                     setState(() {});
          //                   },
          //                   child: FutureBuilder(
          //                     future: controller?.getFlashStatus(),
          //                     builder: (context, snapshot) {
          //
          //                     },
          //                   )),
          //             ),
          //             // Container(
          //             //   margin: const EdgeInsets.all(8),
          //             //   child: ElevatedButton(
          //             //       onPressed: () async {
          //             //         await controller?.flipCamera();
          //             //         setState(() {});
          //             //       },
          //             //       child: FutureBuilder(
          //             //         future: controller?.getCameraInfo(),
          //             //         builder: (context, snapshot) {
          //             //         },
          //             //       )),
          //             // )
          //           ],
          //         ),
          //       ],
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
        MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.red,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    int a  = 0;
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;

      if(a==3){
        List<String> getone = result.code.split('/');
        if(getone.length !=3 || getone[0].contains('http')){
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Invalid QR Code'),backgroundColor: Colors.red,duration:  Duration(seconds: 1, milliseconds: 500),),
          );
          a = 0;

        }
        else{
          FirebaseMessaging.instance.getToken().then((value) {
            getdata(getone[0],getone[1],getone[2],value.toString());
            // token = value;
            // print('my device token '+token);
          });

          a = 0;
        }

      }
        a++;
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }
  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void getdata(String id, String hlc,String disname,deviceid) {
    setState(() {
      flag = true;
    });
    getuserfuture =qrcodelogin(id,hlc,disname,deviceid).then((value) async {

      if(value.preRegNo==null){
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('User not Found'),backgroundColor: Colors.red,duration:  Duration(seconds: 1, milliseconds: 500),),
        );
        setState(() {
          flag = false;
        });
      }
      else{


        Navigator. pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) =>  Home_page(0,'Welcome to Sahulat'),
          ),
              (route) => false,
        );
      }
    });

  }
}