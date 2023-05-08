import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:practica1/comun/temas.dart';
import 'package:practica1/providers/apicalls.dart';
import 'package:provider/provider.dart';

import '../components/HeaderWidget.dart';
import '../providers/userProvider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  double _headerHeight = 250;
  Key _formKey = GlobalKey<FormState>();
  Color _primariColor = Color(0xFF4C53A2);
  Color _accentColor = Color(0xFF0071bc);
  TextEditingController _correoController = TextEditingController();
  TextEditingController _contrasenaController = TextEditingController();

  // Future<Object> _makePostLogin() async {
  //   String _correo = _correoController.text;
  //   String _contrasena = _contrasenaController.text;

  //   try {
  //     final url = Uri.parse('http://localhost:8080/user/login');
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

  @override
  Widget build(BuildContext context) {
    UsuarioProvider userProvider = context.watch<UsuarioProvider>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // header
            Container(
              height: _headerHeight,
              child: HeaderWidget(_headerHeight, true, Icons.login_rounded),
            ),
            // login form
            SafeArea(
              child: Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                child: Column(
                  children: [
                    Text(
                      // "Inicio de Seccion",
                      userProvider.isLogin
                          ? userProvider.currentUser["usuario"]["correo_1"]
                              .toString()
                          : "Inicio",
                      // "Inicio Seccion",
                      style: TextStyle(
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: _primariColor),
                    ),
                    Text(
                      "Ingrese en su cuenta",
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Form(
                        child: Column(
                      children: [
                        TextField(
                          decoration: TemasAyuda().textInputDecoracion(
                              "Correo", "Ingrese su correo"),
                          controller: _correoController,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextField(
                          obscureText: true,
                          decoration: TemasAyuda().textInputDecoracion(
                            "Contrasena",
                            "Ingrese su contrasena",
                          ),
                          controller: _contrasenaController,
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 0, 10, 20),
                          alignment: Alignment.topRight,
                          child: Text('Olvido su contrasena?'),
                        ),
                        Container(
                          decoration: TemasAyuda().buttonBoxDecoration(context),
                          child: ElevatedButton(
                            style: TemasAyuda().buttonStyle(),
                            onPressed: () {
                              // _makePostLogin().then((value) {
                              //   // print("---------------");
                              //   // print(value);
                              //   if (value != false) {
                              //     Navigator.pushNamed(context, '/home',
                              //         arguments: value);
                              //     // showAlertDialog(context, "Usuario Logeado",
                              //     //     "Usuario logeado correctamente");
                              //   } else {
                              //     showAlertDialog(
                              //         context,
                              //         "Error. Algo salio mal",
                              //         "Su correo o contrasena no coinciden");
                              //   }
                              // }).catchError(
                              //   (e) {
                              //     showAlertDialog(
                              //         context,
                              //         "Error. Algo salio mal",
                              //         "Su correo o contrasena no coinciden");
                              //   },
                              // );
                              // enviamos el contexto y el usuario PERO solo hay que enviar el contexto
                              // print("****************");
                              // enviamos el contexto y el correo y la contrasena
                              ApiCalls().login(context, _correoController.text,
                                  _contrasenaController.text);
                              // print("___________________________");
                              // print(userProvider.currentUser);
                              // context.read<UsuarioProvider>().loginSuccesfull(user: "Jonnathan", token: "Carmen");
                              // Navigator.pushNamed(context, '/home');
                            },
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                              child: Text(
                                "Ingresar".toUpperCase(),
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(text: "Si no tiene un cuenta? "),
                                TextSpan(
                                    text: "Regsitrese",
                                    style: TextStyle(
                                      color: _accentColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.pushNamed(
                                            context, '/registrarUsuario');
                                      })
                              ],
                            ),
                          ),
                        ),
                      ],
                    ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

void showAlertDialog(BuildContext context, String title, String content) {
  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("$title"),
    content: Text("$content"),
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
