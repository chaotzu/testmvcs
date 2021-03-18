import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testmvc/modelos/app_model.dart';
import 'package:testmvc/modelos/user_model.dart';
import 'package:testmvc/servicios/user_service.dart';


BuildContext _mainContext;
// Los comandos utilizarán esto para acceder a los modelos y servicios proporcionados
void init(BuildContext c) => _mainContext = c;

// Proporciona métodos de busqueda rápida para todos los modelos y servicios de nivel superior. Mantiene el código de los comandos más limpio
class BaseCommand {
  // Modelos  
  UserModel userModel = _mainContext.read();
  AppModel appModel = _mainContext.read();
  // Servicios
  UserService userService = _mainContext.read();
}



