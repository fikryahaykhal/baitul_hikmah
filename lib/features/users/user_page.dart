import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:sik_baitulhikmah/features/users/dsp/dsp.dart';
import 'package:sik_baitulhikmah/features/users/dsp/dummy_dsp.dart';
import 'package:sik_baitulhikmah/features/users/spp/SPP.dart';
import 'package:sik_baitulhikmah/features/users/spp/dummy_SPP.dart';
import 'package:sik_baitulhikmah/features/users/user.dart';
import 'package:sik_baitulhikmah/widgets/month_calendar.dart';
import 'package:two_dimensional_scrollables/two_dimensional_scrollables.dart';

import '../../widgets/widgets.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    String formattedDate =
        DateFormat('dd MMMM yyyy', 'ID').format(DateTime.now());
    return ContentView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ElevatedButton.icon(
            icon: const Icon(Icons.navigate_before),
            label: const Text('Back'),
            onPressed: () {
              context.pop();
            },
          ),
          const Gap(16),
          Text(
            user.name,
            style: theme.textTheme.headlineMedium!.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          Text('Kelompok Belajar: ${user.role}'),
          Text('ID Siswa: ${user.userId}'),
          Gap(24),
          Text(
            'Tabel Bayar SPP',
            style: theme.textTheme.headlineSmall!.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          Gap(8),
          Text(
            'Diupdate pada $formattedDate',
            style: TextStyle(fontStyle: FontStyle.italic, fontSize: 12),
          ),
          Gap(8),
          Container(
            height: MediaQuery.of(context).size.height * 0.105,
            child: Expanded(
              flex: 1,
              child: _TableViewSPP(),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Gap(24),
          Text(
            'Tabel Bayar DSP',
            style: theme.textTheme.headlineSmall!.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          Gap(8),
          Text(
            'Diupdate pada $formattedDate',
            style: TextStyle(fontStyle: FontStyle.italic, fontSize: 12),
          ),
          Gap(8),
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            child: Expanded(
              child: _TableViewDSP(),
            ),
          ),
          SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}

class _TableViewDSP extends StatelessWidget {
  const _TableViewDSP();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final decoration = TableSpanDecoration(
      border: TableSpanBorder(
        trailing: BorderSide(color: theme.dividerColor),
      ),
    );
    final bayarDSP = dummyDSP;

    return Card(
      clipBehavior: Clip.antiAlias,
      child: TableView.builder(
        columnCount: DSP.itemCount + 1,
        rowCount: bayarDSP.length,
        pinnedRowCount: 0,
        pinnedColumnCount: 5,
        columnBuilder: (index) {
          return TableSpan(
            foregroundDecoration: index == 0 ? decoration : null,
            extent: const FractionalTableSpanExtent(1 / 5),
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
                label = 'ID DSP';
              case 1:
                label = 'Nominal';
              case 2:
                label = 'Keterangan';
              case 3:
                label = 'Tanggal Transaksi';
              case 4:
                label = 'Action';
            }
          } else {
            final dsp = bayarDSP[vicinity.yIndex - 1];
            String dateString = dsp.tanggal;
            DateTime date = DateTime.parse(dateString);
            String formattedDate =
                DateFormat('dd MMMM yyyy', 'ID').format(date);
            switch (vicinity.xIndex) {
              case 0:
                label = dsp.dspID;
              case 1:
                label = NumberFormat.currency(
                        locale: 'id_ID', symbol: 'Rp. ', decimalDigits: 0)
                    .format(double.parse(dsp.nominal));

              case 2:
                label = dsp.keterangan;
              case 3:
                label = formattedDate;
              case 4:
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

class _TableViewSPP extends StatelessWidget {
  const _TableViewSPP();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final decoration = TableSpanDecoration(
      border: TableSpanBorder(
        trailing: BorderSide(color: theme.dividerColor),
      ),
    );
    final spp = dummySPP;

    return Card(
      clipBehavior: Clip.antiAlias,
      child: TableView.builder(
        columnCount: SPP.itemCount,
        rowCount: spp.length,
        pinnedRowCount: 0,
        pinnedColumnCount: 0,
        columnBuilder: (index) {
          return TableSpan(
            foregroundDecoration: index == 0 ? decoration : null,
            extent: const FractionalTableSpanExtent(1 / 13),
          );
        },
        rowBuilder: (index) {
          return TableSpan(
            foregroundDecoration: index == 0 ? decoration : null,
            extent: const FixedTableSpanExtent(40),
          );
        },
        cellBuilder: (context, vicinity) {
          final isStickyHeader = vicinity.xIndex == 0 || vicinity.yIndex == 0;
          var label = '';
          if (vicinity.yIndex == 0) {
            switch (vicinity.xIndex) {
              case 0:
                label = 'Periode';
              case 1:
                label = 'Jan';
              case 2:
                label = 'Feb';
              case 3:
                label = 'Mar';
              case 4:
                label = 'Apr';
              case 5:
                label = 'May';
              case 6:
                label = 'Jun';
              case 7:
                label = 'Jul';
              case 8:
                label = 'Aug';
              case 9:
                label = 'Sep';
              case 10:
                label = 'Oct';
              case 11:
                label = 'Nov';
              case 12:
                label = 'Des';
            }
          } else {
            final month = spp[vicinity.yIndex];
            switch (vicinity.xIndex) {
              case 0:
                label = month.periode;
              case 1:
                label = (month.jan.contains('1'))
                    ? 'Sudah'
                    : (month.jan.contains('2') ? 'Belum' : '');
              case 2:
                label = (month.feb.contains('1'))
                    ? 'Sudah'
                    : (month.feb.contains('2') ? 'Belum' : '');
              case 3:
                label = (month.mar.contains('1'))
                    ? 'Sudah'
                    : (month.mar.contains('2') ? 'Belum' : '');
              case 4:
                label = (month.apr.contains('1'))
                    ? 'Sudah'
                    : (month.apr.contains('2') ? 'Belum' : '');
              case 5:
                label = (month.may.contains('1'))
                    ? 'Sudah'
                    : (month.may.contains('2') ? 'Belum' : '');
              case 6:
                label = (month.jun.contains('1'))
                    ? 'Sudah'
                    : (month.jun.contains('2') ? 'Belum' : '');
              case 7:
                label = (month.jul.contains('1'))
                    ? 'Sudah'
                    : (month.jul.contains('2') ? 'Belum' : '');
              case 8:
                label = (month.aug.contains('1'))
                    ? 'Sudah'
                    : (month.aug.contains('2') ? 'Belum' : '');
              case 9:
                label = (month.sep.contains('1'))
                    ? 'Sudah'
                    : (month.sep.contains('2') ? 'Belum' : '');
              case 10:
                label = (month.oct.contains('1'))
                    ? 'Sudah'
                    : (month.oct.contains('2') ? 'Belum' : '');
              case 11:
                label = (month.nov.contains('1'))
                    ? 'Sudah'
                    : (month.nov.contains('2') ? 'Belum' : '');
              case 12:
                label = (month.des.contains('1'))
                    ? 'Sudah'
                    : (month.des.contains('2') ? 'Belum' : '');
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

  void _showFormPopupEditPemasukan(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Data Pengeluaran'),
          content: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height * 0.5,
              margin: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'ID Pengeluaran (Auto Generate)'),
                    ),
                    TextFormField(
                      decoration:
                          InputDecoration(labelText: 'Jenis Pengeluaran'),
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Nominal'),
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Sumber'),
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: 'Keterangan'),
                    ),
                    TextFormField(
                      decoration:
                          InputDecoration(labelText: 'Tanggal Transaksi'),
                    ),
                    Expanded(child: SizedBox()),
                    Text(
                      'Sisa saldo saat ini adalah : Rp. 5.000.000,-',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    )
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
          title: Text('View Data Pengeluaran'),
          content: SingleChildScrollView(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.5,
              height: MediaQuery.of(context).size.height * 0.5,
              margin: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'ID Pengeluaran (Auto Generate)'),
                    ),
                    TextFormField(
                      readOnly: true,
                      decoration:
                          InputDecoration(labelText: 'Jenis Pengeluaran'),
                    ),
                    TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(labelText: 'Nominal'),
                    ),
                    TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(labelText: 'Sumber'),
                    ),
                    TextFormField(
                      readOnly: true,
                      decoration: InputDecoration(labelText: 'Keterangan'),
                    ),
                    TextFormField(
                      readOnly: true,
                      decoration:
                          InputDecoration(labelText: 'Tanggal Transaksi'),
                    ),
                    Expanded(child: SizedBox()),
                    Text(
                      'Sisa saldo saat ini adalah : Rp. 5.000.000,-',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    )
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
