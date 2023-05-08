import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class RegistrarUsuariosComunidad extends StatefulWidget {
  const RegistrarUsuariosComunidad({super.key});

  @override
  State<RegistrarUsuariosComunidad> createState() =>
      _RegistrarUsuariosComunidadState();
}

class _RegistrarUsuariosComunidadState
    extends State<RegistrarUsuariosComunidad> {
  Color _primariColor = Color(0xFF4C53A2);
  Color _accentColor = Color(0xFF0071bc);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.fromLTRB(10, 20, 10, 10),
          child: Text(
            "Registrar nuevo usuario",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: _primariColor, //0xFF4C53A2
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              QrImage(
                data: "1234567890",
                version: QrVersions.auto,
                size: 200.0,
              ),
              // Container(
              //   child: FittedBox(child: Icon(Icons.qr_code), fit: BoxFit.fill),
              //   width: MediaQuery.of(context).size.width / 2,
              //   height: MediaQuery.of(context).size.height / 4,
              //   decoration: BoxDecoration(
              //     color: Colors.white,
              //     borderRadius: BorderRadius.circular(20),
              //     boxShadow: [
              //       BoxShadow(
              //         blurRadius: 4,
              //         color: Colors.grey.shade400,
              //       ),
              //     ],
              //   ),
              // ),
              Text(
                "484468548",
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
