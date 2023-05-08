import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/userProvider.dart';

class SideNavBar extends StatefulWidget {
  const SideNavBar({super.key});

  @override
  State<SideNavBar> createState() => _SideNavBarState();
}

class _SideNavBarState extends State<SideNavBar> {
  Color _primariColor = Color(0xFF4C53A2);
  Color _accentColor = Color(0xFF0071bc);

  double _drawericonSize = 24;
  @override
  Widget build(BuildContext context) {
    UsuarioProvider userProvider = context.watch<UsuarioProvider>();
    Color _primariColor = Color(0xFF4C53A2);
    Color _accentColor = Color(0xFF0071bc);
    return Drawer(
      width: MediaQuery.of(context).size.width / 1.3,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.0, 1.0],
            colors: [
              _primariColor.withOpacity(0.2),
              _accentColor.withOpacity(0.4)
            ],
          ),
        ),
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: _primariColor,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.0, 1.0],
                  colors: [_primariColor, _accentColor],
                ),
              ),
              child: Container(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Seguridad",
                  style: TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.person,
                size: _drawericonSize,
                color: _accentColor,
              ),
              title: Text(
                "Perfil",
                style: TextStyle(
                  fontSize: 17,
                  color: _accentColor,
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/perfilUsuario');
              },
            ),
            ListTile(
              leading: Icon(
                Icons.group,
                size: _drawericonSize,
                color: _accentColor,
              ),
              title: Text(
                "Comunidad",
                style: TextStyle(
                  fontSize: 17,
                  color: _accentColor,
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/comunidadInfo');
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(
                Icons.exit_to_app,
                size: _drawericonSize,
                color: _accentColor,
              ),
              title: Text(
                "Cerrar Sesion",
                style: TextStyle(
                  fontSize: 17,
                  color: _accentColor,
                ),
              ),
              onTap: () {
                userProvider.loginFail();
                // Navigator.pushNamed(context, '/');
              },
            ),
          ],
        ),
      ),
    );
  }
}
