import 'package:coba_coba/controllers/main_c.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class KehadiranPage extends StatelessWidget {
  KehadiranPage({Key? key}) : super(key: key);

  final mainC = Get.find<MainController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        title: Text(
          "Daftar Kehadiran",
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => mainC.getAllData(),
            icon: const Icon(
              Icons.refresh_rounded,
              color: Colors.blue,
            ),
          ),
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Obx(
              () => Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                height: Get.size.shortestSide < 600 ? 72 : 82,
                child: TextFormField(
                  controller: mainC.tcName,
                  style: TextStyle(
                      fontSize: Get.size.shortestSide < 600 ? 14 : 20),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    prefixIcon: GestureDetector(
                      child: const Icon(
                        Icons.search_rounded,
                        size: 20,
                        color: Colors.black54,
                      ),
                    ),
                    suffixIcon: !mainC.isHaveQuery.value
                        ? null
                        : InkWell(
                            onTap: () => mainC.onClearSearch(),
                            child: Icon(
                              Icons.close_rounded,
                              color: Colors.grey.shade500,
                            ),
                          ),
                    hintText: "Masukkan nama untuk pencarian..",
                    hintStyle: const TextStyle(
                        fontSize: 14, color: Color.fromRGBO(28, 29, 32, 0.45)),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: Colors.grey.shade300,
                        width: 1,
                        style: BorderStyle.solid,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                        color: Color.fromRGBO(13, 89, 159, 0.6),
                        width: 1,
                        style: BorderStyle.solid,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  onChanged: (query) {
                    mainC.onSearch(query);
                  },
                ),
              ),
            ),
            Expanded(
              child: Obx(() {
                if (mainC.listKehadiran.isEmpty) {
                  return const Center(
                    child: Text(
                      "Tidak ada data",
                    ),
                  );
                }
                return ListView.separated(
                  separatorBuilder: (_, __) => const Divider(),
                  itemCount: mainC.listKehadiran.length,
                  itemBuilder: (_, index) => ListTile(
                    trailing: Text(
                      mainC.listKehadiran[index].time,
                      style: GoogleFonts.poppins(
                        fontSize: 10.5,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          mainC.listKehadiran[index].name,
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "${mainC.listKehadiran[index].brand} - ${mainC.listKehadiran[index].cabang}",
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
