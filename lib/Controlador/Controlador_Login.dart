
import 'package:entradas_salidas/Modelo/Usuario.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ControladorLogin {

  Future<List<Usuario>> getUsuariosFromFirebase() async {
    List<Usuario> usuarios = [];
    final querySnapshot = await _usuariosCollection.get();
    for (var doc in querySnapshot.docs) {
      usuarios.add(Usuario(
        nombre: doc['nombre'],
        contrasena: doc['contrasena'],
        matricula: doc['matricula'],
        tipoUsuario: doc['tipoUsuario'],
        esAdmin: doc['esAdmin'],
      ));
    }
    return usuarios;
  }

  final CollectionReference _usuariosCollection =FirebaseFirestore.instance.collection('Usuarios');
      
 Future<bool> login(String email, String password) async {
  QuerySnapshot querySnapshot = await _usuariosCollection
      .where('nombre', isEqualTo: email)
      .where('contrasena', isEqualTo: password)
      .get();
  return querySnapshot.docs.isNotEmpty;
}

Future<bool> isAdmin(String email) async {
  QuerySnapshot querySnapshot = await _usuariosCollection
      .where('nombre', isEqualTo: email)
      .where('esAdmin', isEqualTo: true)
      .get();
  return querySnapshot.docs.isNotEmpty;
}

Future<int> getTipoUsuario(String email) async {
  QuerySnapshot querySnapshot =
      await _usuariosCollection.where('nombre', isEqualTo: email).get();
  if (querySnapshot.docs.isNotEmpty) {
    var usuario = querySnapshot.docs.first;
    switch (usuario['tipoUsuario']) {
      case 'Almacenista':
        return 1;
      case 'Vigilante':
        return 2;
      case 'Admin':
        return 3;
    }
  }
  return 0; // No se encontró el usuario
}

}