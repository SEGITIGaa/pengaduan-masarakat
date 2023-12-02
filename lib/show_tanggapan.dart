import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pengaduan_application/controllers/tanggapanController.dart';

class ShowTanggapan extends StatelessWidget {
  const ShowTanggapan({super.key});

  @override
  Widget build(BuildContext context) {
    TanggapanController tanggapanController = Get.put(TanggapanController());
    print(tanggapanController.data);
    int index = Get.arguments["index"];
    return Scaffold(
      appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.amber.shade400,
          title: const Text("Pengaduan Masyarakat",
              style: TextStyle(color: Colors.white))),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("id_tanggapan :"),
                Text("${tanggapanController.data[index].idTanggapan}"),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("id_pengaduan :"),
                Text("${tanggapanController.data[index].idPengaduan}"),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("tgl_tanggapan :"),
                Text("${tanggapanController.data[index].tglTanggapan}"),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("tanggapan :"),
                Text("${tanggapanController.data[index].tanggapan}"),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("id_petugas :"),
                Text("${tanggapanController.data[index].idPetugas}"),
              ],
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed("/edit_tanggapan", arguments: {"index": index});
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black87,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: const Text(
                    "Edit",
                    style: TextStyle(color: Colors.amber),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    tanggapanController.destroyData(
                        tanggapanController.data[index].idTanggapan);
                    Get.toNamed("/beranda_tanggapan");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber.shade200,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  child: const Text(
                    "Hapus",
                    style: TextStyle(color: Colors.black87),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
