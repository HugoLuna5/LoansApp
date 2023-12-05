import 'package:flutter/material.dart';
import 'package:loans_app/utils/database_helper.dart';
import 'package:loans_app/utils/extensions.dart';
import 'package:loans_app/values/app_colors.dart' as color;
import 'package:loans_app/values/app_routes.dart';
import 'package:intl/intl.dart';

final dbHelper = DatabaseHelper();

class LoansScreen extends StatelessWidget {
  const LoansScreen({Key? key}) : super(key: key);

  Future<List<Map<String, dynamic>>> getLoans() async {
    await dbHelper.init();

    final result = dbHelper.getLoansByStatus('active');

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.AppColors.backgroundColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () => {AppRoutes.requestLoan.pushName()},
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        title: const Text(
          'Créditos',
          style: TextStyle(color: Colors.white),
        ),
        forceMaterialTransparency: false,
        automaticallyImplyLeading: false,
        backgroundColor: color.AppColors.accentColor,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              children: [
                FutureBuilder(
                    future: getLoans(),
                    builder: (c, s) {
                      if (s.hasData) {
                        final items = s.data;
                        return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            itemCount: items!.length,
                            itemBuilder: (context, index) {
                              var numberFormat = NumberFormat.currency(
                                  locale: 'es_MX', symbol: "\$");
                              final amount = numberFormat
                                  .format(double.parse(items[index]['amount']));
                              return Container(
                                height: 65,
                                margin: const EdgeInsets.only(bottom: 12),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12)),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 10),
                                  child: GestureDetector(
                                    onTap: () => {},
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                items[index]['name'],
                                                style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black),
                                              ),
                                              Text(
                                                items[index]['requested_date'],
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: color.AppColors
                                                        .disableColor),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Text(
                                          amount,
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            });
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
