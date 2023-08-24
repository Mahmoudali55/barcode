// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanSceen extends StatefulWidget {
  const ScanSceen({super.key});

  @override
  State<ScanSceen> createState() => _CreatSCeenState();
}

class _CreatSCeenState extends State<ScanSceen> {
  var qrstr = 'let s Scan It';
  var height, width;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text("Scaning QR code"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                qrstr,
                style: TextStyle(color: Colors.blue, fontSize: 30),
              ),
              ElevatedButton(onPressed: scanQr, child: Text("Scanner")),
              SizedBox(
                width: height,
              ),
            ],
          ),
        ));
  }

  Future<void> scanQr() async {
    try {
      FlutterBarcodeScanner.scanBarcode('#2A99CF', 'cancal', true, ScanMode.QR)
          .then((value) {
        setState(() {
          qrstr = value;
        });
      });
    } catch (e) {
      setState(() {
        qrstr = 'unable to read this';
      });
    }
  }
}
