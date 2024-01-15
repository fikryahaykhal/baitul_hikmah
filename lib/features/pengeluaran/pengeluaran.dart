class Pengeluaran {
  Pengeluaran({
    required this.pengeluaranID,
    required this.category,
    required this.nominal,
    required this.sumber,
    required this.keterangan,
    required this.tanggal,
  });
  final String pengeluaranID;
  final String category;
  final String nominal;
  final String sumber;
  final String keterangan;
  final String tanggal;

  static const itemCount = 6;
}
