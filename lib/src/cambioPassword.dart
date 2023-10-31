import 'package:crop/src/open.dart';
import 'package:flutter/material.dart';

class cambioPasswordPage extends StatefulWidget {
  const cambioPasswordPage({super.key});

  @override
  State<cambioPasswordPage> createState() => cambioPasswordPageState();
}

class cambioPasswordPageState extends State<cambioPasswordPage> {
  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email',
                  filled: true,
                  fillColor: Color.fromRGBO(238, 177, 27, 1),
                ),
                maxLines: 1,
                controller: email,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Ingrese el correo';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(238, 177, 27, 1),
                  foregroundColor: const Color.fromRGBO(50, 35, 12, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Alerta!!!'),
                        content: const Text(
                            'Se mando al correo la contraseña actual que se tiene registrada.'),
                        actions: <Widget>[
                          FloatingActionButton(
                            child: const Text('Ok'),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const openPage()));
                            },
                          ),
                        ],
                      ),
                    );
                  }
                },
                child: const Text('Restablecer'),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: const Color.fromRGBO(59, 89, 29, 1),
    );
  }
}
