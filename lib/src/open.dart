import 'package:crop/src/cambioPassword.dart';
import 'package:crop/src/nav.dart';
import 'package:crop/src/openUser.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class openPage extends StatefulWidget {
  const openPage({super.key});

  @override
  State<openPage> createState() => openPageState();
}

// ignore: camel_case_types
class openPageState extends State<openPage> {
  final formKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 150,
                ),
                Image.asset(
                  'imagen/logoApp.png',
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 20,
                ),
                //Correo de ingreso
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
                      return 'Ingresa el email';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                //ingreso de password
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    filled: true,
                    fillColor: Color.fromRGBO(238, 177, 27, 1),
                  ),
                  maxLines: 1,
                  controller: password,
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Ingresa el password';
                    }
                    return null;
                  },
                ),
                //Se le olvido el password
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const cambioPasswordPage(),
                        ));
                  },
                  child: const Text(
                    'Forgot Password',
                    style: TextStyle(
                        color: Color.fromRGBO(50, 35, 12, 1), fontSize: 20),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                //Boton de iniciar seccion.
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(238, 177, 27, 1),
                      foregroundColor: const Color.fromRGBO(50, 35, 12, 1),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0)),
                    ),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        print("Email: $email, Contraseña: $password");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const navPage(),
                            ));
                      }
                    },
                    child: const Text("Login")),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'Does not have account?',
                      style: TextStyle(fontSize: 20),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const openUserPage(),
                            ));
                      },
                      child: const Text(
                        'Sign in',
                        style: TextStyle(
                            fontSize: 20, color: Color.fromRGBO(50, 35, 12, 1)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: const Color.fromRGBO(59, 89, 29, 1),
    );
  }
}
