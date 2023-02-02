import 'package:coba_coba/controllers/main_c.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ScanPage extends StatelessWidget {
  ScanPage({Key? key}) : super(key: key);

  final mainC = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Scan Kehadiran",
            style: GoogleFonts.poppins(
              fontSize: 18,
              letterSpacing: 6,
              color: const Color.fromARGB(255, 234, 9, 241),
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          Image.asset(
            "assets/images/qr.png",
            width: 135,
          ),
          const SizedBox(
            height: 100,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 50),
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: const Color.fromARGB(172, 230, 7, 238),
              ),
              onPressed: () => mainC.scanBarcode(),
              // onPressed: () async => await KehadiranSheetApi.getAll(),
              child: Text(
                "Scan",
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
