import 'package:flutter/material.dart';
import 'package:loans_app/components/app_text_form_field.dart';
import 'package:loans_app/components/app_text_form_field_without_border.dart';
import 'package:loans_app/values/app_colors.dart' as color;

class AddAccountScreen extends StatefulWidget {
  const AddAccountScreen({super.key});

  @override
  State<AddAccountScreen> createState() => AddAccountState();
}

class AddAccountState extends State<AddAccountScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController accountNumberController = TextEditingController();
  TextEditingController bankController = TextEditingController();
  TextEditingController ownerAccountController = TextEditingController();
  TextEditingController aliasAccountController = TextEditingController();

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
          'Nueva cuenta',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        forceMaterialTransparency: false,
        backgroundColor: color.AppColors.accentColor,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const Text(
                      "Escribe el número de Tarjeta, Cuenta, CLABE para transferir a una nueva cuenta,"),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    margin: const EdgeInsets.only(top: 20),
                    child: Padding(
                      padding: const EdgeInsets.all(14),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Ingresa el número"),
                          AppTextFormFieldWithOutBorder(
                            autofocus: true,
                            labelText: '',
                            hintText: "Ej: 12345",
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            onChanged: (value) {
                              _formKey.currentState?.validate();
                            },
                            validator: (value) {
                              return value!.isEmpty
                                  ? 'Por favor, introduzca el número de Tarjeta, Cuenta o CLABE.'
                                  : value.length > 10
                                      ? null
                                      : 'Número inválido';
                            },
                            controller: accountNumberController,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 35, horizontal: 6),
                    child: Column(
                      children: [
                        AppTextFormField(
                          labelText: 'Banco',
                          enabled: false,
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          onChanged: (value) {
                            _formKey.currentState?.validate();
                          },
                          controller: bankController,
                        ),
                        AppTextFormField(
                          labelText: 'Nombre y apellidos',
                          hintText: "del titular de la cuenta",
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          onChanged: (value) {
                            _formKey.currentState?.validate();
                          },
                          validator: (value) {
                            return value!.isEmpty
                                ? 'Por favor, introduzca su nombre y apellidos'
                                : value.length > 10
                                    ? null
                                    : 'Nombre y apellidos inválidos';
                          },
                          controller: ownerAccountController,
                        ),
                        AppTextFormField(
                          labelText: 'Alias',
                          hintText: "del titular de la cuenta",
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          onChanged: (value) {
                            _formKey.currentState?.validate();
                          },
                          validator: (value) {
                            return value!.isEmpty
                                ? 'Por favor, introduzca el alias'
                                : value.length > 10
                                    ? null
                                    : 'Alias inválido';
                          },
                          controller: aliasAccountController,
                        ),
                        FilledButton(
                          onPressed: _formKey.currentState?.validate() ?? false
                              ? () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          'Cuenta agregada correctamente!'),
                                    ),
                                  );
                                  accountNumberController.clear();
                                  bankController.clear();
                                  ownerAccountController.clear();
                                  aliasAccountController.clear();
                                  Navigator.pop(context);
                                }
                              : null,
                          style: const ButtonStyle().copyWith(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            backgroundColor: MaterialStateProperty.all(
                              _formKey.currentState?.validate() ?? false
                                  ? null
                                  : Colors.grey.shade300,
                            ),
                          ),
                          child: const Text('AGREGAR'),
                        ),
                      ],
                    ),
                  )
                ],
              )),
        )),
      ),
    );
  }
}
