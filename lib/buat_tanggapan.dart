import 'package:flutter_pengaduan_application/controllers/tanggapanController.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class BuatTanggapan extends StatelessWidget {
  const BuatTanggapan({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController idtanggapan = TextEditingController();
    TextEditingController idpengaduan = TextEditingController();
    TextEditingController tgltanggapan = TextEditingController();
    TextEditingController tanggapan = TextEditingController();
    TextEditingController idpetugas = TextEditingController();
    TanggapanController tanggapanController = Get.put(TanggapanController());
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
              controller: idtanggapan,
              decoration: const InputDecoration(
                label: Text("id_tanggapan"),
              ),
            ),
            TextField(
              controller: idpengaduan,
              decoration: const InputDecoration(
                label: Text("id_pengaduan"),
              ),
            ),
            TextField(
              controller: tgltanggapan,
              decoration: const InputDecoration(
                label: Text("tgl_tanggapan"),
              ),
            ),
            TextField(
              controller: tanggapan,
              decoration: const InputDecoration(
                label: Text("tanggapan"),
              ),
            ),
            TextField(
              controller: idpetugas,
              decoration: const InputDecoration(
                label: Text("id_petugas"),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ElevatedButton(
                  onPressed: () {
                    tanggapanController.createData(
                        idtanggapan.text,
                        idpengaduan.text,
                        tgltanggapan.text,
                        tanggapan.text,
                        idpetugas.text);
                    Get.toNamed("/beranda_tanggapan");
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
