import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loans_app/core/models/contacts.dart';
import 'package:loans_app/core/models/transaction.dart';
import 'package:loans_app/ui/accounts/accounts_screen.dart';
import 'package:loans_app/ui/loans/loans_screen.dart';
import 'package:loans_app/ui/transactions/transactions_screen.dart';
import 'package:loans_app/values/app_colors.dart' as color;

class TabHomeScreen extends StatefulWidget {
  const TabHomeScreen({Key? key}) : super(key: key);

  @override
  State<TabHomeScreen> createState() => _TabHomeScreenState();
}

class _TabHomeScreenState extends State<TabHomeScreen> {
  int currentIndex = 0;

  final List<Widget> _children = [
    const HomeScreen(),
    const TransactionsScreen(),
    const LoansScreen(),
    const AccountScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.AppColors.backgroundColor,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: color.AppColors.accentColor,
        unselectedItemColor: color.AppColors.disableColor,
        showUnselectedLabels: true,
        onTap: (newIndex) => {
          setState(() {
            currentIndex = newIndex;
          })
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_filled), label: 'Inicio'),
          BottomNavigationBarItem(
              icon: Icon(Icons.pie_chart), label: 'Movimientos'),
          BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart), label: 'Credito'),
          BottomNavigationBarItem(
              icon: Icon(Icons.credit_card), label: 'Cuentas'),
        ],
      ),
      body: _children[currentIndex],
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            TopSection(),
            // ContactSection(),
            SizedBox(
              height: 20,
            ),
            ActionSection(),
            SizedBox(
              height: 20,
            ),
            TransactionSection()
          ],
        ),
      ),
    );
  }
}

class CurrentLoanInfoPayment extends StatelessWidget {
  const CurrentLoanInfoPayment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            padding: const EdgeInsets.all(0),
            decoration: BoxDecoration(
                color: Colors.amber, borderRadius: BorderRadius.circular(20)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'A pagar',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: color.AppColors.disableColor),
                            ),
                            const Text(
                              '\$984,39',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 35,
                          width: 110,
                          child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: FilledButton.icon(
                                  onPressed: () => {},
                                  icon: const Icon(
                                    CupertinoIcons.chevron_right,
                                    color: Colors.white,
                                    textDirection: TextDirection.ltr,
                                    size: 18,
                                  ),
                                  style: const ButtonStyle().copyWith(
                                    backgroundColor: MaterialStateProperty.all(
                                        color.AppColors.accentColor),
                                    iconColor:
                                        MaterialStateProperty.all(Colors.white),
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                    ),
                                  ),
                                  label: const Text(
                                    "Pagar",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14),
                                  ))),
                        )
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Fecha límite de pago:',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                          padding: const EdgeInsets.only(top: 4, bottom: 4),
                          child: const Text(
                            '15/11/2023',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: Colors.black),
                          ))
                    ],
                  ),
                )
              ],
            )),
      ],
    );
  }
}

class TransactionSection extends StatelessWidget {
  const TransactionSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Movimientos',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Text(
                'Ver todos',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: color.AppColors.accentColor),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 300,
            margin: const EdgeInsets.only(bottom: 20),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: ListView.builder(
                padding: const EdgeInsets.symmetric(vertical: 10),
                itemCount: transactions().length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color:
                                  transactions()[index].color.withOpacity(0.2),
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
                  );
                }),
          )
        ],
      ),
    );
  }
}

class ActionSection extends StatelessWidget {
  const ActionSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () => {},
            child: ActionItem(
                icon: Icons.payments_outlined,
                color: color.AppColors.accentColor,
                title: 'Solicitar'),
          ),
          ActionItem(
            icon: Icons.credit_card_outlined,
            color: color.AppColors.orangeColor,
            title: 'Transferir',
          ),
          ActionItem(
            icon: Icons.dashboard_outlined,
            color: color.AppColors.disableColor,
            title: 'Más',
          )
        ],
      ),
    );
  }
}

class ActionItem extends StatelessWidget {
  const ActionItem(
      {Key? key, required this.icon, required this.color, required this.title})
      : super(key: key);
  final IconData icon;
  final Color color;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(30)),
          child: Icon(
            icon,
            color: color,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black),
        )
      ],
    );
  }
}

class ContactSection extends StatelessWidget {
  const ContactSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20),
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: color.AppColors.accentColor, shape: BoxShape.circle),
            child: Image.asset(
              'assets/images/search.png',
              color: Colors.white,
              width: 30,
              height: 30,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Container(
            height: 40,
            width: 2,
            color: color.AppColors.disableColor.withOpacity(0.3),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: contacts().length,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.only(right: 10, left: 10),
                  child: Column(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          contacts()[index].imageLink,
                          fit: BoxFit.cover,
                          width: 40,
                          height: 40,
                        ),
                      ),
                      Text(
                        contacts()[index].name,
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      )
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class TopSection extends StatelessWidget {
  const TopSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: color.AppColors.backgroundColor,
          padding: const EdgeInsets.all(10),
          alignment: Alignment.topCenter,
          height: 250,
        ),
        Container(
          padding: const EdgeInsets.all(10),
          alignment: Alignment.topCenter,
          height: 380,
          decoration: BoxDecoration(
              color: color.AppColors.accentColor,
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                  child: Image.asset(
                'assets/images/man.png',
                width: 40,
                height: 40,
                alignment: Alignment.topLeft,
              )),
              Image.asset(
                'assets/images/search.png',
                width: 25,
                height: 25,
                color: Colors.white,
              ),
              const SizedBox(
                width: 20,
              ),
              Image.asset(
                'assets/images/bell.png',
                width: 25,
                height: 25,
                color: Colors.white,
              )
            ],
          ),
        ),
        Positioned(
          top: 80,
          left: 0,
          right: 0,
          child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Crédito disponible',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: color.AppColors.disableColor),
                          ),
                          const Text(
                            '\$18,645',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          )
                        ],
                      ),
                      CircleAvatar(
                        radius: 20,
                        child: Image.asset(
                          'assets/images/mx.png',
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: SizedBox(
                      height: 5,
                      child: LinearProgressIndicator(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        value: 0.9,
                        semanticsLabel: "",
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Gastado',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: color.AppColors.disableColor),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Container(
                              padding: const EdgeInsets.only(top: 4, bottom: 4),
                              child: const Text(
                                '\$1395.29',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ))
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'MX Pesos',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: color.AppColors.accentColor),
                          ),
                          Icon(
                            Icons.arrow_drop_down,
                            color: color.AppColors.accentColor,
                          )
                        ],
                      )
                    ],
                  )
                ],
              )),
        ),
        const Positioned(
            top: 260, left: 0, right: 0, child: CurrentLoanInfoPayment())
      ],
    );
  }
}
