import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intersperse/intersperse.dart';
import 'package:intl/intl.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:sik_baitulhikmah/features/dashboard/dummy_inventories.dart';
import 'package:sik_baitulhikmah/features/dashboard/inventory.dart';
import 'package:two_dimensional_scrollables/two_dimensional_scrollables.dart';

import '../../widgets/widgets.dart';

class DashBoardPage extends StatelessWidget {
  const DashBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveBreakpoints.of(context);
    const summaryCards = [
      SummaryCard(title: 'Total Siswa', value: '100 Orang'),
      SummaryCard(title: 'Total Pemasukan Bulan Ini', value: 'Rp. 12,000,000'),
      SummaryCard(title: 'Total Pengeluaran Bulan Ini', value: 'Rp.3,000,000'),
    ];

    return ContentView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PageHeader(
            title: 'Dashboard',
            description:
                'Berikut adalah data Siswa, Pemasukan & Pengeluaran Bulan Ini',
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
          const Gap(16),
          const Expanded(
            child: _TableView(),
          ),
        ],
      ),
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
    final inventories = dummyInventories;

    return Card(
      clipBehavior: Clip.antiAlias,
      child: TableView.builder(
        columnCount: Inventory.itemCount,
        rowCount: inventories.length,
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
            extent: const FixedTableSpanExtent(50),
          );
        },
        cellBuilder: (context, vicinity) {
          final isStickyHeader = vicinity.xIndex == 0 || vicinity.yIndex == 0;
          var label = '';
          if (vicinity.yIndex == 0) {
            switch (vicinity.xIndex) {
              case 0:
                label = 'ID';
              case 1:
                label = 'Nama Siswa';
              case 2:
                label = 'Alamat';
              case 3:
                label = 'Keterangan';
              case 4:
                label = 'Status';
              case 5:
                label = 'Tanggal Lahir';
            }
          } else {
            final inventory = inventories[vicinity.yIndex - 1];
            String dateString = inventory.updateDate;
            DateTime date = DateTime.parse(dateString);
            String formattedDate =
                DateFormat('dd MMMM yyyy', 'ID').format(date);
            switch (vicinity.xIndex) {
              case 0:
                label = inventory.inventoryId;
              case 1:
                label = inventory.category;
              case 2:
                label = inventory.brand;
              case 3:
                label = inventory.supplier;
              case 4:
                label = inventory.minimumStock.toString();
              case 5:
                label = formattedDate;
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
