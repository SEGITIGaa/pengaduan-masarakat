import 'package:flutter/material.dart';
import 'package:flutter_pengaduan_application/controllers/pengaduanController.dart';
import 'package:get/get.dart';

class PengaduanBeranda extends StatelessWidget {
  const PengaduanBeranda({super.key});

  @override
  Widget build(BuildContext context) {
    PengaduanController pengaduanController = Get.put(PengaduanController());
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Pengaduan Masyarakat",
          style: TextStyle(color: Colors.black87),
        ),
        backgroundColor: Colors.amber,
        iconTheme: const IconThemeData(color: Colors.black87),
      ),
      body: Container(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.toNamed("/buat_pengaduan");
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
                      "Buat Pengaduan",
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Obx(() => pengaduanController.loading.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: pengaduanController.data.length,
                        itemBuilder: (context, i) {
                          return GestureDetector(
                            onTap: () {
                              Get.toNamed("/show_pengaduan",
                                  arguments: {"index": i});
                            },
                            child: ListTile(
                              splashColor: Colors.green,
                              leading: CircleAvatar(
                                  radius: 30, child: Text("${i + 1}")),
                              title: Text(
                                  "${pengaduanController.data[i].isiLaporan}"),
                              subtitle: Text(
                                  "${pengaduanController.data[i].createdAt}"),
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
