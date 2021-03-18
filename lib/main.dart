import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'comandos/base_command.dart' as Commands;
import 'modelos/app_model.dart';
import 'modelos/user_model.dart';
import 'servicios/user_service.dart';
import 'vistas/home_page.dart';
import 'vistas/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext _) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (c) => AppModel()),
        ChangeNotifierProvider(create: (c) => UserModel()),
        Provider(create: (c) => UserService()),
      ],
      child: Builder(builder: (context) {
        // Guardamos un contexto que nuestros comandos puedan utilizar para acceder a los modelos y servicios proporcionados
        Commands.init(context);
        return MaterialApp(home: AppScaffold());
      }),
    );
  }
}

class AppScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Vincula a AppModel.currentUser
    String currentUser = context.select<AppModel, String>((value) => value.currentUser);
    
    // Regresa la vista actual, basandose en el valor de currentUser:    
    return Scaffold(
      body: currentUser != null ? HomePage() : LoginPage(),
    );
  }
}