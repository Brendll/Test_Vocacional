import 'package:flutter/material.dart';

//dependencias
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter_test_vocacional_1/src/controllers/carreras_controller/carreras_controler.dart';
import 'package:flutter_test_vocacional_1/src/models/carreers/carreras_model.dart';

import 'package:provider/provider.dart';

class SwiperHome extends StatefulWidget {
  const SwiperHome({super.key});

  @override
  State<SwiperHome> createState() => _SwiperHomeState();
}

class _SwiperHomeState extends State<SwiperHome> {
  @override
  void initState() {
    // TODO: implement initState
    CarrerasController().getImagenesCarreras(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List images = context.watch<CarrerasModel>().carreras;
    debugPrint('El tamanio es: ${images.length.toString()}');
    for (var element in images) {
      debugPrint('El elemento es: ${element.toString()}');
    }
    return SizedBox(
      height: 400,
      width: double.infinity,
      // height: 300.0,
      child: Swiper(
        viewportFraction: 0.8,
        scale: 0.9,
        itemBuilder: (BuildContext context, int index) {
          return Image.network(
            images[index],
            fit: BoxFit.fill,
          );
        },
        itemCount: images.length,
        pagination: const SwiperPagination(),
        control: const SwiperControl(),
        containerHeight: 450,
        duration: 5000,
        autoplay: true,
        loop: true,
        index: images.length - 1,
        onTap: (index) =>
            Navigator.pushNamed(context, 'carreras', arguments: index),
      ),
    );
  }
}
