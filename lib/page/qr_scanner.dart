
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pantry_saver_fe/config/styles.dart';
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

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        _openModal(result!);
      });
    });
  }
  
  _openModal(Barcode result) {
    showModalBottomSheet(context: context, builder: (context) => _buildModal(result));
  }

  Widget _buildModal(Barcode result){
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Expanded(
            child: Center(
              child: Text(
                "Where to Store?",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'BalsamiqSans',
                  fontSize: 18,
                  color: kPrimaryColor,
                ),
              ),
            )
        ),
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
        SizedBox(height: size.height * 0.3),
        ButtonWidget(
          text: "Confirm",
          onClicked: () {
            _addToStorage();
          },
        ),
      ],
    );
  }

  void _addToStorage() async {

  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}