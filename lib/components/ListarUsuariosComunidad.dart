import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../comun/Temas.dart';

class ListarUsuariosComunidad extends StatefulWidget {
  const ListarUsuariosComunidad({super.key});

  @override
  State<ListarUsuariosComunidad> createState() =>
      _ListarUsuariosComunidadState();
}

class _ListarUsuariosComunidadState extends State<ListarUsuariosComunidad> {
  Color _primariColor = Color(0xFF4C53A2);
  Color _accentColor = Color(0xFF0071bc);
  final entries = [
    {
      "nombre": "Ana",
      "description": "Emergencia Publica",
      "direccion": "Quinta Chica",
    },
    {
      "nombre": "Lorena",
      "description": "Emergencia Medica",
      "direccion": "Quinta Chica",
    },
    {
      "nombre": "Joaquin",
      "description": "Emergencia Medica",
      "direccion": "Quinta Chica",
    },
    {
      "nombre": "Marta",
      "description": "Emergencia Medica",
      "direccion": "Quinta Chica",
    },
    {
      "nombre": "Marta",
      "description": "Emergencia Medica",
      "direccion": "Quinta Chica",
    },
    {
      "nombre": "Marta",
      "description": "Emergencia Medica",
      "direccion": "Quinta Chica",
    },
    {
      "nombre": "Marta",
      "description": "Emergencia Medica",
      "direccion": "Quinta Chica",
    },
    {
      "nombre": "Marta",
      "description": "Emergencia Medica",
      "direccion": "Quinta Chica",
    },
    {
      "nombre": "Marta",
      "description": "Emergencia Medica",
      "direccion": "Quinta Chica",
    },
    {
      "nombre": "Marta",
      "description": "Emergencia Medica",
      "direccion": "Quinta Chica",
    },
    {
      "nombre": "Marta",
      "description": "Emergencia Medica",
      "direccion": "Quinta Chica",
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.fromLTRB(10,20,10,10),
          child: Text(
            "Usuarios Registrados Comunidad",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: _primariColor, //0xFF4C53A2
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: entries.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 4,
                      color: Colors.grey.shade400,
                    ),
                  ],
                ),
                child: Container(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Icon(Icons.person),
                            SizedBox(
                              width: 5,
                            ),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                      text: "Nombre: ",
                                      style: TemasAyuda.textStyle3),
                                  TextSpan(
                                      text: '${entries[index]["nombre"]}',
                                      style: TemasAyuda.textStyle3),
                                ],
                              ),
                            ),
                            // Text('Nombre: ${entries[index]["nombre"]}')
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          print("Eliminar usuario");
                        },
                        child: Icon(
                          Icons.delete,
                          color: Colors.redAccent,
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
            // separatorBuilder: (BuildContext context, int index) => const Divider(),
          ),
        ),
      ],
    );
  }
}
