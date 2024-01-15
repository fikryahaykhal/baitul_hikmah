import 'package:flutter/material.dart';
import 'package:recase/recase.dart';

enum NavigationItem {
  dashboard(iconData: Icons.dashboard_outlined),
  dataSiswa(iconData: Icons.list_outlined),
  dataPemasukan(iconData: Icons.list_outlined),
  dataPengeluaran(iconData: Icons.list_outlined),
  dataDspDanSpp(iconData: Icons.list_outlined),
  rekapitulasiKas(iconData: Icons.list_outlined),
  allReports(iconData: Icons.receipt_long_rounded);

  const NavigationItem({required this.iconData});
  final IconData iconData;
  String get label => name.titleCase;
}
