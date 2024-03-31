import 'package:flutter/material.dart';

import 'package:flutter_test_vocacional_1/src/controllers/login_controller.dart';
import 'package:flutter_test_vocacional_1/src/services/auth/auth.dart';
import 'package:flutter_test_vocacional_1/src/views/home/layouts/swiper_home.dart';
import 'package:flutter_test_vocacional_1/src/views/home/layouts/title_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: const Color(0xFFDDDDDD),
        title: TitleBar(),
        centerTitle: true,
        elevation: 1.0,
        actionsIconTheme: const IconThemeData(
          color: Color.fromARGB(255, 0, 0, 0),
        ),
        actions: [
          if (LoginController().authService.status == AuthStatus.Authenticated)
            IconButton(
              icon: const Icon(Icons.exit_to_app),
              onPressed: () {
                LoginController().signOut(context);
              },
            ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          SwiperHome(),
          const SizedBox(height: 50),
          Center(
            child: Column(
              children: [
                const Text(
                  "Centro de Bachillerato Tecnológico Industrial y de Servicios No. 61",
                  style: TextStyle(
                    fontSize: 25,
                    color: Color.fromARGB(246, 0, 0, 0),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment
                      .center, // Centra los logotipos horizontalmente
                  children: [
                    Image.asset(
                      "assets/images/rojo.png", // Ruta de tu primer imagen
                      height: 70, // Ajusta la altura según sea necesario
                    ),
                    const SizedBox(width: 20), // Espacio entre los logotipos
                    Image.asset(
                      'assets/images/logo2.png', // Ruta de tu segundo imagen
                      height: 50, // Ajusta la altura según sea necesario
                    ),
                  ],
                ),

                const SizedBox(
                    height:
                        20), // Espacio entre la imagen del plantel y la sección de oferta educativa
                const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Ofertas Educativas",
                        style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(246, 0, 0, 0),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ]),
                const SizedBox(height: 20),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount:
                      3, // Ajusta según la cantidad de ingenierías que tengas
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        DataTable(
                          columns: const [
                            DataColumn(label: Text('Carrera')),
                            DataColumn(label: Text('Descripción')),
                            DataColumn(label: Text('Carrera')),
                            DataColumn(label: Text('Descripción')),
                          ],
                          rows: const [
                            DataRow(cells: [
                              DataCell(Text('Carrera A')),
                              DataCell(Text('Descripción A')),
                              DataCell(Text('Carrera B')),
                              DataCell(Text('Descripción B')),
                            ]),
                          ],
                        ),
                        const SizedBox(
                            height:
                                20), // Espacio entre las filas de ingenierías
                      ],
                    );
                  },
                ),

                const SizedBox(
                    height:
                        20), // Agrega espacio entre las ingenierías y los botones
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Acción cuando se presiona el botón de "Iniciar Test"
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor:
                            Colors.blue, // Color del texto del botón
                        elevation: 3, // Elevación del botón
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 15), // Ajusta el tamaño del botón
                      ),
                      child: const Text('Iniciar Test'),
                    ),
                    const SizedBox(width: 20), // Espacio entre los botones
                    ElevatedButton(
                      onPressed: () {
                        // Acción cuando se presiona el botón de "Registrarse"
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor:
                            Colors.green, // Color del texto del botón
                        elevation: 3, // Elevación del botón
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 15), // Ajusta el tamaño del botón
                      ),
                      child: const Text('Registrarse'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
