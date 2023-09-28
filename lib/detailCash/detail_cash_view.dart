import 'package:flutter/material.dart';

class DetailCashView extends StatelessWidget {
  const DetailCashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onBackground,
        leadingWidth: 0,
        title: const Text(
          'Detail Cash Flow',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        leading: const SizedBox.shrink(),
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        // height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 60),
              child: ListView(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                      borderRadius: BorderRadius.circular(5.0), // Sudut border
                    ),
                    child: const ListTile(
                      title: Text('[+] Rp. 250.000,00'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Dapat bayaran panitia sertifikasi'),
                          Text('18-10-2021'),
                        ],
                      ),
                      trailing: Icon(
                        Icons.arrow_back_rounded,
                        color: Color(0xff59CE8F),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                      borderRadius: BorderRadius.circular(5.0), // Sudut border
                    ),
                    child: ListTile(
                      title: const Text('[-] Rp. 1.000.000,00'),
                      subtitle: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Urunan submit paper Sinta-2'),
                          Text('18-10-2021'),
                        ],
                      ),
                      trailing: Icon(
                        Icons.arrow_forward_rounded,
                        color: Theme.of(context).colorScheme.onError,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                      borderRadius: BorderRadius.circular(5.0), // Sudut border
                    ),
                    child: const ListTile(
                      title: Text('[+] Rp. 2.000.000,00'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Dapat bayaran proyekan'),
                          Text('20-10-2021'),
                        ],
                      ),
                      trailing: Icon(
                        Icons.arrow_back_rounded,
                        color: Color(0xff59CE8F),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                      borderRadius: BorderRadius.circular(5.0), // Sudut border
                    ),
                    child: const ListTile(
                      title: Text('[+] Rp. 1.250.000,00'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Dapat sangu dari bapak'),
                          Text('21-10-2021'),
                        ],
                      ),
                      trailing: Icon(
                        Icons.arrow_back_rounded,
                        color: Color(0xff59CE8F),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                      borderRadius: BorderRadius.circular(5.0), // Sudut border
                    ),
                    child: const ListTile(
                      title: Text('[+] Rp. 1.250.000,00'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Dapat sangu dari bapak'),
                          Text('21-10-2021'),
                        ],
                      ),
                      trailing: Icon(
                        Icons.arrow_back_rounded,
                        color: Color(0xff59CE8F),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                      borderRadius: BorderRadius.circular(5.0), // Sudut border
                    ),
                    child: const ListTile(
                      title: Text('[+] Rp. 1.250.000,00'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Dapat sangu dari bapak'),
                          Text('21-10-2021'),
                        ],
                      ),
                      trailing: Icon(
                        Icons.arrow_back_rounded,
                        color: Color(0xff59CE8F),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                      borderRadius: BorderRadius.circular(5.0), // Sudut border
                    ),
                    child: const ListTile(
                      title: Text('[+] Rp. 1.250.000,00'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Dapat sangu dari bapak'),
                          Text('21-10-2021'),
                        ],
                      ),
                      trailing: Icon(
                        Icons.arrow_back_rounded,
                        color: Color(0xff59CE8F),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                      borderRadius: BorderRadius.circular(5.0), // Sudut border
                    ),
                    child: const ListTile(
                      title: Text('[+] Rp. 1.250.000,00'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Dapat sangu dari bapak'),
                          Text('21-10-2021'),
                        ],
                      ),
                      trailing: Icon(
                        Icons.arrow_back_rounded,
                        color: Color(0xff59CE8F),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
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
            ),
          ],
        ),
      ),
    );
  }
}
