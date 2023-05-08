import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practica1/components/Alarmas.dart';

import '../components/Camaras.dart';
import '../components/Top_navGestionUsuarios.dart';
import '../comun/Temas.dart';

import 'package:qrscan/qrscan.dart' as scanner;

class UsuarioVecino extends StatefulWidget {
  const UsuarioVecino({super.key});

  @override
  State<UsuarioVecino> createState() => _UsuarioVecinoState();
}

class _UsuarioVecinoState extends State<UsuarioVecino> {
  Color _primariColor = Color(0xFF4C53A2);
  Color _accentColor = Color(0xFF0071bc);
  TextEditingController _codeQR = TextEditingController();

  void scanQR() async {
    String cameraScanResult = await scanner.scan().toString();
    setState(() {
      _codeQR.text = cameraScanResult;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          // nav bar
          Top_navGestionUsuarios(),
          //title
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.fromLTRB(10, 20, 10, 10),
            child: Text(
              "Unirme Comunidad",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: _primariColor, //0xFF4C53A2
              ),
            ),
          ),
          // info
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    child: Text("Scanear codigo QR", style: TemasAyuda.textStyle2,),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  // escaner codigo QR
                  GestureDetector(
                    // onTap: () => scanQR(),
                    onTap: () {
                      print("escaneando codigo QR");
                    },
                    child: Container(
                      height: 150,
                      width: 150,
                      margin: EdgeInsets.only(
                          left: 15, right: 15, top: 10, bottom: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4,
                            color: Colors.grey.shade400,
                          ),
                        ],
                      ),
                      child: SizedBox.expand(
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Icon(Icons.camera),
                        ),
                      ),
                      // child: Icon(Icons.camera),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    child: Text("O", style: TemasAyuda.textStyle2),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextField(
                    decoration: TemasAyuda().textInputDecoracion(
                        "Codigo", "Ingrese el codigo de la comunidad"),
                    controller: _codeQR,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // button, when I use "Flexible" the button takes the whole withe
                  Container(
                    decoration: TemasAyuda().buttonBoxDecoration(context),
                    child: ElevatedButton(
                      style: TemasAyuda().buttonStyle(),
                      onPressed: () {
                        print("registro exito");
                      },
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Aceptar",
                          style: TextStyle(
                            fontSize: 16,
                            // fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
