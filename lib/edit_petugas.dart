import 'package:flutter/material.dart';
import 'package:flutter_pengaduan_application/controllers/petugasController.dart';
import 'package:get/get.dart';

class EditPetugas extends StatelessWidget {
  const EditPetugas({super.key});

  @override
  Widget build(BuildContext context) {
    int index = Get.arguments["index"];
    PetugasController petugasController = Get.put(PetugasController());
    TextEditingController nama =
        TextEditingController(text: petugasController.data[index].namaPetugas);
    TextEditingController username =
        TextEditingController(text: petugasController.data[index].username);
    TextEditingController telp = TextEditingController(
        text: petugasController.data[index].telp.toString());
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
              controller: nama,
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
              controller: telp,
              decoration: const InputDecoration(
                label: Text("telp"),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ElevatedButton(
                  onPressed: () {
                    petugasController.updateData(
                        petugasController.data[index].idPetugas,
                        nama.text,
                        username.text,
                        telp.text);
                    Get.toNamed("/beranda_petugas");
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
