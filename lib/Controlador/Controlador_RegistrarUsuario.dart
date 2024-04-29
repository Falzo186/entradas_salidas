import 'package:entradas_salidas/Modelo/Usuario.dart';
import 'package:hive/hive.dart';

class Controlaodr_RegistrarUsuario  {
  var Usuarios = Hive.box('Usuarios');  

  bool registrarUsuario(Usuario usuario) {
  for (var i = 0; i < Usuarios.length; i++) {
    if (Usuarios.getAt(i)['nombre'] == usuario.nombre) {
      return false;
    }
  }
  Usuarios.add(usuario.toMap());
  return true;
}
void agregarUsuarioAdmin() {
  bool existeAdmin = false;
  for (var i = 0; i < Usuarios.length; i++) {
    if (Usuarios.getAt(i)['nombre'] == 'admin' && Usuarios.getAt(i)['tipoUsuario'] == 'admin') {
      existeAdmin = true;
      break;
    }
  }
  if (!existeAdmin) {
    Usuarios.add({
      'nombre': 'admin',
      'contrasena': 'admin123',
      'matricula': 'admin',
      'tipoUsuario': 'admin',
      'esAdmin': true,
    });
  }
print("Usuario admin agregado");
}


}