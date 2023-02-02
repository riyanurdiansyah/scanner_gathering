import 'package:coba_coba/controllers/main_c.dart';
import 'package:coba_coba/pages/kehadiran_page.dart';
import 'package:coba_coba/pages/scan_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  final mainC = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: mainC.index.value,
          children: [
            ScanPage(),
            KehadiranPage(),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => Card(
          elevation: 10,
          margin: EdgeInsets.zero,
          child: BottomNavigationBar(
            unselectedFontSize: 11.5,
            selectedFontSize: 12.5,
            elevation: 2,
            selectedItemColor: const Color.fromARGB(255, 234, 9, 241),
            currentIndex: mainC.index.value,
            selectedLabelStyle: GoogleFonts.poppins(),
            unselectedLabelStyle: GoogleFonts.poppins(),
            onTap: (i) => mainC.onChangeIndex(i),
            items: const [
              BottomNavigationBarItem(
                label: "Scan",
                icon: Icon(
                  Icons.qr_code_scanner_rounded,
                  size: 22,
                ),
              ),
              BottomNavigationBarItem(
                label: "Kehadiran",
                icon: Icon(
                  Icons.group_rounded,
                  size: 22,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
