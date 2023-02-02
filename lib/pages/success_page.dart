import 'package:coba_coba/kehadiran.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({
    Key? key,
    required this.kehadiran,
  }) : super(key: key);

  final Kehadiran kehadiran;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Data berhasil disimpan",
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  letterSpacing: 2,
                  color: const Color.fromARGB(255, 234, 9, 241),
                ),
              ),
              const SizedBox(
                height: 75,
              ),
              Image.asset(
                "assets/images/success.png",
                width: 150,
              ),
              const SizedBox(
                height: 75,
              ),
              Text(
                kehadiran.name,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              Text(
                "${kehadiran.brand} - ${kehadiran.cabang}",
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                "ROOM MATE:",
                style: GoogleFonts.poppins(
                  fontSize: 10.5,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              Text(
                kehadiran.roomMate,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const SizedBox(
                height: 75,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 50),
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(172, 230, 7, 238),
                  ),
                  onPressed: () => Get.back(),
                  // onPressed: () async => await KehadiranSheetApi.getAll(),
                  child: Text(
                    "Kembali",
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
        ),
      ),
    );
  }
}
