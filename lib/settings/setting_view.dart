import 'package:flutter/material.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onBackground,
        leadingWidth: 0,
        title: const Text(
          'Pengaturan',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        leading: const SizedBox.shrink(),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Ganti Password'),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Password Saat Ini',
                enabledBorder: UnderlineInputBorder(),
                focusedBorder: UnderlineInputBorder(),
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Password Baru',
                enabledBorder: UnderlineInputBorder(),
                focusedBorder: UnderlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                minimumSize: Size(MediaQuery.of(context).size.width, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                backgroundColor: Theme.of(context).colorScheme.onSecondary,
              ),
              child: Text(
                'Simpan',
                style:
                    TextStyle(color: Theme.of(context).colorScheme.onSurface),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(MediaQuery.of(context).size.width, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                backgroundColor: Theme.of(context).colorScheme.onPrimary,
              ),
              child: Text(
                'Kembali',
                style:
                    TextStyle(color: Theme.of(context).colorScheme.onSurface),
              ),
            ),
            const Spacer(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/dafi.jpg',
                  height: 150,
                  width: 150,
                ),
                const SizedBox(
                  width: 10,
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'About this App..',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      'Aplikasi ini dibuat oleh:',
                    ),
                    Text('Nama: Hanief Dafi Satria'),
                    Text('NIM: 2141764070'),
                    Text('Tanggal: 27 September 2023'),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
