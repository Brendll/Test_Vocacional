import 'package:flutter/material.dart';

class Colores {
  // Constructor privado
  Colores._private();

  // Instancia única de la clase
  static final Colores _instancia = Colores._private();

  // Factor de creación de instancia
  factory Colores() {
    return _instancia;
  }

  // Colores para la interfaz de usuario
  static const Color colorFondoClaro = Color(0xffffffff); // Fondo claro
  static const Color colorFondoFuerte = Color(0x007aa2e3); // Fondo fuerte
  static const Color colorAppBar = Color(0xFFF8F6E3); // Color de la AppBar
  static const Color colorTealDebil = Color(0xff97E7E1); // Teal débil
  static const Color colorTealFuerte = Color(0xff6AD4DD); // Teal fuerte

  // Colores para el drawer
  /// [colorFondoDrawerHeader] - Color del Drawer Header Color(0xff92C7CF)
  static const Color colorFondoDrawerHeader =
      Color(0xff92C7CF); // Color del boton
  /// [colorFondoDrawer] - Color del Drawer Color(0xFFFFFFFF)
  static const Color colorFondoDrawer = Color(0xFFFFFFFF); // Color del boton

  // Colores adicionales para la aplicación de test vocacional
  static const Color colorPrimario = Color(0xff4CAF50); // Verde primario
  static const Color colorSecundario = Color(0xffFFC107); // Amarillo secundario
  static const Color colorAcento = Color(0xff2196F3); // Azul acento
  static const Color colorError = Color(0xffF44336); // Rojo error

  // Colores de texto
  static const Color colorTextoClaro = Colors.black87; // Texto en fondo claro
  static const Color colorTextoFuerte = Colors.white; // Texto en fondo fuerte

  // Otros colores relacionados con el test vocacional
  static const Color colorOpcionSeleccionada =
      Color(0xffFFEB3B); // Amarillo para opción seleccionada
  static const Color colorOpcionCorrecta =
      Color(0xff4CAF50); // Verde para opción correcta
  static const Color colorOpcionIncorrecta =
      Color(0xffF44336); // Rojo para opción incorrecta
}
