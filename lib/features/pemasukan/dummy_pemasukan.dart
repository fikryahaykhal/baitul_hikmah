import './pemasukan.dart';

List<Pemasukan> dummyPemasukan = _json.map((json) {
  if (json
      case {
        'pemasukanID': final String pemasukanID,
        'category': final String category,
        'nominal': final String nominal,
        'keterangan': final String keterangan,
        'tanggal': final String tanggal,
      }) {
    return Pemasukan(
      pemasukanID: pemasukanID,
      category: category,
      nominal: nominal,
      keterangan: keterangan,
      tanggal: tanggal,
    );
  } else {
    throw const FormatException('Unexpected JSON');
  }
}).toList();

const _json = [
  {
    'pemasukanID': 'D0001',
    'category': 'BOP',
    'nominal': '1700000',
    'keterangan': 'BOP 2023',
    'tanggal': '2023-08-15',
  },
  {
    'pemasukanID': 'D0002',
    'category': 'SPP',
    'nominal': '1000000',
    'keterangan': 'SPP Fikry Bulan-8',
    'tanggal': '2023-08-15',
  },
  {
    'pemasukanID': 'D0003',
    'category': 'PPDB',
    'nominal': '1500000',
    'keterangan': 'DSP Ihsan',
    'tanggal': '2023-08-15',
  },
  {
    'pemasukanID': 'D0004',
    'category': 'Sumbangan',
    'nominal': '1500000',
    'sumber': 'Siswa',
    'keterangan': 'Sumbangan an. Ihsan',
    'tanggal': '2023-08-15',
  },
  {
    'pemasukanID': 'D0005',
    'category': 'Lain-lain',
    'nominal': '200000',
    'keterangan': '?',
    'tanggal': '2023-08-15',
  },
  {
    'pemasukanID': 'dummy',
    'category': 'dummy',
    'nominal': 'dummy',
    'keterangan': 'dummy',
    'tanggal': '2023-08-15',
  },
];
