import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/database.instance.dart';

class OutcomeView extends StatefulWidget {
  const OutcomeView({super.key});

  @override
  State<OutcomeView> createState() => _OutcomeViewState();
}

class _OutcomeViewState extends State<OutcomeView> {
  final DateTime _dueDate = DateTime.now();
  final currentDate = DateTime.now();
  final inputControllerDate = TextEditingController();
  final inputControllerNominal = TextEditingController();
  final inputControllerDesc = TextEditingController();
  DatabaseInstance? databaseInstance;
  Future initDatabase() async {
    await databaseInstance!.database();
    setState(() {});
  }

  @override
  void initState() {
    databaseInstance = DatabaseInstance();
    initDatabase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tambah Pengeluaran',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).colorScheme.onError,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: inputControllerDate,
                  decoration: InputDecoration(
                    hintText: DateFormat('dd-MM-yyyy').format(_dueDate),
                    labelText: 'Tanggal',
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    suffixIcon: const Icon(
                      Icons.calendar_month_outlined,
                      color: Colors.black,
                    ),
                  ),
                  onTap: () async {
                    final selectDate = await showDatePicker(
                      context: context,
                      initialDate: currentDate,
                      firstDate: DateTime(1990),
                      lastDate: DateTime(currentDate.year + 5),
                      builder: (context, child) {
                        return Theme(
                          data: ThemeData.light().copyWith(
                            colorScheme: ColorScheme.light(
                              primary: Theme.of(context).colorScheme.onPrimary,
                            ),
                            buttonTheme: const ButtonThemeData(
                                textTheme: ButtonTextTheme.primary),
                          ),
                          child: child!,
                        );
                      },
                    );
                    if (selectDate != null) {
                      String formattedDate =
                          DateFormat('dd-MM-yyyy').format(selectDate);
                      setState(
                        () {
                          inputControllerDate.text = formattedDate;
                        },
                      );
                    }
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: inputControllerNominal,
                  decoration: InputDecoration(
                    labelText: 'Nominal: ',
                    enabledBorder: UnderlineInputBorder(),
                    focusedBorder: UnderlineInputBorder(),
                  ),
                ),
                TextField(
                  controller: inputControllerDesc,
                  decoration: InputDecoration(
                    labelText: 'Keterangan: ',
                    enabledBorder: UnderlineInputBorder(),
                    focusedBorder: UnderlineInputBorder(),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    inputControllerDate.text =
                        DateFormat('dd-MM-yyyy').format(DateTime(2023, 1, 1));
                    inputControllerNominal.clear();
                    inputControllerDesc.clear();
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(MediaQuery.of(context).size.width, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    backgroundColor: const Color(0xffFFB000),
                  ),
                  child: Text(
                    'Reset',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () async {
                    await databaseInstance!.insertOut({
                      'date': inputControllerDate.text,
                      'nominal': inputControllerNominal.text,
                      'desc': inputControllerDesc.text
                    });
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(MediaQuery.of(context).size.width, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    backgroundColor: Theme.of(context).colorScheme.onSecondary,
                  ),
                  child: Text(
                    'Simpan',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface),
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
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
