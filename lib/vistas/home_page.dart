import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../comandos/refresh_posts_command.dart';
import '../modelos/app_model.dart';
import '../modelos/user_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isLoading = false;

  void _handleRefreshPressed() async {
    //Deshabilitar el boton refresh mientras el comando se ejecuta    
    setState(() => _isLoading = true);
    //Ejecutar comando
    await RefreshPostsCommand().run(context.read<AppModel>().currentUser);
    //Vuelve a hablilitar boton refresh cuando el comando terminó
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    // Vincula a UserModel.userPosts
    var users = context.select<UserModel, List<String>>((value) => value.userPosts);
    // Deshabilita btn eliminando el oyente cuando estamos cargando datos
    VoidCallback btnHandler = _isLoading ? null : _handleRefreshPressed;
    // Carga lista de widgets
    var listWidgets = users.map((post) => Text(post)).toList();
    return Scaffold(
      body: Column(
        children: [
          Flexible(child: ListView(children: listWidgets)),
          FlatButton(child: Text("Recargar"), onPressed: btnHandler),
        ],
      ),
    );
  }
}