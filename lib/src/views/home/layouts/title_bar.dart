import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TitleBar extends StatelessWidget {
  TitleBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          const Icon(
            CupertinoIcons.doc_text_search,
            color: Colors.black,
          ),
          const SizedBox(
              width: 10), // Agrega un espacio entre el logo y el texto
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Test",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                ),
              ),
              SizedBox(
                width: 3,
              ),
              Text(
                "Vocacional",
                style: TextStyle(
                  color: Colors.black,

                  fontSize: 30,
                  // fontWeight: FontWeight.bold, // Agregando negrita
                ),
              ),
              SizedBox(height: 50),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "Créditos",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ],
              )
            ],
          ),
          TextButton(
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(3),
              ),
              onPressed: () {
                // Acción cuando se presiona el botón de "Iniciar Test"
              },
              child: const Text(
                "Iniciar Test",
                style: TextStyle(color: Colors.black),
              )),
        ],
      ),
    );
  }
}
