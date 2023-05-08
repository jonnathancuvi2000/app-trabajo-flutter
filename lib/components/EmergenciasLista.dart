import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practica1/providers/apicalls.dart';
import 'package:practica1/providers/emergenciasProvider.dart';
import 'package:practica1/providers/userProvider.dart';
import 'package:provider/provider.dart';

class EmergenciasLista extends StatefulWidget {
  const EmergenciasLista({super.key});

  @override
  State<EmergenciasLista> createState() => _EmergenciasListaState();
}

class _EmergenciasListaState extends State<EmergenciasLista> {
  Color _primariColor = Color(0xFF4C53A2);
  Color _accentColor = Color(0xFF0071bc);

  @override
  Widget build(BuildContext context) {
    EmergenciaProvider emergenciasProvider =
        context.watch<EmergenciaProvider>();

    UsuarioProvider usuarioProvider =
        context.watch<UsuarioProvider>();
    var emergencias_lista = emergenciasProvider.emergenciasExist
        ? emergenciasProvider.currentEmergencias
        : [
            {
              "nombre": "Policia",
              "descripcion": "Llamar Policia",
              "imagen": "https://cdn-icons-png.flaticon.com/512/26/26300.png"
            },
            {
              "nombre": "Hopspital",
              "descripcion": "Llamar Policia",
              "imagen":
                  "https://cdn-icons-png.flaticon.com/512/4320/4320333.png"
            },
            {
              "nombre": "Civil",
              "descripcion": "Llamar Policia",
              "imagen":
                  "https://cdn-icons-png.flaticon.com/512/1084/1084987.png"
            },
            {
              "nombre": "Auxilio",
              "descripcion": "Llamar Policia",
              "imagen": "https://static.thenounproject.com/png/4351628-200.png"
            },
          ];
    // print(emergencias_lista);
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        // childAspectRatio: 0.60,
      ),
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: emergencias_lista.length,
      itemBuilder: (BuildContext ctx, index) {
        return Container(
          padding: EdgeInsets.only(left: 15, right: 15, top: 10),
          // margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10), // this was before
          margin: const EdgeInsets.fromLTRB(10, 0, 10, 16),
          decoration: BoxDecoration(
            color: Colors.white,
            // borderRadius: BorderRadius.circular(20),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                blurRadius: 4,
                color: Colors.grey.shade400,
              ),
            ],
          ),
          child: InkWell(
            onTap: () {

              



              print("Alerta enviada Pronto recivira acistencia");
              ApiCalls().setReportarEmergencia(context, emergencias_lista[index]['emergencia_id'], usuarioProvider.currentUser["usuario"]["usuario_id"]);
              ApiCalls().getEmergenciaReportada(context);
              print(emergencias_lista[index]['emergencia_id']);
              print(usuarioProvider.currentUser["usuario"]["usuario_id"]);
              showAlertDialog(context);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  child: Image.network(
                    "https://cdn-icons-png.flaticon.com/512/1084/1084987.png",
                    // "${emergencias_lista[index]['imagen']}",
                    height: 40,
                    width: 40,
                  ),
                ),
                Container(
                  height: 30,
                  padding: EdgeInsets.only(bottom: 8),
                  // alignment: Alignment.centerLeft,
                  child: SingleChildScrollView(
                    child: Text(
                      "${emergencias_lista[index]['nombre']}",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: _accentColor, //0xFF4C53A2
                      ),
                    ),
                  ),
                ),
                Container(
                  // alignment: Alignment.centerLeft,
                  height: 50,
                  child: SingleChildScrollView(
                    child: Text(
                      "${emergencias_lista[index]['descripcion']}",
                      style: TextStyle(
                        fontSize: 15,
                        color: _accentColor, //0xFF4C53A2
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

void showAlertDialog(BuildContext context) {
  // Create button
  // Widget okButton = FlatButton(
  //   child: Text("OK"),
  //   onPressed: () {
  //     Navigator.of(context).pop();
  //   },
  // );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Se ha notificado su emergencia"),
    content: Text("Porfavor espere, pronto recibirá asistencia"),
    // actions: [
    //   okButton,
    // ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
