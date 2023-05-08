import 'dart:convert';
import 'dart:js';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import 'package:practica1/providers/EmergenciaReportadaProvider.dart';
import 'package:practica1/providers/apiHeader.dart';
import 'package:practica1/providers/comundadProvider.dart';
import 'package:practica1/providers/emergenciasProvider.dart';
import 'package:practica1/providers/userProvider.dart';
import 'package:practica1/providers/usuariosComunidadProvider.dart';
import 'package:provider/provider.dart';

class ApiCalls {

  void imprimir() {
    print("Hola MUnod 0000000000");
  }
  String api = ApiHeader().api;
  Future<void> getUsuarisoComunidad(BuildContext context) async {
    // int comunidadId = context.watch<ComunidadProvider>().comunidadId;
// ComunidadProvider comunidadProvider = context.watch<ComunidadProvider>();
    try {
      print("Counidad id ");
      // print(comunidadProvider.comunidadId);
// make request
      // final response =
      //     await get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      final response = await get(Uri.parse('$api/usuarios/comunidadusers/1'));
      // sample info available in response
      final statusCode = response.statusCode;
      final headers = response.headers;
      final contentType = headers['content-type'];
      final json = response.body;
      var jsonResponse = jsonDecode(response.body);
      // print("HOASOKAODKAO  00000000000000");
      print(jsonResponse);
      // context
      //     .read<UsuariosComunidadProvider>()
      //     .setUsuriosComunidad(usuariosComunidad: jsonResponse);
    } catch (e) {}
  }

  Future<void> login(
      BuildContext context, String _correo, String _contrasena) async {
    context.read<UsuarioProvider>().loginStart();
    try {
      final url = Uri.parse('$api/user/login');
      final headers = {"Content-type": "application/json"};
      final json = '{ "correo_1": "$_correo", "contrasena": "$_contrasena" }';
      final response = await post(url, headers: headers, body: json);
      var jsonResponse = jsonDecode(response.body);

      if (jsonResponse['isLogin']) {
        context.read<UsuarioProvider>().loginSuccesfull(user: jsonResponse);
        // guardamos las comunidades y las emergencias de esa comunidad
        // TENIA UN ERROR POR QUE LAS EMERGENCIAS ES UNA LISTA Y EN EL emergenciasProvider YO TENIA COMO OBJETO
        context
            .read<ComunidadProvider>()
            .setComunidad(comunidad: jsonResponse["usuario"]["comunidad"]);
        context.read<EmergenciaProvider>().setEmergencias(
            emergencias: jsonResponse["usuario"]["comunidad"]["emergencias"]);
        // obtenemos los usuarios de la comunidad
        getUsuarisoComunidad(context);
      } else {
        context.read<UsuarioProvider>().loginFail();
      }

      // final statusCode = response.statusCode;
      // final body = response.body;
    } catch (e) {
      context.read<UsuarioProvider>().loginFail();
    }
  }

  Future<void> setReportarEmergencia(
      BuildContext context, int emegecia_Id, int usuario_Id) async {

    try {
      final url = Uri.parse('$api/emergencias/reportadas');
      final headers = {"Content-type": "application/json"};
      final json = '{ "codigo": "34567", "estadoEmergencia": true, "emergencia": { "emergencia_id": $emegecia_Id },"usuario": { "usuario_id": $usuario_Id}}';
      final response = await post(url, headers: headers, body: json);
      var jsonResponse = jsonDecode(response.body);

      print(jsonResponse);

    } catch (e) {
      context.read<UsuarioProvider>().loginFail();
    }
  }

  Future<void> getEmergenciaReportada(
      BuildContext context) async {

    try {
      final response = await get(Uri.parse('$api/emergencias/reportadas/ultimoelemento'));
      // sample info available in response
      final statusCode = response.statusCode;
      final headers = response.headers;
      final contentType = headers['content-type'];
      final json = response.body;
      var jsonResponse = jsonDecode(response.body);
      context.read<EmergenciaReportadaProvider>().setEmergenciaReportada(newEmergency: jsonResponse);
      // print("HOASOKAODKAO  00000000000000");
      print(jsonResponse);

    } catch (e) {
      context.read<UsuarioProvider>().loginFail();
    }
  }
}

// Future<Object> _makePostLogin(String _correo, String _contrasena) async {
//   try {
//     final url = Uri.parse('$api/user/login');
//     final headers = {"Content-type": "application/json"};
//     // final json = '{"title": "Hello", "body": "body text", "userId": 1}';
//     final json = '{ "correo_1": "$_correo", "contrasena": "$_contrasena" }';

//     // make POST request
//     final response = await post(url, headers: headers, body: json);

//     // check the status code for the result
//     final statusCode = response.statusCode;

//     // this API passes back the id of the new item added to the body
//     final body = response.body;
//     var jsonResponse = jsonDecode(response.body);

//     // print(jsonResponse['isLogin']);

//     // print(statusCode.toInt());
//     // print(body);
//     if (jsonResponse['isLogin']) {
//       return jsonResponse;
//     } else {
//       return false;
//     }
//   } catch (e) {
//     return false;
//   }
// }
