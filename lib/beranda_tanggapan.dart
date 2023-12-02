import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pengaduan_application/controllers/tanggapanController.dart';

class BerandaTanggapan extends StatelessWidget {
  const BerandaTanggapan({super.key});

  @override
  Widget build(BuildContext context) {
    TanggapanController tanggapanController = Get.put(TanggapanController());
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: const Text(
          "Pengaduan Masyarakat",
          style: TextStyle(color: Colors.black87),
        ),
        backgroundColor: Colors.amber.shade400,
      ),
      body: Container(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed("/buat_tanggapan");
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.all(15),
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                    decoration: const BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: const Text(
                      "Buat Tanggapan",
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Obx(() => tanggapanController.loading.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: tanggapanController.data.length,
                        itemBuilder: (context, i) {
                          return GestureDetector(
                            onTap: () {
                              Get.toNamed("/show_tanggapan",
                                  arguments: {"index": i});
                            },
                            child: ListTile(
                              title: Text(
                                  "${tanggapanController.data[i].tanggapan}"),
                              subtitle: Text(
                                  "${tanggapanController.data[i].idPengaduan}"),
                            ),
                          );
                        },
                      ))
              ],
            ),
          )),
    );
  }
}
