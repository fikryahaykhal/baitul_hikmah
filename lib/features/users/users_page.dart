import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sik_baitulhikmah/features/users/dummy_users.dart';
import 'package:sik_baitulhikmah/router.dart';
import 'package:sik_baitulhikmah/widgets/rounded_button.dart';
import 'package:sik_baitulhikmah/widgets/text_widget.dart';

import '../../widgets/widgets.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ContentView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PageHeader(
            title: 'Data Siswa',
            description: 'Berikut adalah data siswa yang terdaftar.',
          ),
          const Gap(16),
          RoundedButton(
            text: 'Tambah Siswa Baru',
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
                itemCount: dummyUsers.length,
                separatorBuilder: (context, index) => const Divider(),
                itemBuilder: (context, index) {
                  final user = dummyUsers[index];
                  return ListTile(
                    title: Row(
                      children: [
                        Text(
                          user.name,
                          style: theme.textTheme.bodyMedium!
                              .copyWith(fontWeight: FontWeight.w600),
                        ),
                        user.status == 1
                            ? Row(children: [Gap(8), BelumSPP()])
                            : user.status == 2
                                ? Row(children: [Gap(8), BelumDSP()])
                                : user.status == 3
                                    ? Row(children: [Gap(8), BelumSPPDanDSP()])
                                    : SizedBox()
                      ],
                    ),
                    subtitle: Text(
                      user.role,
                      style: theme.textTheme.labelMedium,
                    ),
                    trailing: const Icon(Icons.navigate_next_outlined),
                    onTap: () {
                      UserPageRoute(userId: user.userId).go(context);
                    },
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

class BelumDSP extends StatelessWidget {
  const BelumDSP({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      height: 20,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.purple),
          borderRadius: BorderRadius.circular(16)),
      child: Center(
        child: TextWidget(
          text: 'Belum Bayar DSP',
          textsize: 8,
          textcolor: Colors.purpleAccent,
        ),
      ),
    );
  }
}

class BelumSPP extends StatelessWidget {
  const BelumSPP({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      height: 20,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.red),
          borderRadius: BorderRadius.circular(16)),
      child: Center(
        child: TextWidget(
          text: 'Belum Bayar SPP',
          textsize: 8,
          textcolor: Colors.redAccent,
        ),
      ),
    );
  }
}

class BelumSPPDanDSP extends StatelessWidget {
  const BelumSPPDanDSP({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8),
          height: 20,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.purple),
              borderRadius: BorderRadius.circular(16)),
          child: Center(
            child: TextWidget(
              text: 'Belum Bayar DSP',
              textsize: 8,
              textcolor: Colors.purpleAccent,
            ),
          ),
        ),
        Gap(8),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8),
          height: 20,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.red),
              borderRadius: BorderRadius.circular(16)),
          child: Center(
            child: TextWidget(
              text: 'Belum Bayar SPP',
              textsize: 8,
              textcolor: Colors.redAccent,
            ),
          ),
        )
      ],
    );
  }
}
