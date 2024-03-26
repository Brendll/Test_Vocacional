import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({super.key});

  List<String> images = [
    "assets/images/programacion.jpeg",
    "assets/images/electronica.jpeg",
    "assets/images/rh.jpeg",
    "assets/images/robotica.jpeg",
    "assets/images/puericultura.jpeg"
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CBTIS No.61',
      debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,
      showSemanticsDebugger: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: const Color.fromARGB(0, 214, 219, 137),
        colorScheme: const ColorScheme.light(primary: Color.fromARGB(0, 192, 32, 32)),
      ),
      home: Scaffold(
         appBar: AppBar(
  toolbarHeight: 50,
  backgroundColor: const Color(0xFFDDDDDD),
  title: const Padding(
    padding: EdgeInsets.all(20),
    child: Row(
      children: [
        Icon(
          CupertinoIcons.doc_text_search,
          color: Colors.black,
          ),
        SizedBox(width: 10), // Agrega un espacio entre el logo y el texto
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Test",
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Nunito-Medium',
                fontSize: 24,
              ),
            ),
            SizedBox(width: 3,),
            Text( 
              "Vocacional",
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Nunito-Medium',
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
                      fontFamily: 'Nunito-Medium',
                      fontSize: 18,
                    ),
                  ),
                ],
            )
          ],
        ),
      ],
    ),
  ),
),

         body: ListView(
  children: <Widget>[
    Container(
      child: swiper(),
    ),
    const SizedBox(height: 50),
    Center(
      child: Column(
        children: [
          const Text(
            "Centro de Bachillerato Tecnológico Industrial y de Servicios No. 61", 
            style: TextStyle(
              fontFamily: 'Nunito',
              fontSize: 25,
              color: Color.fromARGB(246, 0, 0, 0),
            ),
          ),
           Row(
          mainAxisAlignment: MainAxisAlignment.center, // Centra los logotipos horizontalmente
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

          const SizedBox(height: 20), // Espacio entre la imagen del plantel y la sección de oferta educativa
          const Row(
           crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
            "Ofertas Educativas", 
            style: TextStyle(
              fontFamily: 'Nunito',
              fontSize: 20,
              color: Color.fromARGB(246, 0, 0, 0),
              fontWeight: FontWeight.bold,
            ),
          ),
            ]
            ),
               const SizedBox(height: 20),
        ListView.builder(
          shrinkWrap: true,
          itemCount: 3, // Ajusta según la cantidad de ingenierías que tengas
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
                const SizedBox(height: 20), // Espacio entre las filas de ingenierías
              ],
            );
          },
        ),


       const SizedBox(height: 20), // Agrega espacio entre las ingenierías y los botones
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Acción cuando se presiona el botón de "Iniciar Test"
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.blue, // Color del texto del botón
                elevation: 3, // Elevación del botón
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15), // Ajusta el tamaño del botón
              ),
              child: const Text('Iniciar Test'),
            ),
            const SizedBox(width: 20), // Espacio entre los botones
            ElevatedButton(
              onPressed: () {
                // Acción cuando se presiona el botón de "Registrarse"
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.green, // Color del texto del botón
                elevation: 3, // Elevación del botón
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15), // Ajusta el tamaño del botón
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
      ),
    );
    
  }

  Widget swiper() {
    return SizedBox( 
      height:300,
      width: double.infinity,
     // height: 300.0,
      child: Swiper(
        viewportFraction: 0.8,
        scale: 0.9 ,
        itemBuilder: (BuildContext context, int index) {
          return Image.network(
            images[index],
            fit: BoxFit.fill,
          );
        },
        itemCount: images.length,
        pagination: const SwiperPagination(),
        control: const SwiperControl(),
      ),
    );
  }
}
