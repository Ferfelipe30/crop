import 'package:flutter/material.dart';

class shoppedPage extends StatefulWidget {
  const shoppedPage({super.key});

  @override
  State<shoppedPage> createState() => ShoppedPageState();
}

class ShoppedPageState extends State<shoppedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  labelText: 'Buscar',
                  filled: true,
                  fillColor: Color.fromRGBO(238, 177, 27, 1),
                  border: OutlineInputBorder(),
                ),
                maxLines: 1,
              ),
            ],
          ),
        ),
      ),
      backgroundColor: const Color.fromRGBO(59, 89, 29, 1),
    );
  }
}
