import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pengaduan_application/controllers/petugasController.dart';

class ShowPetugas extends StatelessWidget {
  const ShowPetugas({super.key});

  @override
  Widget build(BuildContext context) {
    PetugasController petugasController = Get.put(PetugasController());
    print(petugasController.data);
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
                const Text("Nama :"),
                Text("${petugasController.data[index].namaPetugas}"),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Username :"),
                Text("${petugasController.data[index].username}"),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Telepon :"),
                Text("${petugasController.data[index].telp}"),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("level :"),
                Text("${petugasController.data[index].level}"),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("CreatedAt :"),
                Text("${petugasController.data[index].createdAt}"),
              ],
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Get.toNamed("/edit_petugas", arguments: {"index": index});
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
                    petugasController
                        .destroyData(petugasController.data[index].idPetugas);
                    Get.toNamed("/beranda_petugas");
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
