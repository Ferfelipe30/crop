import 'dart:io';
import 'package:crop/src/nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class openUserPage extends StatefulWidget {
  const openUserPage({super.key});

  @override
  State<openUserPage> createState() => openUserPageState();
}

class openUserPageState extends State<openUserPage> {
  final formKey = GlobalKey<FormState>();
  final imagePicker = ImagePicker();
  File? imageFile;
  final nombre = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final confiPassword = TextEditingController();
  final numCelular = TextInputType.phone;
  final direccion = TextEditingController();
  final fechaNacimiento = TextEditingController();

  Future<void> pickImage(ImageSource source) async {
    try {
      final pickedFile = await imagePicker.pickImage(source: source);
      if (pickedFile != null) {
        setState(() {
          imageFile = File(pickedFile.path);
        });
      }
    } catch (e) {
      print("Error picking image: $e");
    }
  }

  Future<void> seleccionarFecha(BuildContext context) async {
    final DateTime? fechaseleccionada = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
            data: ThemeData.light().copyWith(
              primaryColor: const Color.fromRGBO(238, 177, 27, 1),
              colorScheme: const ColorScheme.light(
                primary: Color.fromRGBO(238, 177, 27, 1),
              ),
              buttonTheme:
                  const ButtonThemeData(textTheme: ButtonTextTheme.primary),
            ),
            child: child!);
      },
    );
    if (fechaseleccionada != null && fechaseleccionada != DateTime.now()) {
      fechaNacimiento.text = DateFormat('dd/MM/yyyy').format(fechaseleccionada);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                //Imagen de perfil
                imageFile != null
                    ? Image.file(
                        imageFile!,
                        width: 150,
                        height: 150,
                        fit: BoxFit.cover,
                      )
                    : Container(
                        width: 150,
                        height: 150,
                        color: const Color.fromRGBO(238, 177, 27, 1),
                        child: const Icon(
                          Icons.image,
                          size: 50,
                          color: Color.fromRGBO(50, 35, 12, 1),
                        ),
                      ),
                const SizedBox(
                  height: 10,
                ),
                //Botones para cargar la imagen de perfil.
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                        onPressed: () => pickImage(ImageSource.gallery),
                        style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(238, 177, 27, 1)),
                        child: const Text('Galeria')),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: () => pickImage(ImageSource.camera),
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromRGBO(238, 177, 27, 1)),
                      child: const Text("Camara"),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                //Nombre de perfil
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nombre',
                    filled: true,
                    fillColor: Color.fromRGBO(238, 177, 27, 1),
                  ),
                  maxLines: 1,
                  controller: nombre,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Ingrese su nombre';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                //Correo del usuario para registrarse
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
                      return 'Ingrese su correo';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                //Password del usuario.
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    filled: true,
                    fillColor: Color.fromRGBO(238, 177, 27, 1),
                  ),
                  maxLines: 1,
                  controller: password,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Ingrese su password';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                //confirmar la contrasela que coloca
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Confirma Password',
                    filled: true,
                    fillColor: Color.fromRGBO(238, 177, 27, 1),
                  ),
                  maxLines: 1,
                  controller: confiPassword,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Ingrese el password';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                //Fecha de Nacimiento del usuario
                TextFormField(
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () => seleccionarFecha(context),
                      icon: const Icon(Icons.calendar_today),
                    ),
                    filled: true,
                    fillColor: const Color.fromRGBO(238, 177, 27, 1),
                    labelText: 'Fecha de Nacimiento',
                    border: const OutlineInputBorder(),
                  ),
                  readOnly: true,
                  controller: fechaNacimiento,
                  onTap: () => seleccionarFecha(context),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Seleccione la fecha de nacimiento.';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                //Numero de celular del usuario
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Numero de Celular',
                    filled: true,
                    fillColor: Color.fromRGBO(238, 177, 27, 1),
                  ),
                  maxLines: 1,
                  keyboardType: numCelular,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Ingrese el numero de celular';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                //Direccion de vivienda del usuario
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Direccion',
                    filled: true,
                    fillColor: Color.fromRGBO(238, 177, 27, 1),
                  ),
                  maxLines: 1,
                  controller: direccion,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Ingrese la direccion';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                //Boton de registro
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

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const navPage()));
                      }
                    },
                    child: const Text('Login')),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: const Color.fromRGBO(59, 89, 29, 1),
    );
  }
}
