import 'package:flutter_pengaduan_application/edit_tanggapan.dart';
import 'package:flutter_pengaduan_application/show_tanggapan.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pengaduan_application/beranda_tanggapan.dart';
import 'package:flutter_pengaduan_application/buat_pengaduan.dart';
import 'package:flutter_pengaduan_application/buat_tanggapan.dart';
import 'package:flutter_pengaduan_application/edit_pengaduan.dart';
import 'package:flutter_pengaduan_application/pengaduan.dart';
import 'package:flutter_pengaduan_application/show_pengaduan.dart';
import 'package:flutter_pengaduan_application/buat.dart';
import 'package:flutter_pengaduan_application/edit.dart';
import 'package:flutter_pengaduan_application/show.dart';
import 'package:flutter_pengaduan_application/beranda.dart';
import 'package:flutter_pengaduan_application/buat_petugas.dart';
import 'package:flutter_pengaduan_application/edit_petugas.dart';
import 'package:flutter_pengaduan_application/show_petugas.dart';
import 'package:flutter_pengaduan_application/beranda_petugas.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Pengadunan Masyarakat',
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: "/buat", page: () => const Buat()),
        GetPage(name: "/show", page: () => const Show()),
        GetPage(name: "/edit", page: () => const Edit()),
        GetPage(name: "/beranda_petugas", page: () => const BerandaPetugas()),
        GetPage(
            name: "/beranda_tanggapan", page: () => const BerandaTanggapan()),
        GetPage(name: "/buat_tanggapan", page: () => const BuatTanggapan()),
        GetPage(name: "/buat_petugas", page: () => const BuatPetugas()),
        GetPage(name: "/show_petugas", page: () => const ShowPetugas()),
        GetPage(name: "/edit_petugas", page: () => const EditPetugas()),
        GetPage(
            name: "/beranda_pengaduan", page: () => const PengaduanBeranda()),
        GetPage(name: "/show_tanggapan", page: () => const ShowTanggapan()),
        GetPage(name: "/buat_pengaduan", page: () => const BuatPengaduan()),
        GetPage(name: "/show_pengaduan", page: () => const ShowPengaduan()),
        GetPage(name: "/edit_pengaduan", page: () => const EditPengaduan()),
        GetPage(name: "/edit_tanggapan", page: () => const EditTanggapan()),
      ],
      initialRoute: "/",
      home: const Beranda(),
    );
  }
}
