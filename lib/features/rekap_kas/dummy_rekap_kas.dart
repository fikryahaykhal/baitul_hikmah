import 'package:sik_baitulhikmah/features/rekap_kas/pemasukan.dart';

List<RekapPemasukan> dummyRekapPemasukan = _json.map((json) {
  if (json
      case {
        'rekapPemasukanID': final String rekapPemasukanID,
        'category': final String category,
        'nominal': final String nominal,
        'sumber': final String sumber,
        'keterangan': final String keterangan,
        'tanggal': final String tanggal,
      }) {
    return RekapPemasukan(
      rekapPemasukanID: rekapPemasukanID,
      category: category,
      nominal: nominal,
      sumber: sumber,
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
    'category': 'BOS',
    'nominal': '1700000',
    'sumber': 'Kemendikbud',
    'keterangan': 'BOS Kemendikbud 2023',
    'tanggal': '2023-08-15',
  },
  {
    'pemasukanID': 'D0002',
    'category': 'SPP',
    'nominal': '1000000',
    'sumber': 'Siswa',
    'keterangan': 'SPP Fikry Bulan-8',
    'tanggal': '2023-08-15',
  },
  {
    'pemasukanID': 'D0003',
    'category': 'DSP',
    'nominal': '1500000',
    'sumber': 'Siswa',
    'keterangan': 'DSP Ihsan Termin-3',
    'tanggal': '2023-08-15',
  },
  {
    'pemasukanID': 'dummy',
    'category': 'dummy',
    'nominal': 'dummy',
    'sumber': 'dummy',
    'keterangan': 'dummy',
    'tanggal': '2023-08-15',
  },
];
