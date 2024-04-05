class Images {
  Images._internal();

  factory Images() {
    return _instance;
  }
  static final Images _instance = Images._internal();

  List<String> _imagesSwiper = [
    "assets/images/programacion.jpeg",
    "assets/images/electronica.jpeg",
    "assets/images/rh.jpeg",
    "assets/images/robotica.jpeg",
    "assets/images/puericultura.jpeg"
  ];

  List<String> get imagesSwiper => _imagesSwiper;
}
