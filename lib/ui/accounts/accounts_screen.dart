import 'package:flutter/material.dart';
import 'package:loans_app/utils/database_helper.dart';
import 'package:loans_app/utils/extensions.dart';
import 'package:loans_app/values/app_colors.dart' as color;
import 'package:loans_app/values/app_routes.dart';

final dbHelper = DatabaseHelper();

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<List<Map<String, dynamic>>> getLoans() async {
      await dbHelper.init();

      final result = dbHelper.queryAllRows('accounts');

      return result;
    }

    return Scaffold(
      backgroundColor: color.AppColors.backgroundColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () => {AppRoutes.addAccount.pushName()},
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        title: const Text(
          'Cuentas',
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
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                          padding: const EdgeInsets.all(10),
                                          decoration: const BoxDecoration(
                                              shape: BoxShape.circle),
                                          child: Image(
                                              width: 35,
                                              height: 35,
                                              image: AssetImage(
                                                  "assets/banks/${items[index]['bank'].toLowerCase()}.jpg"))),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              items[index]['alias'],
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black),
                                            ),
                                            Text(
                                              items[index]['fullname'],
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.normal,
                                                  color: color
                                                      .AppColors.disableColor),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Icon(Icons.chevron_right)
                                    ],
                                  ),
                                ),
                              );
                            });
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
