import 'dart:convert';
import 'package:flutter_pengaduan_application/models/tanggapan.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as fetch;

class TanggapanController extends GetxController {
  RxBool loading = RxBool(false);
  RxList<Tanggapan> data = RxList<Tanggapan>([]);

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  getData() async {
    try {
      data.value = [];
      loading.value = true;
      var response =
          await fetch.get(Uri.parse("http://localhost:3320/tanggapan"));
      loading.value = false;
      if (response.statusCode == 200) {
        final dataPengaduan = jsonDecode(response.body);
        for (Map<String, dynamic> pengaduan in dataPengaduan) {
          data.add(Tanggapan.fromJson(pengaduan));
        }
      } else {
        print("Terjadi Kesalahan");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  createData(String id_tanggapan, String id_pengaduan, String tgl_tanggapan,
      String tanggapan, String id_petugas) async {
    try {
      loading.value = true;
      var response = await fetch.post(
        Uri.parse("http://localhost:3320/tanggapan"),
        body: jsonEncode({
          "id_tanggapan": id_tanggapan,
          "id_pengaduan": id_pengaduan,
          "tgl_tanggapan": tgl_tanggapan,
          "tanggapan": tanggapan,
          "id_petugas": id_petugas,
        }),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      loading.value = false;

      getData();
      if (response.statusCode == 201) {
        print("Data berhasil dibuat");
      } else {
        print("Gagal membuat data. Status code: ${response.body}");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  updateData(id, String idtanggapan, String idpengaduan, String tgltanggapan,
      String tanggapan, String idpetugas) async {
    try {
      loading.value = true;
      var response = await fetch.patch(
        Uri.parse("http://localhost:3320/tanggapan/${id}"),
        body: jsonEncode({
          "id_tanggapan": idtanggapan,
          "id_pengaduan": idpengaduan,
          "tgl_tanggapan": tgltanggapan,
          "tanggapan": tanggapan,
          "id_petugas": idpetugas,
        }),
        headers: {
          'Content-Type': 'application/json',
        },
      );
      loading.value = false;

      getData();
      if (response.statusCode == 201) {
        print("Data berhasil dibuat");
      } else {
        print("Gagal membuat data. Status code: ${response.body}");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  destroyData(id) async {
    try {
      loading.value = true;
      var response = await fetch.delete(
        Uri.parse("http://localhost:3320/tanggapan/${id}"),
      );
      loading.value = false;

      getData();
      if (response.statusCode == 201) {
        print("Data berhasil dibuat");
      } else {
        print("Gagal membuat data. Status code: ${response.body}");
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
