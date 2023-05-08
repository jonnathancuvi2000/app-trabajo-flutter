import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practica1/components/Top_navChat.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        Top_navChat(),
        Flexible(
          flex: 1,
          child: Container(
            // color: Colors.blueAccent,
          ),
        ),
      ],
    ));
  }
}
