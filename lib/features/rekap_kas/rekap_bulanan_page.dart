import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intersperse/intersperse.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:sik_baitulhikmah/features/pemasukan/dummy_pemasukan.dart';
import 'package:sik_baitulhikmah/features/pemasukan/pemasukan.dart';
import 'package:sik_baitulhikmah/features/rekap_kas/dummy_months.dart';
import 'package:sik_baitulhikmah/router.dart';
import 'package:sik_baitulhikmah/widgets/rounded_button.dart';
import 'package:sik_baitulhikmah/widgets/text_widget.dart';
import 'package:two_dimensional_scrollables/two_dimensional_scrollables.dart';

import '../../widgets/widgets.dart';

class RekapBulananPage extends StatelessWidget {
  const RekapBulananPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ContentView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PageHeader(
            title: 'Rekapitulasi Kas Per Bulan',
            description: 'Berikut adalah data siswa yang terdaftar.',
          ),
          const Gap(16),
          RoundedButton(
            text: 'Tambah Rekapitulasi Kas Baru',
            color: Colors.blue,
            onTap: () {
              _showFormPopupCreate(context);
            },
            textColor: Colors.white,
          ),
          const Gap(16),
          Expanded(
            child: Card(
              clipBehavior: Clip.antiAlias,
              child: ListView.separated(
                itemCount: dummyMonths.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  final user = dummyMonths[index];
                  return Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ListTile(
                      title: Row(
                        children: [
                          Text(
                            user.name,
                            style: theme.textTheme.headlineSmall!
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      subtitle: Text(
                        user.year,
                        style: theme.textTheme.labelLarge,
                      ),
                      trailing: const Icon(Icons.navigate_next_outlined),
                      onTap: () {
                        UserPageRoute(userId: user.monthId).go(context);
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showFormPopupCreate(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Create Data Siswa'),
          content: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height * 0.5,
              margin: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Form(
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'ID Siswa (Auto Generate)'),
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Name'),
                    ),
                    TextFormField(
                      decoration:
                          InputDecoration(labelText: 'Kelompok Belajar'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Submit'),
            ),
          ],
        );
      },
    );
  }
}
