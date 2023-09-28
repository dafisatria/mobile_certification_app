import 'package:flutter/material.dart';
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
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const Text(
                  'Rangkuman Bulan Ini',
                ),
                const Text(
                  'Pengeluaran: Rp. 500.000,00',
                ),
                const Text(
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
                                  builder: (context) => const IncomeView(),
                                ));
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
                                  builder: (context) => const DetailCashView(),
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
                                ));
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
                                  builder: (context) => const SettingsView(),
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
