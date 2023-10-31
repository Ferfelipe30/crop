import 'package:crop/src/shopped.dart';
import 'package:flutter/material.dart';

class shopPage extends StatefulWidget {
  const shopPage({super.key});

  @override
  State<shopPage> createState() => shopPageState();
}

class shopPageState extends State<shopPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        labelText: 'Buscar',
                        filled: true,
                        fillColor: Color.fromRGBO(238, 177, 27, 1),
                        border: OutlineInputBorder(),
                      ),
                      maxLines: 1,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(238, 177, 27, 1),
                        foregroundColor: const Color.fromRGBO(50, 35, 12, 1),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const shoppedPage()));
                      },
                      child: const Icon(Icons.shopping_cart)),
                ],
              ),
            ],
          ),
        ),
      ),
      backgroundColor: const Color.fromRGBO(59, 89, 29, 1),
    );
  }
}
