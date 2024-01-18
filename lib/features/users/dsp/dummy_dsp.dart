import 'package:sik_baitulhikmah/features/pengeluaran/pengeluaran.dart';
import 'package:sik_baitulhikmah/features/users/dsp/dsp.dart';

List<DSP> dummyDSP = _json.map((json) {
  if (json
      case {
        'dspID': final String dspID,
        'nominal': final String nominal,
        'namaSiswa': final String namaSiswa,
        'keterangan': final String keterangan,
        'tanggal': final String tanggal,
      }) {
    return DSP(
      dspID: dspID,
      nominal: nominal,
      namaSiswa: namaSiswa,
      keterangan: keterangan,
      tanggal: tanggal,
    );
  } else {
    throw const FormatException('Unexpected JSON');
  }
}).toList();

const _json = [
  {
    'dspID': 'C0001',
    'nominal': '1700000',
    'namaSiswa': 'Fatahillah Ardhi',
    'keterangan': 'sisa Rp. 3.900.000',
    'tanggal': '2023-08-15',
  },
  {
    'dspID': 'C0002',
    'nominal': '1700000',
    'namaSiswa': 'Fatahillah Ardhi',
    'keterangan': 'sisa Rp. 2.200.000',
    'tanggal': '2023-08-15',
  },
  {
    'dspID': 'C0002',
    'nominal': '1700000',
    'namaSiswa': 'Fatahillah Ardhi',
    'keterangan': 'sisa Rp. 500.000',
    'tanggal': '2023-08-15',
  },
  {
    'dspID': 'dummy',
    'nominal': 'dummy',
    'namaSiswa': 'dummy',
    'keterangan': 'dummy',
    'tanggal': 'dummy',
  },
];
