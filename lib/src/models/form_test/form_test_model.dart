import 'package:flutter/material.dart';

class FormTestModel extends ChangeNotifier {
  FormTestModel(); // Constructor sin nombre

  // Constructores privados
  FormTestModel._internal();
  // Instancia única de la clase FormTestModel
  static final FormTestModel _instance = FormTestModel._internal();

  // Método estático para acceder a la instancia única de la clase
  static FormTestModel get instance => _instance;
  FormTestModelStatus _status = FormTestModelStatus.Ended;
  String _errorCode = '';

  String _errorMessage = '';
  List<List<List<int>>> _respuestas = [
    List.generate(
      10, // fillas - es equivalente a los 10 formularios del primer tema
      (_) => List.filled(
        6, // columnas - es equivalente a las 6 preguntas
        -1, // es equivalente al valor del radio que tiene cada pregunta,
        //la cual es de 0 a 4
      ),
    ), // Primer arreglo con 10 sublistas, cada una con 6 valores -1
    List.generate(
      10, // fillas - es equivalente a los 10 formularios del segundo tema
      (_) => List.filled(
        6, // columnas  - es equivalente a las 6 preguntas
        -1, // es equivalente al valor del radio que tiene cada pregunta,
      ),
    ), // Segundo arreglo con 10 sublistas, cada una con 6 valores -1
  ];

  List<int> _sumaRespuestasFormulario1 = List.generate(10, (_) => 0);

  List<int> _sumaRespuestasFormulario2 = List.generate(10, (_) => 0);

  List<String> _preguntasEncabezadoForm1 = [
    //preguntaEncabezado
    '¿Qué tanto te gustaría trabajar como…?',

    //respuesta0
    'Me desagrada mucho o totalmente',

    //respuesta1
    'Me desagrada algo o en parte.',

    //respuesta2
    'Me es indiferente, ni me gusta ni me disgusta.',

    //respuesta3
    'Me gusta algo o en parte.',

    //respuesta4
    'Me gusta mucho.',
  ];

  List<String> _preguntasEncabezadoForm2 = [
    //preguntaEncabezado
    '¿Qué tan apto te consideras para…?',

    //respuesta0
    'Considero ser incompetente',

    //respuesta1
    'Considero ser muy poco competente',

    //respuesta2
    'Considero ser medianamente competente',

    //respuesta3
    'Considero ser competente',

    //respuesta4
    'Considero ser muy competente',
  ];

  List<String> get preguntasEncabezadoForm2 => _preguntasEncabezadoForm2;

  set preguntasEncabezadoForm2(List<String> value) {
    _preguntasEncabezadoForm2 = value;
    notifyListeners();
  }

  List<List<String>> _form1 = [
    // Formulario 1
    [
      //titleTable
      '''
Test de intereses.
Un interés es el gusto que tienes por realizar una actividad.
Campo de trabajo 1
''',

      // Preguntas
      //pregunta1
      'Atender y cuidar enfermos.',

      //pregunta2
      'Proteger a los muchachos menores del grupo.',

      //pregunta3
      'Ser miembro de una sociedad de ayuda y asistencia.',

      //pregunta4
      'Enseñar a leer a los analfabetos.',

      //pregunta5
      'Ayudar a tus compañeros en sus dificultades y preocupaciones.',

      //pregunta6
      'Funcionario al servicio de las clases humildes.',
    ],

    // Formulario 2
    [
      //titleTable
      '''
Test de intereses.
Un interés es el gusto que tienes por realizar una actividad.
Campo de trabajo 2
''',

      // Preguntas
      //pregunta1
      'Intervenir activamente en las discusiones de clase.',

      //pregunta2
      'Ser jefe de grupo.',

      //pregunta3
      'Dirigir la campaña política de un candidato estudiantil.',

      //pregunta4
      'Dirigir la campaña política de un candidato estudiantil.',

      //pregunta5
      'Leer biografías de políticos eminentes.',

      //pregunta6
      'Experto en relaciones sociales de una gran empresa.',
    ],

    // Formulario 3
    [
      //titleTable
      '''
Test de intereses.
Un interés es el gusto que tienes por realizar una actividad.
Campo de trabajo 3
''',

      // Preguntas
      //pregunta1
      'Escribir cuentos, crónicas o artículos.',

      //pregunta2
      'Leer obras literarias.',

      //pregunta3
      'Hacer versos para una publicación.',

      //pregunta4
      'Representar un papel en una obra de teatro.',

      //pregunta5
      'Participar en un concurso de oratoria.',

      //pregunta6
      'Escritor en un periódico o empresa editorial.',
    ],

    // Formulario 4
    [
      //titleTable
      '''
Test de intereses.
Un interés es el gusto que tienes por realizar una actividad.
Campo de trabajo 4
''',

      // Preguntas
      //pregunta1
      'Dibujar y pintar.',

      //pregunta2
      'Modelar con barro, plastilina o cualquier otro material.',

      //pregunta3
      'Encargarte del decorado del lugar para un festival.',

      //pregunta4
      'Idear y mostrar el escudo de un club o sociedad.',

      //pregunta5
      'Diseñar el vestuario para una función teatral.',

      //pregunta6
      'Dibujante profesional en una empresa.',
    ],

    // Formulario 5
    [
      //titleTable
      '''
Test de intereses.
Un interés es el gusto que tienes por realizar una actividad.
Campo de trabajo 5
''',

      // Preguntas
      //pregunta1
      'Cantar en un coro estudiantil.',

      //pregunta2
      'Escuchar música clásica.',

      //pregunta3
      'Aprender a escribir a máquina y en taquigrafía.',

      //pregunta4
      'Ser miembro de una asociación musical.',

      //pregunta5
      'Leer biografías de músicos eminentes.',

      //pregunta6
      'Concertista en una sinfónica.',
    ],

    // Formulario 6
    [
      //titleTable
      '''
Test de intereses.
Un interés es el gusto que tienes por realizar una actividad.
Campo de trabajo 6
''',

      // Preguntas
      //pregunta1
      'Llevar en orden tus libros y cuadernos.',

      //pregunta2
      'Ordenar y clasificar los libros de una biblioteca.',

      //pregunta3
      'Aprender a tocar un instrumento musical.',

      //pregunta4
      'Ayudar a calificar pruebas.',

      //pregunta5
      'Encargarte del archivo y los documentos de una sociedad.',

      //pregunta6
      'Técnico organizador de oficinas.',
    ],

    // Formulario 7
    [
      //titleTable
      '''
Test de intereses.
Un interés es el gusto que tienes por realizar una actividad.
Campo de trabajo 7
''',

      //preguntaEncabezado
      '¿Qué tanto te gustaría trabajar como…?',

      //respuesta0
      'Me desagrada mucho o totalmente',

      //respuesta1
      'Me desagrada algo o en parte.',

      //respuesta2
      'Me es indiferente, ni me gusta ni me disgusta.',

      //respuesta3
      'Me gusta algo o en parte.',

      //respuesta4
      'Me gusta mucho.',

      // Preguntas
      //pregunta1
      'Conocer y estudiar la estructura de las plantas y de los animales.',

      //pregunta2
      'Hacer experimentos en un laboratorio.',

      //pregunta3
      'Investigar el origen de las costumbre de los pueblos.',

      //pregunta4
      'Estudiar y entender las causas de los movimientos sociales.',

      //pregunta5
      'Leer revistas y libros científicos.',

      //pregunta6
      'Investigador en un laboratorio.',
    ],

    // Formulario 8
    [
      //titleTable
      '''
Test de intereses.
Un interés es el gusto que tienes por realizar una actividad.
Campo de trabajo 8
''',

      //preguntaEncabezado
      '¿Qué tanto te gustaría trabajar como…?',

      //respuesta0
      'Me desagrada mucho o totalmente',

      //respuesta1
      'Me desagrada algo o en parte.',

      //respuesta2
      'Me es indiferente, ni me gusta ni me disgusta.',

      //respuesta3
      'Me gusta algo o en parte.',

      //respuesta4
      'Me gusta mucho.',

      // Preguntas
      //pregunta1
      'Resolver cuestiones matemáticas.',

      //pregunta2
      'Resolver problemas de aritmética.',

      //pregunta3
      'Llevar las cuentas de una institución.',

      //pregunta4
      'Explicar a otros cómo resolver problemas de matemáticas.',

      //pregunta5
      'Participar en concursos de matemáticas.',

      //pregunta6
      'Experto calculista en una institución.',
    ],

    // Formulario 9
    [
      //titleTable
      '''
Test de intereses.
Un interés es el gusto que tienes por realizar una actividad.
Campo de trabajo 9
''',

      // Preguntas
      //pregunta1
      'Armar y desarmar objetos.',

      //pregunta2
      'Manejar herramientas y maquinaria.',

      //pregunta3
      'Construir objetos o muebles.',

      //pregunta4

      'Reparar las instalaciones eléctricas, de gas o de plomería en tu casa.',

      //pregunta5
      'Proyectar y dirigir alguna construcción.',

      //pregunta6
      'Perito mecánico en un taller.',
    ],

    // Formulario 10
    [
      //titleTable
      '''
Test de intereses.
Un interés es el gusto que tienes por realizar una actividad.
Campo de trabajo 10
''',

      // Preguntas
      //pregunta1
      'Salir de excursión.',

      //pregunta2
      'Pertenecer a un club de exploradores.',

      //pregunta3
      'Trabajar al aire libre, fuera de la ciudad.',

      //pregunta4
      'Sembrar en una granja, durante las vacaciones.',

      //pregunta5
      'Atender animales en un rancho durante las vacaciones.',

      //pregunta6
      'Técnico, con actividades fuera de la ciudad.',
    ],
  ];

  List<List<String>> _form2 = [
    // Formulario 1
    [
      //titleTable
      '''
Test de intereses.
Un interés es el gusto que tienes por realizar una actividad.
Campo de trabajo 1
''',

      // Preguntas
      //pregunta1
      'Atender y cuidar enfermos.',

      //pregunta2
      'Proteger a los muchachos menores del grupo.',

      //pregunta3
      'Ser miembro de una sociedad de ayuda y asistencia.',

      //pregunta4
      'Enseñar a leer a los analfabetos.',

      //pregunta5
      'Ayudar a tus compañeros en sus dificultades y preocupaciones.',

      //pregunta6
      'Funcionario al servicio de las clases humildes.',
    ],

    // Formulario 2
    [
      //titleTable
      '''
Test de intereses.
Un interés es el gusto que tienes por realizar una actividad.
Campo de trabajo 2
''',

      // Preguntas
      //pregunta1
      'Intervenir activamente en las discusiones de clase.',

      //pregunta2
      'Ser jefe de grupo.',

      //pregunta3
      'Dirigir la campaña política de un candidato estudiantil.',

      //pregunta4
      'Dirigir la campaña política de un candidato estudiantil.',

      //pregunta5
      'Leer biografías de políticos eminentes.',

      //pregunta6
      'Experto en relaciones sociales de una gran empresa.',
    ],

    // Formulario 3
    [
      //titleTable
      '''
Test de intereses.
Un interés es el gusto que tienes por realizar una actividad.
Campo de trabajo 3
''',

      // Preguntas
      //pregunta1
      'Escribir cuentos, crónicas o artículos.',

      //pregunta2
      'Leer obras literarias.',

      //pregunta3
      'Hacer versos para una publicación.',

      //pregunta4
      'Representar un papel en una obra de teatro.',

      //pregunta5
      'Participar en un concurso de oratoria.',

      //pregunta6
      'Escritor en un periódico o empresa editorial.',
    ],

    // Formulario 4
    [
      //titleTable
      '''
Test de intereses.
Un interés es el gusto que tienes por realizar una actividad.
Campo de trabajo 4
''',

      // Preguntas
      //pregunta1
      'Dibujar y pintar.',

      //pregunta2
      'Modelar con barro, plastilina o cualquier otro material.',

      //pregunta3
      'Encargarte del decorado del lugar para un festival.',

      //pregunta4
      'Idear y mostrar el escudo de un club o sociedad.',

      //pregunta5
      'Diseñar el vestuario para una función teatral.',

      //pregunta6
      'Dibujante profesional en una empresa.',
    ],

    // Formulario 5
    [
      //titleTable
      '''
Test de intereses.
Un interés es el gusto que tienes por realizar una actividad.
Campo de trabajo 5
''',

      // Preguntas
      //pregunta1
      'Cantar en un coro estudiantil.',

      //pregunta2
      'Escuchar música clásica.',

      //pregunta3
      'Aprender a escribir a máquina y en taquigrafía.',

      //pregunta4
      'Ser miembro de una asociación musical.',

      //pregunta5
      'Leer biografías de músicos eminentes.',

      //pregunta6
      'Concertista en una sinfónica.',
    ],

    // Formulario 6
    [
      //titleTable
      '''
Test de intereses.
Un interés es el gusto que tienes por realizar una actividad.
Campo de trabajo 6
''',

      // Preguntas
      //pregunta1
      'Llevar en orden tus libros y cuadernos.',

      //pregunta2
      'Ordenar y clasificar los libros de una biblioteca.',

      //pregunta3
      'Aprender a tocar un instrumento musical.',

      //pregunta4
      'Ayudar a calificar pruebas.',

      //pregunta5
      'Encargarte del archivo y los documentos de una sociedad.',

      //pregunta6
      'Técnico organizador de oficinas.',
    ],

    // Formulario 7
    [
      //titleTable
      '''
Test de intereses.
Un interés es el gusto que tienes por realizar una actividad.
Campo de trabajo 7
''',

      //preguntaEncabezado
      '¿Qué tanto te gustaría trabajar como…?',

      //respuesta0
      'Me desagrada mucho o totalmente',

      //respuesta1
      'Me desagrada algo o en parte.',

      //respuesta2
      'Me es indiferente, ni me gusta ni me disgusta.',

      //respuesta3
      'Me gusta algo o en parte.',

      //respuesta4
      'Me gusta mucho.',

      // Preguntas
      //pregunta1
      'Conocer y estudiar la estructura de las plantas y de los animales.',

      //pregunta2
      'Hacer experimentos en un laboratorio.',

      //pregunta3
      'Investigar el origen de las costumbre de los pueblos.',

      //pregunta4
      'Estudiar y entender las causas de los movimientos sociales.',

      //pregunta5
      'Leer revistas y libros científicos.',

      //pregunta6
      'Investigador en un laboratorio.',
    ],

    // Formulario 8
    [
      //titleTable
      '''
Test de intereses.
Un interés es el gusto que tienes por realizar una actividad.
Campo de trabajo 8
''',

      //preguntaEncabezado
      '¿Qué tanto te gustaría trabajar como…?',

      //respuesta0
      'Me desagrada mucho o totalmente',

      //respuesta1
      'Me desagrada algo o en parte.',

      //respuesta2
      'Me es indiferente, ni me gusta ni me disgusta.',

      //respuesta3
      'Me gusta algo o en parte.',

      //respuesta4
      'Me gusta mucho.',

      // Preguntas
      //pregunta1
      'Resolver cuestiones matemáticas.',

      //pregunta2
      'Resolver problemas de aritmética.',

      //pregunta3
      'Llevar las cuentas de una institución.',

      //pregunta4
      'Explicar a otros cómo resolver problemas de matemáticas.',

      //pregunta5
      'Participar en concursos de matemáticas.',

      //pregunta6
      'Experto calculista en una institución.',
    ],

    // Formulario 9
    [
      //titleTable
      '''
Test de intereses.
Un interés es el gusto que tienes por realizar una actividad.
Campo de trabajo 9
''',

      // Preguntas
      //pregunta1
      'Armar y desarmar objetos.',

      //pregunta2
      'Manejar herramientas y maquinaria.',

      //pregunta3
      'Construir objetos o muebles.',

      //pregunta4

      'Reparar las instalaciones eléctricas, de gas o de plomería en tu casa.',

      //pregunta5
      'Proyectar y dirigir alguna construcción.',

      //pregunta6
      'Perito mecánico en un taller.',
    ],

    // Formulario 10
    [
      //titleTable
      '''
Test de intereses.
Un interés es el gusto que tienes por realizar una actividad.
Campo de trabajo 10
''',

      // Preguntas
      //pregunta1
      'Salir de excursión.',

      //pregunta2
      'Pertenecer a un club de exploradores.',

      //pregunta3
      'Trabajar al aire libre, fuera de la ciudad.',

      //pregunta4
      'Sembrar en una granja, durante las vacaciones.',

      //pregunta5
      'Atender animales en un rancho durante las vacaciones.',

      //pregunta6
      'Técnico, con actividades fuera de la ciudad.',
    ],
  ];

  String get errorCode => _errorCode;

  set errorCode(String value) {
    _errorCode = value;
    notifyListeners();
  }

  String get errorMessage => _errorMessage;

  set errorMessage(String value) {
    _errorMessage = value;
    notifyListeners();
  }

  List<List<String>> get form1 => _form1;

  set form1(List<List<String>> value) {
    _form1 = value;
    notifyListeners();
  }

  List<List<String>> get form2 => _form2;

  set form2(List<List<String>> value) {
    _form2 = value;
    notifyListeners();
  }

  List<String> get preguntasEncabezadoForm1 => _preguntasEncabezadoForm1;

  set preguntasEncabezadoForm1(List<String> value) {
    _preguntasEncabezadoForm1 = value;
    notifyListeners();
  }

  List<List<List<int>>> get respuestas => _respuestas;

  set respuestas(List<List<List<int>>> value) {
    _respuestas = value;
    notifyListeners();
  }

  FormTestModelStatus get status => _status;

  List<int> get sumaRespuestasFormulario1 => _sumaRespuestasFormulario1;

  set sumaRespuestasFormulario1(List<int> value) {
    _sumaRespuestasFormulario1 = value;
    notifyListeners();
  }

  List<int> get sumaRespuestasFormulario2 => _sumaRespuestasFormulario2;

  set sumaRespuestasFormulario2(List<int> value) {
    _sumaRespuestasFormulario2 = value;
    notifyListeners();
  }

  void _setStatus(FormTestModelStatus status) {
    _status = status;
    notifyListeners();
  }
}

enum FormTestModelStatus {
  Ended,
  Loading,
  Error,
}
