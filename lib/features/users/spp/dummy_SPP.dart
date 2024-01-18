import 'package:sik_baitulhikmah/features/users/spp/SPP.dart';

List<SPP> dummySPP = _json.map((json) {
  if (json
      case {
        'periode': final String periode,
        'jan': final String januari,
        'feb': final String februari,
        'mar': final String maret,
        'apr': final String april,
        'may': final String mei,
        'jun': final String juni,
        'jul': final String juli,
        'aug': final String agustus,
        'sep': final String september,
        'oct': final String oktober,
        'nov': final String november,
        'des': final String desember,
      }) {
    return SPP(
      periode: periode,
      jan: januari,
      feb: februari,
      mar: maret,
      apr: april,
      may: mei,
      jun: juni,
      jul: juli,
      aug: agustus,
      sep: september,
      oct: oktober,
      nov: november,
      des: desember,
    );
  } else {
    throw const FormatException('Unexpected JSON');
  }
}).toList();

const _json = [
  {
    'periode': 'dummy',
    'jan': 'dummy',
    'feb': '2',
    'mar': '3',
    'apr': '1',
    'may': '2',
    'jun': '3',
    'jul': '1',
    'aug': '2',
    'sep': '3',
    'oct': '1',
    'nov': '2',
    'des': '3',
  },
  {
    'periode': 'Status',
    'jan': '1',
    'feb': '2',
    'mar': '3',
    'apr': '1',
    'may': '2',
    'jun': '3',
    'jul': '1',
    'aug': '2',
    'sep': '3',
    'oct': '1',
    'nov': '2',
    'des': '3',
  },
];
