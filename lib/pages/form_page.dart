import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_form/pages/form_information_page.dart';
import 'package:simple_form/utils/rut_formatter.dart';
import 'package:simple_form/utils/rut_helper.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final rutController = TextEditingController();
  final addressController = TextEditingController();
  final phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final OutlineInputBorder textInputDecoration = OutlineInputBorder(
    borderRadius: BorderRadius.circular(25.0),
    borderSide: const BorderSide(),
  );

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    rutController.dispose();
    addressController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulario'),
      ),
      body: ListView(
        children: [
          Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.always,
              child: Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.fromLTRB(8, 16, 8, 8),
                      child: TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(
                          labelText: "Ingrese su nombre",
                          hintText: "Nombre y Apellido",
                          fillColor: Colors.white,
                          border: textInputDecoration,
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter(RegExp("/^[a-z ,.'-]+\$/i"), allow: true)
                        ],
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor rellene el campo';
                          }
                          return null;
                        },
                      )),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: rutController,
                        decoration: InputDecoration(
                          labelText: "Rut sin punto ni guión",
                          hintText: "RUT",
                          fillColor: Colors.white,
                          border: textInputDecoration,
                        ),
                        textInputAction: TextInputAction.next,
                        inputFormatters: [
                          FilteringTextInputFormatter(RegExp("[0-9kK.-]"), allow: true),
                          LengthLimitingTextInputFormatter(12),
                          RutFormatter(),
                        ],
                        validator: (value) {
                          if (value == null || !RutHelper.check(value)) {
                            return 'Por favor ingrese rut correctamente';
                          }
                          return null;
                        },
                      )),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: emailController,
                        decoration: InputDecoration(
                          labelText: "Ingrese su email",
                          hintText: "Correo electrónico",
                          fillColor: Colors.white,
                          border: textInputDecoration,
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter(RegExp("[a-zA-Z0-9@.]"), allow: true),
                          LengthLimitingTextInputFormatter(8),
                        ],
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingrese email válido';
                          }
                          return null;
                        },
                      )),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: addressController,
                        decoration: InputDecoration(
                          labelText: "Ingrese dirección",
                          hintText: "Dirección",
                          fillColor: Colors.white,
                          border: textInputDecoration,
                        ),
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.streetAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor rellene el campo';
                          }
                          return null;
                        },
                      )),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: phoneController,
                        decoration: InputDecoration(
                          prefix: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4.0),
                            child: Text(
                              '+569',
                              style: TextStyle(color: Colors.grey[800]),
                            ),
                          ),
                          labelText: "Teléfono",
                          hintText: "Teléfono",
                          fillColor: Colors.white,
                          border: textInputDecoration,
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                          LengthLimitingTextInputFormatter(8),
                        ],
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingrese su número';
                          } else if (value.length != 9) {
                            return 'Por favor ingrese un número válido';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          if (value.length >= 5) {
                            phoneController.text = value.substring(0, 4) +
                                " " +
                                (value.length > 5 ? value.substring(4, value.length) : value[4]);
                            phoneController.selection = TextSelection.fromPosition(
                                TextPosition(offset: phoneController.text.length));
                          }
                        },
                        onEditingComplete: () {
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Guardando información'),
                                duration: Duration(seconds: 1),
                              ),
                            );
                            Future.delayed(const Duration(seconds: 1)).then(
                              (value) => Navigator.of(context).pushReplacement(
                                MaterialPageRoute(builder: (context) {
                                  return FormInformationPage(
                                    address: addressController.value.text,
                                    email: emailController.value.text,
                                    name: nameController.value.text,
                                    phoneNumber: phoneController.value.text,
                                    rut: rutController.value.text,
                                  );
                                }),
                              ),
                            );
                          }
                        },
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Guardando información')),
                          );
                          await Future.delayed(Duration(seconds: 1));
                          Navigator.of(context)
                              .pushReplacement(MaterialPageRoute(builder: (context) {
                            return FormInformationPage(
                              address: addressController.value.text,
                              email: emailController.value.text,
                              name: nameController.value.text,
                              phoneNumber: phoneController.value.text,
                              rut: rutController.value.text,
                            );
                          }));
                        }
                      },
                      child: const Text('Guardar'),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}
