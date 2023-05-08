import 'package:flutter/material.dart';
import 'package:practica1/pages/Chat.dart';
import 'package:practica1/pages/ComunidadInfo.dart';
import 'package:practica1/pages/Dispositivos.dart';
import 'package:practica1/pages/Emergencia.dart';
import 'package:practica1/pages/Emergencias%20copy.dart';
import 'package:practica1/pages/Error_404.dart';
import 'package:practica1/pages/GestionUsuarios.dart';
import 'package:practica1/pages/HomePage.dart';
import 'package:practica1/pages/Login.dart';
import 'package:practica1/pages/PerfilUsuario.dart';
import 'package:practica1/pages/RegistrarUsuario.dart';
import 'package:practica1/pages/SplashPage.dart';
import 'package:practica1/providers/EmergenciaReportadaProvider.dart';
import 'package:practica1/providers/comundadProvider.dart';
import 'package:practica1/providers/emergenciasProvider.dart';
import 'package:practica1/providers/userProvider.dart';
import 'package:practica1/providers/usuariosComunidadProvider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UsuarioProvider>(
            create: (_) => UsuarioProvider()),
        ChangeNotifierProvider<ComunidadProvider>(
            create: (_) => ComunidadProvider()),
        ChangeNotifierProvider<EmergenciaProvider>(
            create: (_) => EmergenciaProvider()),
        ChangeNotifierProvider<UsuariosComunidadProvider>(
            create: (_) => UsuariosComunidadProvider()),
        ChangeNotifierProvider<EmergenciaReportadaProvider>(
            create: (_) => EmergenciaReportadaProvider()),
      ],
      builder: (context, _) {
        UsuarioProvider userProvider = context.watch<UsuarioProvider>();
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          // home: HomePage(),
          initialRoute: "/",
          routes: {
            '/': ((context) =>
                userProvider.isLogin ? const HomePage() : const Login()),
            '/perfilUsuario': ((context) => const PerfilUsuario()),
            '/registrarUsuario': ((context) => const RegistrarUsuario()),
            '/home': ((context) => const HomePage()),
            '/splashPage': ((context) => const SplashPage()),
            '/emergencia': ((context) => const Emergencia()),
            '/comunidadInfo': ((context) => const ComunidadInfo()),
            // '/emergencias': ((context) => const Emergencias()),
            // '/dispositivos': ((context) => const Dispositivos()),
            // '/gestionUsuarios': ((context) => const GestionUsuarios()),
            // '/chat': ((context) => const Chat()),
            // link tutorial -> https://www.youtube.com/watch?v=mN5Co64gsT0
          },
          onGenerateRoute: (settings) {
            return MaterialPageRoute(
              builder: (context) => const Error_404(),
            );
          },
        );
      },
    );
  }
}
