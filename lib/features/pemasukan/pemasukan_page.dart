import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intersperse/intersperse.dart';
import 'package:intl/intl.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:sik_baitulhikmah/features/pemasukan/dummy_pemasukan.dart';
import 'package:sik_baitulhikmah/features/pemasukan/pemasukan.dart';
import 'package:sik_baitulhikmah/widgets/rounded_button.dart';
import 'package:two_dimensional_scrollables/two_dimensional_scrollables.dart';

import '../../widgets/widgets.dart';

class PemasukanPage extends StatelessWidget {
  const PemasukanPage({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveBreakpoints.of(context);
    const summaryCards = [
      SummaryCard(title: 'Total Pemasukan Bulan Ini', value: 'Rp. 12,000,000'),
    ];

    return ContentView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PageHeader(
            title: 'Pemasukan',
            description: 'Berikut adalah data rangkuman Pemasukan Bulan Ini',
          ),
          const Gap(16),
          if (responsive.isMobile)
            ...summaryCards
          else
            Row(
              children: summaryCards
                  .map<Widget>((card) => Expanded(child: card))
                  .intersperse(const Gap(16))
                  .toList(),
            ),
          const Gap(32),
          RoundedButton(
            text: 'Buat Pemasukan Baru',
            color: Colors.blue,
            onTap: () {
              _showFormPopupCreatePemasukan(context);
            },
            textColor: Colors.white,
          ),
          Gap(32),
          const Expanded(
            child: _TableView(),
          ),
        ],
      ),
    );
  }

  void _showFormPopupCreatePemasukan(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Create Data Pemasukan'),
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
                          labelText: 'ID Pemasukan (Auto Generate)'),
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Jenis Pemasukan'),
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Nominal'),
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Keterangan'),
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Jenis Transaksi'),
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

class _TableView extends StatelessWidget {
  const _TableView();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final decoration = TableSpanDecoration(
      border: TableSpanBorder(
        trailing: BorderSide(color: theme.dividerColor),
      ),
    );
    final debits = dummyPemasukan;

    return Card(
      clipBehavior: Clip.antiAlias,
      child: TableView.builder(
        columnCount: Pemasukan.itemCount + 1,
        rowCount: debits.length,
        pinnedRowCount: 1,
        pinnedColumnCount: 1,
        columnBuilder: (index) {
          return TableSpan(
            foregroundDecoration: index == 0 ? decoration : null,
            extent: const FractionalTableSpanExtent(1 / 6),
          );
        },
        rowBuilder: (index) {
          return TableSpan(
            foregroundDecoration: index == 0 ? decoration : null,
            extent: const FixedTableSpanExtent(60),
          );
        },
        cellBuilder: (context, vicinity) {
          final isStickyHeader = vicinity.xIndex == 0 || vicinity.yIndex == 0;
          var label = '';
          if (vicinity.yIndex == 0) {
            switch (vicinity.xIndex) {
              case 0:
                label = 'ID Pemasukan';
              case 1:
                label = 'Kategori';
              case 2:
                label = 'Nominal';
              case 3:
                label = 'Keterangan';
              case 4:
                label = 'Tanggal Transaksi';
              case 5:
                label = 'Action';
            }
          } else {
            final debit = debits[vicinity.yIndex - 1];
            String dateString = debit.tanggal;
            DateTime date = DateTime.parse(dateString);
            String formattedDate =
                DateFormat('dd MMMM yyyy', 'ID').format(date);
            switch (vicinity.xIndex) {
              case 0:
                label = debit.pemasukanID;
              case 1:
                label = debit.category;
              case 2:
                label = NumberFormat.currency(
                        locale: 'id_ID', symbol: 'Rp. ', decimalDigits: 0)
                    .format(double.parse(debit.nominal));
              case 3:
                label = debit.keterangan;
              case 4:
                label = formattedDate;
              case 5:
                return ActionWidget();
            }
          }
          return ColoredBox(
            color: isStickyHeader ? Colors.transparent : colorScheme.background,
            child: Center(
              child: FittedBox(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    label,
                    style: TextStyle(
                      fontWeight: isStickyHeader ? FontWeight.w600 : null,
                      color: isStickyHeader ? null : colorScheme.outline,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ActionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width * 0.2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () {
              _showFormPopupEditPemasukan(context);
            },
            icon: Icon(
              Icons.edit_outlined,
            ),
          ),
          IconButton(
            onPressed: () {
              _showFormPopupDetailPemasukan(context);
            },
            icon: Icon(
              Icons.remove_red_eye_outlined,
            ),
          ),
          IconButton(
            onPressed: () {
              _showDeleteConfirmationDialog(context);
            },
            icon: Icon(
              Icons.delete_forever_outlined,
            ),
          ),
        ],
      ),
    );
  }

  void _showFormPopupEditPemasukan(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Create Data Pemasukan'),
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
                          labelText: 'ID Pemasukan (Auto Generate)'),
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Jenis Pemasukan'),
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Nominal'),
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Keterangan'),
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Jenis Transaksi'),
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

  void _showFormPopupDetailPemasukan(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Create Data Pemasukan'),
          content: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height * 0.5,
              margin: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Form(
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(
                          labelText: 'ID Pemasukan (Auto Generate)'),
                    ),
                    TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(labelText: 'Jenis Pemasukan'),
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Nominal'),
                    ),
                    TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(labelText: 'Keterangan'),
                    ),
                    TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(labelText: 'Jenis Transaksi'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Done'),
            ),
          ],
        );
      },
    );
  }
}

void _showDeleteConfirmationDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Delete Confirmation'),
        content: Text('Are you sure you want to delete this item?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              // Add your delete logic here
              print('Item deleted');
            },
            child: Text('Yes'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              print('Cancel deletion');
            },
            child: Text('No'),
          ),
        ],
      );
    },
  );
}
