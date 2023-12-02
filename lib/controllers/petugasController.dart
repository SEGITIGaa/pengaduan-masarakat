import 'dart:convert';
import 'package:flutter_pengaduan_application/models/petugas.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as fetch;

class PetugasController extends GetxController {
  RxBool loading = RxBool(false);
  RxList<Petugas> data = RxList<Petugas>([]);

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
          await fetch.get(Uri.parse("http://localhost:3320/petugas"));
      loading.value = false;
      if (response.statusCode == 200) {
        final dataPengaduanMasyarakat = jsonDecode(response.body);
        for (Map<String, dynamic> pengaduanMasyarakat
            in dataPengaduanMasyarakat) {
          data.add(Petugas.fromJson(pengaduanMasyarakat));
        }
        print(data);
        print("Data berhasil diambil: ${data.length} item.");
      } else {
        print("Terjadi Kesalahan: ${response.statusCode}");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  createData(
    String namaPetugas,
    String username,
    String password,
    String telp,
    String level,
  ) async {
    try {
      loading.value = true;
      var response = await fetch.post(
        Uri.parse("http://localhost:  3320/petugas"),
        body: jsonEncode({
          "nama_petugas": namaPetugas,
          "username": username,
          "password": password,
          "telp": telp,
          "level": level,
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

  updateData(id, String namaPetugas, String username, telp) async {
    try {
      loading.value = true;
      var response = await fetch.patch(
        Uri.parse("http://localhost:3320/petugas/${id}"),
        body: jsonEncode({
          "nama_petugas": namaPetugas,
          "username": username,
          "telp": telp,
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
        Uri.parse("http://localhost:3320/petugas/${id}"),
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
