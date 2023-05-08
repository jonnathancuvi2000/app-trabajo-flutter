
import 'package:flutter/cupertino.dart';

class UsuariosComunidadProvider with ChangeNotifier{
  var _currentUsuariosComunidad = [];
  bool _currentUsuariosExist = false;

  get currentUsuriosComunidad => _currentUsuariosComunidad;
  get usuriosComunidadExist => _currentUsuariosExist;

  Future<void> setUsuriosComunidad({required usuariosComunidad}) async {
    _currentUsuariosComunidad = usuariosComunidad;
    _currentUsuariosExist = true;
  }
}