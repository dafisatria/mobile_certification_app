import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mobile_certification_app/detailCash/detail_cash_view.dart';
import 'package:mobile_certification_app/income/income_view.dart';
import 'package:mobile_certification_app/outcome/outcome_view.dart';
import 'package:mobile_certification_app/settings/setting_view.dart';
import 'package:mobile_certification_app/test.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  'Rangkuman Bulan Ini',
                ),
                Text(
                  'Pengeluaran: Rp. 500.000,00',
                ),
                Text(
                  'Pemasukan: Rp. 1.500.000,00',
                ),
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
                                  builder: (context) => IncomeView(),
                                ));
                          },
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/cash.png',
                                height: 100,
                              ),
                              Text('Tambah Pemasukan')
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailCashView(),
                                ));
                          },
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/cash-flow.png',
                                height: 100,
                              ),
                              Text('Detail Cash Flow')
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
                                  builder: (context) => OutcomeView(),
                                ));
                          },
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/outcome.png',
                                height: 100,
                              ),
                              Text('Tambah Pengeluaran')
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SettingsView(),
                                ));
                          },
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/gear.png',
                                height: 100,
                              ),
                              Text('Pengaturan')
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
