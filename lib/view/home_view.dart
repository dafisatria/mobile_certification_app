import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:mobile_certification_app/model/database.instance.dart';
import 'package:mobile_certification_app/test.dart';

import 'detail_cash_view.dart';
import 'income_view.dart';
import 'outcome_view.dart';
import 'setting_view.dart';

class HomeView extends StatefulWidget {
  String password;
  HomeView({
    Key? key,
    required this.password,
  }) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  DatabaseInstance? databaseInstance;
  void initDatabase() async {
    await databaseInstance!.database();
    setState(() {});
  }

  @override
  void initState() {
    databaseInstance = DatabaseInstance();
    initDatabase();
    super.initState();
  }

  void income() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Rangkuman Bulan Ini',
                  style: TextStyle(fontSize: 20),
                ),
                databaseInstance != null
                    ? FutureBuilder(
                        future: databaseInstance!.getTotalOutcome(),
                        builder: (context, snapshot) {
                          print(snapshot.error);
                          if (snapshot.hasData) {
                            if (snapshot.data == null) {
                              return Text('0');
                            }
                            return Text(
                              'Pengeluaran: ${NumberFormat.currency(
                                locale: 'id_ID',
                                symbol: 'Rp. ',
                              ).format(int.parse(snapshot.data))}',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Theme.of(context).colorScheme.onError,
                                  fontWeight: FontWeight.w600),
                            );
                          } else {
                            return Text('0');
                          }
                        })
                    : Text('0'),
                databaseInstance != null
                    ? FutureBuilder(
                        future: databaseInstance!.getTotalIncome(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            if (snapshot.data == null) {
                              return const Text('0');
                            }
                            return Text(
                              'Pemasukan: Rp. ${NumberFormat.currency(
                                locale: 'id_ID',
                                symbol: 'Rp. ',
                              ).format(int.parse(snapshot.data))}',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color(0xff59CE8F),
                                  fontWeight: FontWeight.w600),
                            );
                          } else {
                            return Text('0');
                          }
                        })
                    : Text('0'),
                SizedBox(
                  height: 250,
                  child: LineChartSample7(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const IncomeView(),
                                )).then((value) {
                              setState(() {});
                            });
                          },
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/cash.png',
                                height: 100,
                              ),
                              const Text('Tambah Pemasukan')
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (builder) => const DetailCashView(),
                                ));
                          },
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/cash-flow.png',
                                height: 100,
                              ),
                              const Text('Detail Cash Flow')
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const OutcomeView(),
                                )).then((value) {
                              setState(() {});
                            });
                          },
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/outcome.png',
                                height: 100,
                              ),
                              const Text('Tambah Pengeluaran')
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SettingsView(
                                    password: widget.password,
                                  ),
                                ));
                          },
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/gear.png',
                                height: 100,
                              ),
                              const Text('Pengaturan')
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
