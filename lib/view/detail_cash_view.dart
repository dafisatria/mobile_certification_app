import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile_certification_app/model/database.instance.dart';
import 'package:mobile_certification_app/model/income_model.dart';
import 'package:mobile_certification_app/model/outcome_model.dart';

class DetailCashView extends StatefulWidget {
  const DetailCashView({super.key});

  @override
  State<DetailCashView> createState() => _DetailCashViewState();
}

class _DetailCashViewState extends State<DetailCashView> {
  DatabaseInstance? databaseInstance;
  Future _refresh() async {
    setState(() {});
  }

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
              child: databaseInstance != null
                  ? FutureBuilder<List>(
                      future: Future.wait([
                        databaseInstance!.all(),
                        databaseInstance!.allOut()
                      ]),
                      builder: (context, snapshot) {
                        print(snapshot.error);
                        if (snapshot.hasData) {
                          List<dynamic> combinedData = [];
                          combinedData.addAll(
                              snapshot.data![0].map((item) => item as dynamic));
                          combinedData.addAll(
                              snapshot.data![1].map((item) => item as dynamic));

                          if (snapshot.data!.isEmpty) {
                            return const Center(
                              child: Text('Belum ada aktivitas'),
                            );
                          }
                          return ListView.separated(
                            itemCount: combinedData.length,
                            itemBuilder: (context, index) {
                              final item = combinedData[index];
                              if (item is IncomeModel) {
                                return Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                    ),
                                    borderRadius: BorderRadius.circular(
                                        5.0), // Sudut border
                                  ),
                                  child: ListTile(
                                    title:
                                        Text('[+] Rp. ${NumberFormat.currency(
                                      locale: 'id_ID',
                                      symbol: 'Rp. ',
                                    ).format(item.nominal)}'),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(item.desc ?? 'null'),
                                        Text(item.date ?? 'null'),
                                      ],
                                    ),
                                    trailing: Icon(
                                      Icons.arrow_back_rounded,
                                      color: Color(0xff59CE8F),
                                    ),
                                  ),
                                );
                              } else {
                                return Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimary,
                                    ),
                                    borderRadius: BorderRadius.circular(
                                        5.0), // Sudut border
                                  ),
                                  child: ListTile(
                                    title:
                                        Text('[-] Rp. ${NumberFormat.currency(
                                      locale: 'id_ID',
                                      symbol: 'Rp. ',
                                    ).format(item.nominal)}'),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(item.desc ?? 'null'),
                                        Text(item.date ?? 'null'),
                                      ],
                                    ),
                                    trailing: Icon(
                                      Icons.arrow_forward_rounded,
                                      color:
                                          Theme.of(context).colorScheme.onError,
                                    ),
                                  ),
                                );
                              }
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: 5,
                              );
                            },
                          );
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
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
