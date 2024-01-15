import 'package:flutter/material.dart';

class MonthTable extends StatelessWidget {
  final List<String> months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];

  final List<String> bayar = [
    '17',
    '17',
    '18',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    ''
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        border: TableBorder.all(
            borderRadius: BorderRadius.all(Radius.circular(12))),
        columns: months.map((month) {
          return DataColumn(
            label: Text(month),
          );
        }).toList(),
        rows: [
          DataRow(
              cells: bayar.map((bayar) {
            return DataCell(
              Text(bayar),
            );
          }).toList()),
        ],
      ),
    );
  }
}
