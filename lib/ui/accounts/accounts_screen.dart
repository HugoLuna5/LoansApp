import 'package:flutter/material.dart';
import 'package:loans_app/utils/database_helper.dart';
import 'package:loans_app/utils/extensions.dart';
import 'package:loans_app/values/app_colors.dart' as color;
import 'package:loans_app/values/app_routes.dart';

final dbHelper = DatabaseHelper();

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  List<Map<String, dynamic>> items = [];

  @override
  void initState() {
    super.initState();
    getLoans();
  }

  Future<void> getLoans() async {
    await dbHelper.init();

    final result = await dbHelper.queryAllRows('accounts');

    setState(() {
      items = result;
    });
  }

  @override
  Widget build(BuildContext context) {
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
          child: RefreshIndicator(
        onRefresh: getLoans,
        child: ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Container(
                height: 65,
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          padding: const EdgeInsets.all(10),
                          decoration:
                              const BoxDecoration(shape: BoxShape.circle),
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
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                  color: color.AppColors.disableColor),
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.chevron_right)
                    ],
                  ),
                ),
              );
            }),
      )),
    );
  }
}
