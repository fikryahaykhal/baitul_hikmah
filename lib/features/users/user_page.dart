import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:sik_baitulhikmah/features/users/user.dart';
import 'package:sik_baitulhikmah/widgets/month_calendar.dart';
import 'package:sik_baitulhikmah/widgets/text_widget.dart';

import '../../widgets/widgets.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    String now = DateFormat('dd MMMM yyyy').format(DateTime.now()).toString();
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
          const Gap(24),
          Text(
            user.name,
            style: theme.textTheme.headlineMedium!.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          Text('Kelompok Belajar: ${user.role}'),
          Text('ID Siswa: ${user.userId}'),
          Gap(32),
          Text(
            'Tabel Bayar SPP',
            style: theme.textTheme.headlineSmall!.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          Gap(16),
          Text(
            'Updated on $now',
            style: TextStyle(fontStyle: FontStyle.italic, fontSize: 12),
          ),
          Gap(8),
          MonthTable()
        ],
      ),
    );
  }
}
