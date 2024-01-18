import 'package:sik_baitulhikmah/features/rekap_kas/month.dart';

List<Month> dummyMonths = _json.map((json) {
  if (json
      case {
        'monthID': final String monthID,
        'name': final String name,
        'year': final String year,
      }) {
    return Month(monthId: monthID, name: name, year: year);
  } else {
    throw const FormatException('Unexpected JSON');
  }
}).toList();

const _json = [
  {
    'monthID': 'H001',
    'name': 'Januari',
    'year': '2023',
  },
  {
    'monthID': 'H002',
    'name': 'Februari',
    'year': '2023',
  },
  {
    'monthID': 'H003',
    'name': 'Maret',
    'year': '2023',
  },
  {
    'monthID': 'H004',
    'name': 'April',
    'year': '2023',
  },
];
