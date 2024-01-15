import 'package:sik_baitulhikmah/features/dsp_spp/dsp_spp.dart';

List<DspSpp> dummyDspSpp = _json.map((json) {
  if (json
      case {
        'dspSppID': final String dspSppID,
        'category': final String category,
        'nominal': final String nominal,
        'sumber': final String sumber,
        'keterangan': final String keterangan,
        'tanggal': final String tanggal,
      }) {
    return DspSpp(
      dspSppID: dspSppID,
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
    'dspSppID': 'E0001',
    'category': 'SPP',
    'nominal': '170000',
    'sumber': 'Siswa an Fikry',
    'keterangan': 'SPP Juli 2023',
    'tanggal': '2023-07-15',
  },
  {
    'dspSppID': 'E0002',
    'category': 'DSP',
    'nominal': '1000000',
    'sumber': 'Siswa an Fatahillah',
    'keterangan': 'DSP Termin 4',
    'tanggal': '2023-09-15',
  },
  {
    'dspSppID': 'E0003',
    'category': 'SPP',
    'nominal': '150000',
    'sumber': 'Siswa an Fikry',
    'keterangan': 'SPP Agustus 2023',
    'tanggal': '2023-08-15',
  },
  {
    'dspSppID': 'dummy',
    'category': 'dummy',
    'nominal': 'dummy',
    'sumber': 'dummy',
    'keterangan': 'dummy',
    'tanggal': '2023-08-15',
  },
];
