import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_vocacional_1/src/models/user/user_model.dart';

/// [AuthService] - Clase que maneja la autenticación del usuario.
/// Utiliza FirebaseAuth para interactuar con Firebase Authentication.
class AuthService with ChangeNotifier {
  ///NOTE: Evaluamos el estado del usuario mediante esta clase. Ademas que aqui declaramos todo lo que ocuparemos en las otras clases

  /// FIREBASEUSER [firebaseUser] - Mediante una instancia a la clase User,
  User? firebaseUser = FirebaseAuth.instance.currentUser;

  /// IMAGEPATH [imagePath] - Devuelve la ruta de la imagen del usuario
  final Reference _imageRef = FirebaseStorage.instance.ref();

  /// AUTH [_auth] ```FirebaseAuth``` - Devuelve la instancia de la autenticacion de usuario.
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// USER [_user] - Devuelve la instancia con la clase Users
  late final UserModel _user = UserModel();

  /// DB [_db] - Devuelve la instancia al firestore.
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// STATUS [_status] - Devuelve el estado en el que esta el usuario.
  late AuthStatus _status = AuthStatus.Uninitialized;

  /// Constructor privado
  AuthService._private();

  // Definición de instancia privada
  static final AuthService _instancia = AuthService._private();

  // Definición de factor de creacion de instancia
  factory AuthService() {
    _instancia._auth.authStateChanges().listen(_instancia._onAuthStateChanged);
    return _instancia;
  }

  /// Constructor de [AuthService] que inicia la escucha de los cambios de estado
  ///  de autenticación.

  /// Getters para obtener el estado de autenticación y los datos del usuario.
  /// AUTH [auth] - Devuelve la instancia de la autenticacion de usuario.
  FirebaseAuth get auth => _auth;

  /// DB [db] - Devuelve la instancia al firestore.
  FirebaseFirestore get db => _db;

  /// IMAGEPATH [imagePath] - Devuelve la ruta de la imagen del usuario
  Reference get imageRef => _imageRef;

  /// STATUS [status] - Devuelve el estado en el que esta el usuario.
  AuthStatus get status => _status;

  /// USER [user] - Devuelve la instancia con la clase Users
  UserModel get user => _user;

  /// [signInWithEmailAndPassword] - Método para iniciar sesión con correo electrónico y contraseña.
  /// Actualiza el estado de autenticación y notifica a los oyentes sobre el cambio de estado.
  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    _status = AuthStatus.Authenticating;
    notifyListeners();
    try {
      UserCredential authResult = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      User user = authResult.user!;
      notifyListeners();
      return user;
    } catch (e) {
      _status = AuthStatus.Unauthenticated;
      notifyListeners();
      return null;
    }
  }

  Future<bool> checkUserExistAndRedirect(User user) async {
    DocumentSnapshot userDoc = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();

    if (userDoc.exists && userDoc['TypeUsers'] == 'TestUser') {
      // El documento del usuario existe, inicia sesión normalmente
      return true;
    } else {
      return false;
    }
  }

// Después de que el usuario inicie sesión o se registre correctamente
  Future<bool> checkUserDataAndRedirect(User user) async {
    DocumentSnapshot userDoc = await FirebaseFirestore.instance
        .collection('TestUser')
        .doc(user.uid)
        .get();

    if (userDoc.exists) {
      // El documento del usuario existe, inicia sesión normalmente
      // (puedes implementar tu lógica aquí)
      debugPrint('Documento del usuario encontrado en Firestore');
      return true;
    } else {
      debugPrint('Documento del usuario no encontrado en Firestore');
      return false;
    }
  }

  /// [signOut] - Método para cerrar la sesión del usuario.
  /// Actualiza el estado de autenticación y notifica a los oyentes sobre el cambio de estado.
  Future<void> signOut() async {
    await _auth.signOut();
    _status = AuthStatus.Unauthenticated;
    notifyListeners();
  }

  /// [signUpWithEmailAndPassword] - Método para registrarse con correo electrónico y contraseña.
  /// Actualiza el estado de autenticación y notifica a los oyentes sobre el cambio de estado.
  Future<User?> signUpWithEmailAndPassword(
      String email, String password) async {
    _status = AuthStatus.Authenticating;
    notifyListeners();
    try {
      UserCredential authResult = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      signInWithEmailAndPassword(email, password);
      User user = authResult.user!;

      notifyListeners();
      return user;
    } catch (e) {
      _status = AuthStatus.Unauthenticated;
      notifyListeners();
      return null;
    }
  }

  /// [recoverPassword] - Método para recuperar la contraseña del usuario.
  /// Envía un correo electrónico de restablecimiento de contraseña al correo electrónico proporcionado.
  Future<void> recoverPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      // Manejar cualquier error que pueda ocurrir al enviar el correo electrónico
      debugPrint(
          'Error al enviar correo electrónico de recuperación de contraseña: $e');
      throw e;
    }
  }

  Future<void> deleteUser() async {
    try {
      // Obtiene la referencia al usuario actualmente autenticado
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        // Elimina al usuario
        await user.delete();
      } else {
        throw FirebaseAuthException(
          code: 'user-not-found',
          message: 'No se encontró un usuario autenticado.',
        );
      }
    } catch (e) {
      // Maneja cualquier error que pueda ocurrir
      rethrow;
    }
  }

  /// [updateUserData] - Método para actualizar los datos del usuario en Firestore.
  /// Se utiliza después de un inicio de sesión exitoso para almacenar información relevante del usuario.
  Future<DocumentSnapshot> updateUserData(User user) async {
    DocumentReference userRef = _db.collection('TestUser').doc(user.uid);
    userRef.set({
      'lastSign': DateTime.now(),
      //'photoURL': user.photoURL,
    }, SetOptions(merge: true));
    DocumentSnapshot userData = await userRef.get();
    return userData;
  }

  /// [_onAuthStateChanged] - Método que se llama cada vez que el estado de autenticación cambia.
  /// Actualiza el estado interno de [AuthService] y notifica a los oyentes sobre el cambio.
  Future<void> _onAuthStateChanged(User? user) async {
    if (user == null) {
      _status = AuthStatus.Unauthenticated;
    } else {
      DocumentSnapshot userSnap =
          await _db.collection('Maestros').doc(user.uid).get();
      _user.setter(userSnap);
      _status = AuthStatus.Authenticated;
    }
    notifyListeners();
  }
}

/// [AuthStatus] - Se almacenará los estados del usuario.
///
/// [Uninitialized] - Es el estado del usuario cuando no está inicializado.
/// Cuando abres la aplicación y no sabemos si está autenticado.
///
/// [Authenticated] - Es cuando el usuario ya está autenticado o inició sesión.
///
/// [Authenticating] - Es cuando se está en el proceso de autenticación entre
/// la aplicación y Firebase.
///
/// [Unauthenticated] - Cuando no ha iniciado sesión. Importante para saber decidir si el usuario
/// podrá pasar de una pantalla a otra.
enum AuthStatus {
  Uninitialized,
  Authenticated,
  Authenticating,
  Unauthenticated
}
