import 'package:flutter/material.dart';
import 'package:loans_app/components/app_text_form_field_amount_loan.dart';
import 'package:loans_app/values/app_colors.dart' as color;

class RequestLoanScreen extends StatefulWidget {
  const RequestLoanScreen({Key? key}) : super(key: key);

  @override
  State<RequestLoanScreen> createState() => RequestLoanState();
}

class RequestLoanState extends State<RequestLoanScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController amountController = TextEditingController();

  List<String> list = <String>['1', '2', '3', '4', '5', '6', '7', '8'];
  String numPaymentsDropdownValue = '1';

  List<String> paymentPlan = <String>[
    '04 DIC. \$87 MXN',
  ];
  String paymentPlanDropdownValue = '04 DIC. \$87 MXN';

  List<String> accounts = <String>[
    'BANAMEX (1234)',
  ];
  String accountDropdownValue = 'BANAMEX (1234)';

  List<String> reasons = <String>[
    'Necesidades diarias',
  ];
  String reasonsDropdownValue = 'Necesidades diarias';
  bool checkedContract = false;

  @override
  void initState() {
    super.initState();
    amountController.text = "500";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.AppColors.backgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          color: Colors.white,
          onPressed: () => {Navigator.pop(context)},
        ),
        title: const Text(
          'Solicitar prestamo',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        forceMaterialTransparency: false,
        backgroundColor: color.AppColors.accentColor,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "¿Cuánto te gustaría recibir?",
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      "Recuerda que los depósitos pueden retrasarse durante los fines de semana y días festivos.",
                      style: TextStyle(
                          fontSize: 14, color: color.AppColors.contractText),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      margin: const EdgeInsets.only(top: 20),
                      child: Padding(
                        padding: const EdgeInsets.all(14),
                        child: Column(
                          children: [
                            const Text(
                              "El monto de tu crédito (MXN\$)",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: color.AppColors.secondary),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IconButton(
                                    style: const ButtonStyle().copyWith(
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              color.AppColors.primaryColor),
                                    ),
                                    onPressed: () => {},
                                    icon: const Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                    )),
                                const SizedBox(
                                  width: 10,
                                ),
                                SizedBox(
                                  width: 130,
                                  child: AppTextFormFieldAmountLoan(
                                    autofocus: true,
                                    labelText: '',
                                    hintText: "",
                                    keyboardType: TextInputType.number,
                                    textInputAction: TextInputAction.next,
                                    onChanged: (value) {
                                      _formKey.currentState?.validate();
                                    },
                                    validator: (value) {
                                      return value!.isEmpty
                                          ? 'Por favor, introduzca una cantidad.'
                                          : value.toString().length >= 3
                                              ? null
                                              : 'Número inválido';
                                    },
                                    controller: amountController,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                IconButton(
                                    style: const ButtonStyle().copyWith(
                                      shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              color.AppColors.primaryColor),
                                    ),
                                    onPressed: () => {},
                                    icon: const Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    )),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Text(
                              "Los montos deben ser múltiplos de 100.",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: color.AppColors.secondary),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Periodo del pago",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 14),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 105,
                                  height: 30,
                                  child: FilledButton(
                                      onPressed: () => {},
                                      style: const ButtonStyle().copyWith(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                color.AppColors.primaryColor),
                                        shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(6),
                                          ),
                                        ),
                                      ),
                                      child: const Text(
                                        "Quincenal",
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.white),
                                      )),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                SizedBox(
                                  width: 105,
                                  height: 30,
                                  child: FilledButton(
                                      onPressed: () => {},
                                      style: const ButtonStyle().copyWith(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                color.AppColors.grey),
                                        shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(6),
                                          ),
                                        ),
                                      ),
                                      child: const Text(
                                        "Mensual",
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.white),
                                      )),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                SizedBox(
                                  width: 105,
                                  height: 30,
                                  child: FilledButton(
                                      onPressed: () => {},
                                      style: const ButtonStyle().copyWith(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                color.AppColors.grey),
                                        shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(6),
                                          ),
                                        ),
                                      ),
                                      child: const Text(
                                        "Bimestral",
                                        style: TextStyle(
                                            fontSize: 12, color: Colors.white),
                                      )),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  width: 200,
                                  child: Text(
                                    "Número de pagos",
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.black),
                                  ),
                                ),
                                const Spacer(),
                                SizedBox(
                                    width: 50,
                                    child: DropdownButton<String>(
                                      items: list.map((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(
                                            value,
                                            textDirection: TextDirection.ltr,
                                            textAlign: TextAlign.center,
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: (value) {
                                        numPaymentsDropdownValue =
                                            value.toString();
                                      },
                                      value: numPaymentsDropdownValue,
                                      isExpanded: true,
                                    ))
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 200,
                                  child: Text(
                                    "Fecha límite de pago",
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.black),
                                  ),
                                ),
                                Spacer(),
                                SizedBox(
                                    width: 80,
                                    child: Text(
                                      "15/11/2023",
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: color.AppColors.secondary),
                                    ))
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  width: 170,
                                  child: Text(
                                    "Plan de pago",
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.black),
                                  ),
                                ),
                                const Spacer(),
                                SizedBox(
                                    width: 150,
                                    child: DropdownButton<String>(
                                      items: paymentPlan.map((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(
                                            value,
                                            style:
                                                const TextStyle(fontSize: 14),
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: (value) {
                                        paymentPlanDropdownValue =
                                            value.toString();
                                      },
                                      value: paymentPlanDropdownValue,
                                      isExpanded: true,
                                    ))
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 200,
                                  child: Text(
                                    "Cargos totales",
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.black),
                                  ),
                                ),
                                Spacer(),
                                SizedBox(
                                    width: 80,
                                    child: Text(
                                      "\$120 MXN",
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: color.AppColors.secondary),
                                    ))
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  width: 170,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Clabe",
                                        style: TextStyle(
                                            fontSize: 13, color: Colors.black),
                                      ),
                                      Text(
                                        "Cuenta del préstamo",
                                        style: TextStyle(
                                            fontSize: 11,
                                            color: color.AppColors.secondary),
                                      )
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                SizedBox(
                                    width: 150,
                                    child: DropdownButton<String>(
                                      items: accounts.map((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(
                                            value,
                                            style:
                                                const TextStyle(fontSize: 14),
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: (value) {
                                        accountDropdownValue = value.toString();
                                      },
                                      value: accountDropdownValue,
                                      isExpanded: true,
                                    ))
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(
                                  width: 150,
                                  child: Text(
                                    "Motivo del crédito",
                                    style: TextStyle(
                                        fontSize: 13, color: Colors.black),
                                  ),
                                ),
                                const Spacer(),
                                SizedBox(
                                    width: 170,
                                    child: DropdownButton<String>(
                                      items: reasons.map((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(
                                            value,
                                            style:
                                                const TextStyle(fontSize: 14),
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: (value) {
                                        reasonsDropdownValue = value.toString();
                                      },
                                      value: reasonsDropdownValue,
                                      isExpanded: true,
                                    ))
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: checkedContract,
                          onChanged: (bool? newValue) {
                            checkedContract = newValue ?? false;
                          },
                        ),
                        Flexible(
                            child: RichText(
                          text: const TextSpan(
                            text:
                                "Acepto la CARATULA DEL CONTRATO DEL CRÉDITO REVOLVENTE.",
                            style: TextStyle(
                              color: color.AppColors.contractText,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ))
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    FilledButton(
                      onPressed: _formKey.currentState?.validate() ?? false
                          ? () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      'Solicitud realizada correctamente!'),
                                ),
                              );
                              amountController.clear();
                              Navigator.pop(context);
                            }
                          : null,
                      style: const ButtonStyle().copyWith(
                        backgroundColor: MaterialStateProperty.all(
                          _formKey.currentState?.validate() ?? false
                              ? null
                              : Colors.grey.shade300,
                        ),
                      ),
                      child: const Text('SOLICITAR'),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
