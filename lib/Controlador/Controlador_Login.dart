
import 'package:entradas_salidas/Modelo/Usuario.dart';
import 'package:hive/hive.dart';

class ControladorLogin {
  List<Usuario> usuarios = [];

  List<Usuario> getUsuariosFromHive() {
    List<Usuario> usuarios = [];
    var hiveUsuarios = Hive.box('Usuarios');
    for (var i = 0; i < hiveUsuarios.length; i++) {
      var usuarioData = hiveUsuarios.getAt(i);
      usuarios.add(Usuario(
        nombre: usuarioData['nombre'],
        contrasena: usuarioData['contrasena'],
        matricula: usuarioData['matricula'],
        tipoUsuario: usuarioData['tipoUsuario'],
        esAdmin: usuarioData['esAdmin'],
      ));
    }
    return usuarios;
  }

  bool login(String email, String password) {
    usuarios = getUsuariosFromHive();
    for (var usuario in usuarios) {
      if (usuario.nombre == email && usuario.contrasena == password) {
        return true;
      }
    }
    return false;
  }

  bool isAdmin(String email) {
    for (var usuario in usuarios) {
      if (usuario.nombre == email && usuario.esAdmin) {
        return true;
      }
    }
    return false;
  }

  int getTipoUsuario(String email) {
    for (var usuario in usuarios) {
      if (usuario.nombre == email) {
        if (usuario.tipoUsuario == 'Almacenista') {
          return 1;
        } else if (usuario.tipoUsuario == 'Vigilante') {
          return 2;
        }
      }
    }
    return 0; // No se encontró el usuario
  }
}

