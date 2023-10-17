import 'package:flutter/material.dart';

import 'form_page.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Principal'),
        ),
        drawer: Drawer(
          child: Builder(builder: (context) {
            return ListView(
              padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Text('Formularioapp'),
                ),
                ListTile(
                  title: const Text('Inicio'),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  title: const Text('Formulario'),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                      return const FormPage();
                    }));
                  },
                ),
                ListTile(
                  title: const Text('Opcion 2'),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
                ListTile(
                  title: const Text('Opcion 3'),
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          }),
        ),
        body: const Center(
          child: Text('Página principal'),
        ),
      ),
    );
  }
}
