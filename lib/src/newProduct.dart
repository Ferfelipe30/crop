import 'dart:io';
import 'package:crop/src/shop.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class newProductPage extends StatefulWidget {
  const newProductPage({super.key});

  @override
  State<newProductPage> createState() => newProductPageState();
}

class newProductPageState extends State<newProductPage> {
  final formKey = GlobalKey<FormState>();
  final _imagePiker = ImagePicker();
  final fechaNuevoProducto = TextEditingController();
  final descripcionProduct = TextEditingController();
  final nombre = TextEditingController();
  final nombreProduct = TextEditingController();
  File? _imageFile;
  final cantidadProduct = TextInputType.number;
  final direccion = TextEditingController();
  final email = TextEditingController();
  final celular = TextInputType.phone;

  @override
  void dispose() {
    super.dispose();
    descripcionProduct.dispose();
  }

  Future<void> _seleccionarFecha(BuildContext context) async {
    final DateTime? fechaSeleccionada = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: const Color.fromRGBO(238, 177, 27, 1),
            colorScheme: const ColorScheme.light(
                primary: Color.fromRGBO(238, 177, 27, 1)),
            buttonTheme:
                const ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );
    if (fechaSeleccionada != null && fechaSeleccionada != DateTime.now()) {
      fechaNuevoProducto.text =
          DateFormat('dd/MM/yyyy').format(fechaSeleccionada);
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      final pickedFile = await _imagePiker.pickImage(source: source);
      if (pickedFile != null) {
        setState(() {
          _imageFile = File(pickedFile.path);
        });
      }
    } catch (e) {
      print("Error picking image: $e");
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        //Area de la imagen
                        _imageFile != null
                            ? Image.file(
                                _imageFile!,
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
                          height: 16,
                        ),
                        //Botones para cargar imagen del produdto para la venta.
                        Row(
                          children: <Widget>[
                            ElevatedButton(
                              onPressed: () => _pickImage(ImageSource.gallery),
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromRGBO(238, 177, 27, 1),
                                foregroundColor:
                                    const Color.fromRGBO(50, 35, 12, 1),
                              ),
                              child: const Text("Galeria"),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            ElevatedButton(
                              onPressed: () => _pickImage(ImageSource.camera),
                              style: ElevatedButton.styleFrom(
                                foregroundColor:
                                    const Color.fromRGBO(50, 35, 12, 1),
                                backgroundColor:
                                    const Color.fromRGBO(238, 177, 27, 1),
                              ),
                              child: const Text("Camara"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                //nombre de producto nuevo.
                TextFormField(
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color.fromRGBO(238, 177, 27, 1),
                    labelText: 'Nombre Producto',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 1,
                  controller: nombre,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor ingrese el nombre del producto';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                //cantidad de productos
                TextFormField(
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color.fromRGBO(238, 177, 27, 1),
                    labelText: 'Cantidad Producto',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 1,
                  keyboardType: cantidadProduct,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Ingrese la cantidad de productos a la venta.';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                //fecha del nuevo producto
                TextFormField(
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.calendar_today),
                      onPressed: () => _seleccionarFecha(context),
                    ),
                    fillColor: const Color.fromRGBO(238, 177, 27, 1),
                    filled: true,
                    labelText: 'Fecha Nuevo Producto',
                    border: const OutlineInputBorder(),
                  ),
                  controller: fechaNuevoProducto,
                  maxLines: 1,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Ingrese la fecha de publicacion del nuevo producto.';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                //Descripicon del producto
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Descripcion",
                    filled: true,
                    fillColor: Color.fromRGBO(238, 177, 27, 1),
                  ),
                  maxLines: 10,
                  controller: descripcionProduct,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Ingrese el descripcion del producto';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                //Nombre del vendedor
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Nombre",
                    filled: true,
                    fillColor: Color.fromRGBO(238, 177, 27, 1),
                  ),
                  maxLines: 1,
                  controller: nombre,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Ingrese el nombre del vendedor';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                //Correo del Vendedor
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Email",
                    filled: true,
                    fillColor: Color.fromRGBO(238, 177, 27, 1),
                  ),
                  maxLines: 1,
                  controller: email,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Ingrese el correo del vendedor';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                //Direccion del Vendedor
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Direccion",
                    filled: true,
                    fillColor: Color.fromRGBO(238, 177, 27, 1),
                  ),
                  maxLines: 1,
                  controller: direccion,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Ingrese la direccion del vendedor';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                //Numero de telefono del Vendedor
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Numero Celular",
                    filled: true,
                    fillColor: Color.fromRGBO(238, 177, 27, 1),
                  ),
                  maxLines: 1,
                  keyboardType: celular,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Ingrese el numero de celular del vendedor';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                //Boton de publicar producto
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: const Color.fromRGBO(50, 35, 12, 1),
                    backgroundColor: const Color.fromRGBO(238, 177, 27, 1),
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
                            builder: (context) => const shopPage()),
                      );
                    }
                  },
                  child: const Text("Guardar"),
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
