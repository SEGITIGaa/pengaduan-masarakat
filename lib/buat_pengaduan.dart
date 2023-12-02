import 'package:flutter/material.dart';
import 'package:flutter_pengaduan_application/controllers/pengaduanController.dart';
import 'package:get/get.dart';
class BuatPengaduan extends StatelessWidget {
  const BuatPengaduan({super.key});

  @override
  Widget build(BuildContext context) {
    Map data = {};
    var hasil;
    PengaduanController pengaduanController = Get.put(PengaduanController());
    return Scaffold(
      appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black87),
          backgroundColor: Colors.amber,
          title: const Text("Pengaduan Masyarakat",
              style: TextStyle(color: Colors.black87))),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                label: Text("Isi Laporan"),
              ),
              onChanged: (value) => data["isi_laporan"] = value,
            ),
            TextField(
              decoration: const InputDecoration(
                label: Text("Status"),
              ),
              onChanged: (value) => data["status"] = value,
            ),
            TextField(
              decoration: const InputDecoration(
                label: Text("Tanggal Pengaduan"),
              ),
              onChanged: (value) => data["tgl_pengaduan"] = value,
            ),
            TextField(
              decoration: const InputDecoration(
                label: Text("Nik"),
              ),
              onChanged: (value) => data["nik"] = value,
            ),
            const SizedBox(height: 20),
            Obx(
              () => !pengaduanController.web.value
                  ? ElevatedButton(
                      onPressed: () {
                        pengaduanController.pickImage();
                      },
                      child: const Text("File Image"),
                    )
                  : Image.memory(pengaduanController.fileWeb!, width: 300),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                hasil = await pengaduanController.createData(data);
                if (hasil != "success") {
                  Get.snackbar("Error", hasil.toString());
                  return;
                }

                Get.toNamed("/beranda_pengaduan");
              },
              child: const Text("Create"),
            ),
          ],
        ),
      ),
    );
  }
}
