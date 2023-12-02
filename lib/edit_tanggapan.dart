import 'package:flutter/material.dart';
import 'package:flutter_pengaduan_application/controllers/tanggapanController.dart';
import 'package:get/get.dart';

class EditTanggapan extends StatelessWidget {
  const EditTanggapan({super.key});

  @override
  Widget build(BuildContext context) {
    int index = Get.arguments["index"];
    TanggapanController tanggapanController = Get.put(TanggapanController());
    TextEditingController idtanggapan = TextEditingController(
        text: tanggapanController.data[index].idTanggapan.toString());
    TextEditingController idpengaduan = TextEditingController(
        text: tanggapanController.data[index].idPengaduan.toString());
    TextEditingController tgltanggapan = TextEditingController(
        text: tanggapanController.data[index].tglTanggapan.toString());
    TextEditingController tanggapan = TextEditingController(
        text: tanggapanController.data[index].tanggapan.toString());
    TextEditingController idpetugas = TextEditingController(
        text: tanggapanController.data[index].idPetugas.toString());

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.amber.shade400,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: idtanggapan,
              decoration: const InputDecoration(
                label: Text("idtanggapan"),
              ),
            ),
            TextField(
              controller: idpengaduan,
              decoration: const InputDecoration(
                label: Text("idpengaduan"),
              ),
            ),
            TextField(
              controller: tgltanggapan,
              decoration: const InputDecoration(
                label: Text("tgltanggapan"),
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
                label: Text("idpetugas"),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ElevatedButton(
                  onPressed: () {
                    tanggapanController.updateData(
                        tanggapanController.data[index].idPetugas,
                        idtanggapan.text,
                        idpengaduan.text,
                        tgltanggapan.text,
                        tanggapan.text,
                        idpetugas.text);
                    Get.toNamed("/beranda_tanggapan");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber.shade200,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: const Text("Update",
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
