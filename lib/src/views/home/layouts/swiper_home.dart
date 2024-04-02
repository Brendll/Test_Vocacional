import 'package:flutter/material.dart';

//dependencias
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter_test_vocacional_1/src/controllers/carreras_controller/carreras_controler.dart';
import 'package:flutter_test_vocacional_1/src/models/carreers/carreras_model.dart';
import 'package:flutter_test_vocacional_1/src/routes/router.dart';

import 'package:provider/provider.dart';

/// [SwiperHome] es una clase que extiende de [StatelessWidget]
///
/// En esta clase creamos el [Swiper] para mostrar las carreras mediante una
/// lista de imagenes. Las imagenes al ser presionadas se redireccionan a una
/// pagina correspondiente a la carrera, la cual proporcionará información
/// relevante.
class SwiperHome extends StatefulWidget {
  /// [SwiperHome] es el constructor de la clase
  const SwiperHome({super.key});

  @override
  State<SwiperHome> createState() => _SwiperHomeState();
}

class _SwiperHomeState extends State<SwiperHome> {
  @override
  void initState() {
    CarrerasController().getImagenesCarreras(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final images = context.watch<CarrerasModel>().carreras;
    debugPrint('El tamanio es: ${images.length}');
    for (final element in images) {
      debugPrint('El elemento es: $element');
    }
    return SizedBox(
      height: 450,
      width: double.infinity,
      // height: 300.0,
      child: Swiper(
        viewportFraction: 0.8,
        //viewportFraction: .9,
        scale: .9,
        //scale: .15,
        itemBuilder: (BuildContext context, int index) {
          return Image.network(
            images[index].toString(),
            fit: BoxFit.fill,
            opacity: const AlwaysStoppedAnimation(1),
          );
        },
        itemCount: images.length,
        pagination: const SwiperPagination(),
        control: const SwiperControl(),
        containerHeight: 450,
        itemHeight: 450,
        itemWidth: double.maxFinite,
        duration: 3000,
        curve: Curves.fastOutSlowIn,
        autoplayDelay: 30000,

        physics: const ScrollPhysics(),
        allowImplicitScrolling: true,
        autoplay: true,
        onTap: (index) =>
            // Routes.showScreen(context, 'carreras', arguments: index),
            Navigator.pushNamed(context, '/carreras', arguments: index),
      ),
    );
  }
}
