import 'package:flutter_pengaduan_application/controllers/petugasController.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class BuatPetugas extends StatelessWidget {
  const BuatPetugas({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController namaPetugas = TextEditingController();
    TextEditingController username = TextEditingController();
    TextEditingController password = TextEditingController();
    TextEditingController telp = TextEditingController();
    TextEditingController level = TextEditingController();
    PetugasController petugasController = Get.put(PetugasController());
    return Scaffold(
      appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black87),
          backgroundColor: Colors.amber.shade400,
          title: const Text("Pengaduan Masyarakat",
              style: TextStyle(color: Colors.black87))),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: namaPetugas,
              decoration: const InputDecoration(
                label: Text("nama"),
              ),
            ),
            TextField(
              controller: username,
              decoration: const InputDecoration(
                label: Text("username"),
              ),
            ),
            TextField(
              controller: password,
              decoration: const InputDecoration(
                label: Text("password"),
              ),
            ),
            TextField(
              controller: telp,
              decoration: const InputDecoration(
                label: Text("telp"),
              ),
            ),
            TextField(
              controller: level,
              decoration: const InputDecoration(
                label: Text("level"),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ElevatedButton(
                  onPressed: () {
                    petugasController.createData(namaPetugas.text,
                        username.text, password.text, telp.text, level.text);
                    Get.toNamed("/beranda_petugas");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: const Text("Create",
                      style: TextStyle(color: Colors.black87)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
