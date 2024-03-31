import 'package:flutter/material.dart';

//dependencias
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter_test_vocacional_1/src/util/images/images.dart';

class SwiperHome extends StatelessWidget {
  SwiperHome({super.key});

  final List<String> _images = Images().imagesSwiper;

  @override
  Widget build(BuildContext context) {
    final List<String> images = _images;
    return SizedBox(
      height: 300,
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
      ),
    );
  }
}
