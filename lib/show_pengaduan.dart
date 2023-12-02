import 'package:flutter/material.dart';
import 'package:flutter_pengaduan_application/controllers/pengaduanController.dart';
import 'package:get/get.dart';

class ShowPengaduan extends StatelessWidget {
  const ShowPengaduan({super.key});

  @override
  Widget build(BuildContext context) {
    PengaduanController pengaduanController = Get.put(PengaduanController());
    final index = Get.arguments["index"];
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
            Image.network(
              'http://localhost:3320/images/${pengaduanController.data[index].foto.toString()}',
              height: 228,
              width: 228,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Nik :"),
                Text("${pengaduanController.data[index].nik}"),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Isi Laporan :"),
                Text("${pengaduanController.data[index].isiLaporan}"),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Status :"),
                Text("${pengaduanController.data[index].status}"),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("CreatedAt :"),
                Text("${pengaduanController.data[index].createdAt}"),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("UpdatedAt :"),
                Text("${pengaduanController.data[index].updatedAt}"),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                ElevatedButton(
                    onPressed: () {
                      Get.toNamed("/edit_pengaduan",
                          arguments: {"index": index});
                    },
                    child: const Text("Edit")),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    pengaduanController.destroyData(
                        pengaduanController.data[index].idPengaduan);
                    Get.toNamed("/beranda_pengaduan");
                  },
                  child: const Text("Hapus"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
