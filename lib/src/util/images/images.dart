class Images {
  static final Images _instance = Images._internal();

  factory Images() {
    return _instance;
  }

  List<String> _imagesSwiper = [
    "assets/images/programacion.jpeg",
    "assets/images/electronica.jpeg",
    "assets/images/rh.jpeg",
    "assets/images/robotica.jpeg",
    "assets/images/puericultura.jpeg"
  ];

  List<String> get imagesSwiper => _imagesSwiper;

  Images._internal();
}
