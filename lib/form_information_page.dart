import 'package:flutter/material.dart';

class FormInformationPage extends StatelessWidget {
  const FormInformationPage(
      {super.key,
      required this.name,
      required this.rut,
      required this.email,
      required this.address,
      required this.phoneNumber});

  final String name;
  final String rut;
  final String email;
  final String address;
  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Información"),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.all(MediaQuery.sizeOf(context).width * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Nombre y Apellido",
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              name,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "RUT",
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              rut,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Correo Electrónico",
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              email,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Dirección",
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              address,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Teléfono",
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              phoneNumber,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Flexible(child: Container()),
            Center(
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text("Aceptar"))),
            Flexible(child: Container()),
          ],
        ),
      ),
    );
  }
}
