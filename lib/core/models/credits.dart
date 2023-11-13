import 'dart:math';

import 'package:flutter/material.dart';

import '../../values/app_colors.dart' as color;

class Credit {
  String title;
  String amount;
  String date;
  IconData iconData;
  Color color;

  Credit(this.title, this.amount, this.date, this.iconData, this.color);
}

List<Credit> credits() {
  return [
    Credit('Crédito 1', '\$450', '14 Noviembre 2023', Icons.fastfood_rounded,
        color.AppColors.orangeColor),
    Credit('Crédito 2', '\$4500', '14 Noviembre 2023',
        Icons.medical_information_rounded, color.AppColors.greenColor),
    Credit('Crédito 3', '\$45', '14 Noviembre 2023', Icons.shop,
        color.AppColors.accentColor),
    Credit('Crédito 4', '\$45050', '10 Noviembre 2022', Icons.house_rounded,
        randomColor()),
    Credit('Crédito 5', '\$1650', '14 Noviembre 2023', Icons.car_rental_rounded,
        randomColor())
  ];
}

Color randomColor() {
  return Color(Random().nextInt(0xffffffff)).withAlpha(0xff);
}
