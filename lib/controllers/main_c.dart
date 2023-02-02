import 'dart:async';
import 'dart:developer';

import 'package:coba_coba/kehadiran.dart';
import 'package:coba_coba/kehadiran_sheet_api.dart';
import 'package:coba_coba/pages/success_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MainController extends GetxController {
  var index = 0.obs;
  var listKehadiran = <Kehadiran>[].obs;
  var listKehadiranResult = <Kehadiran>[].obs;
  // late Timer timer;

  var tcName = TextEditingController();
  var isHaveQuery = false.obs;

  @override
  void onInit() {
    getAllData();
    super.onInit();
  }

  void onChangeIndex(int i) {
    index.value = i;
  }

  Future getAllData() async {
    try {
      final response = await KehadiranSheetApi.getAll();
      response.sort((a, b) => a.name.compareTo(b.name));
      if (listKehadiran != response) {
        listKehadiran.value = response;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> scanBarcode() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Batal', true, ScanMode.QR);
      log(barcodeScanRes);
      if (barcodeScanRes != "-1") {
        if (barcodeScanRes.contains("#TMSGREAT")) {
          final listText =
              barcodeScanRes.replaceAll("#TMSGREAT", "").split("-");
          Kehadiran kehadiran = Kehadiran(
            time: DateFormat.yMMMMd().add_Hms().format(DateTime.now()),
            name: listText[0].toString().trim(),
            brand: listText[1].toString().trim(),
            cabang: listText[2].toString().trim(),
            posisi: listText[3].toString().trim(),
            kamar: listText[4].toString().trim(),
            roomMate: listText[5].toString().trim(),
          );
          if (!listKehadiran.contains(kehadiran)) {
            KehadiranSheetApi.insert(kehadiran);
            Future.delayed(const Duration(seconds: 1), () {
              Get.to(
                () => SuccessPage(
                  kehadiran: kehadiran,
                ),
                transition: Transition.downToUp,
              );
            });
          } else {
            Fluttertoast.showToast(msg: "Data sudah ada dikehadiran");
          }
        } else {
          Fluttertoast.showToast(msg: "QR Code tidak valid");
        }
      }
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
  }

  void onClearSearch() {
    isHaveQuery.value = false;
    tcName.clear();
    onSearch("");
  }

  void onSearch(String query) {
    if (query.isNotEmpty) {
      isHaveQuery.value = true;
    } else {
      isHaveQuery.value = false;
    }
    for (var e in listKehadiran) {
      if (e.name.toLowerCase().contains(query.toLowerCase())) {
        listKehadiranResult.add(e);
      }
    }
    listKehadiran.value = listKehadiranResult
        .where(
          (e) => e.name.toLowerCase().contains(tcName.text.toLowerCase()),
        )
        .toSet()
        .toList();
    listKehadiran.sort((a, b) => a.name.compareTo(b.name));
  }
}
