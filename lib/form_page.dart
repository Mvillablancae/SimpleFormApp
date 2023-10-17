import 'package:flutter/material.dart';
import 'package:simple_form/form_information_page.dart';

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
  void initState() {
    phoneController.text = '+569';
    super.initState();
  }

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
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null ||
                              value.contains(".") ||
                              value.contains("-") ||
                              value.length < 8 ||
                              value.length > 9) {
                            return 'Por favor ingrese rut sin punto ni guión';
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
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              !value.contains(".") ||
                              !value.contains("@") ||
                              value.contains(" ") ||
                              value.length < 5) {
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
                          labelText: "+569",
                          hintText: "Teléfono",
                          fillColor: Colors.white,
                          border: textInputDecoration,
                        ),
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Por favor ingrese su número';
                          } else if (!(value.startsWith("+569"))) {
                            return 'Por favor ingrese su número con +569';
                          } else if (value.length != 12) {
                            return 'Por favor ingrese un número válido';
                          }
                          return null;
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
