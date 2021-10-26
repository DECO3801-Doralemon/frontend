
import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pantry_saver_fe/bloc/freezer_bloc.dart';
import 'package:pantry_saver_fe/config/styles.dart';
import 'package:pantry_saver_fe/home_widget.dart';
import 'package:pantry_saver_fe/utils/button_widget.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRViewExample extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  int index = 0;
  Barcode? result;
  QRViewController? controller;

  late FreezerBloc _freezerBloc;

  @override
  void initState() {
    _freezerBloc = FreezerBloc();
  }


  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: (result != null)
                  ? Text(
                  'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
                  : Text('Scan a code'),
            ),
          )
        ],
      ),
    );
  }

  Widget _storeData(String result){
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: size.height * 0.09),
          Center(
            child: Text(
              "Data: $result",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'BalsamiqSans',
                fontSize: 23,
                color: kPrimaryColor,
              ),
            ),
          ),
          SizedBox(height: size.height * 0.09),
          Center(
            child: Text(
              "Where to Store?",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'BalsamiqSans',
                fontSize: 23,
                color: kPrimaryColor,
              ),
            ),
          ),
          SizedBox(height: size.height * 0.06),
          ButtonWidget(
            text: "My Freezer",
            onClicked: () {
              setState(() {
                index = 1;
              });
            },
          ),
          SizedBox(height: size.height * 0.03),
          ButtonWidget(
            text: "My Fridge",
            onClicked: () {
              setState(() {
                index = 2;
              });
            },
          ),
          SizedBox(height: size.height * 0.03),
          ButtonWidget(
            text: "My Pantry",
            onClicked: () {
              setState(() {
                index = 3;
              });
            },
          ),
          SizedBox(height: size.height * 0.03),
          ButtonWidget(
            text: "Confirm",
            onClicked: () {
              if(index==1){
                _addToFreezer(result);
              }else {
                failedDialog(context);
              }
            },
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
    });
      String data = result!.code.substring(1);
      Navigator.push(context, MaterialPageRoute(builder: (context) => _storeData(data)));
      //showModalBottomSheet(context: context, builder: (context) => _buildModal(data));
    });
  }

  Widget _buildModal(String result){
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(height: size.height * 0.09),
        Center(
          child: Text(
            "Where to Store?",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'BalsamiqSans',
              fontSize: 23,
              color: kPrimaryColor,
            ),
          ),
        ),
        SizedBox(height: size.height * 0.06),
        ButtonWidget(
          text: "My Freezer",
          onClicked: () {
            setState(() {
              index = 1;
            });
          },
        ),
        SizedBox(height: size.height * 0.03),
        ButtonWidget(
          text: "My Fridge",
          onClicked: () {
            setState(() {
              index = 2;
            });
          },
        ),
        SizedBox(height: size.height * 0.03),
        ButtonWidget(
          text: "My Pantry",
          onClicked: () {
            setState(() {
              index = 3;
            });
          },
        ),
        SizedBox(height: size.height * 0.03),
        ButtonWidget(
          text: "Confirm",
          onClicked: () {
            if(index==1){
              _addToFreezer(result);
            }else {
              failedDialog(context);
            }
          },
        ),
      ],
    );
  }

  void _addToFreezer(String gtin) async {
    print("adding...");
    _freezerBloc.addItem(gtin);
    Timer(Duration(seconds: 2), () {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => Home(),));
    });
  }

  void failedDialog(BuildContext context) {
    var alertDialog = AlertDialog(
      title: Text('Anda blm memilih tempat'),
      //content: Icon(FontAwesomeIcons.exclamationCircle),
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        },
        barrierDismissible: true);
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}