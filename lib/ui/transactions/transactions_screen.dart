import 'package:flutter/material.dart';
import 'package:loans_app/core/models/transaction.dart';
import 'package:loans_app/values/app_colors.dart' as color;

class TransactionsScreen extends StatelessWidget {
  const TransactionsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.AppColors.backgroundColor,
      appBar: AppBar(
        title: const Text(
          'Movimientos',
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
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    itemCount: transactions().length,
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
                                decoration: BoxDecoration(
                                    color: transactions()[index]
                                        .color
                                        .withOpacity(0.2),
                                    shape: BoxShape.circle),
                                child: Icon(
                                  transactions()[index].iconData,
                                  color: transactions()[index].color,
                                  size: 17,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      transactions()[index].title,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      transactions()[index].date,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                          color: color.AppColors.disableColor),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                transactions()[index].amount,
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      );
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
