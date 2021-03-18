
import 'package:flutter/foundation.dart';

class AppModel extends ChangeNotifier {

  String _currentUser;
  String get currentUser => _currentUser;
  set currentUser(String currentUser) {
    _currentUser = currentUser;
    notifyListeners();
  }
  // Aquí pueden agregarse cosas como: Preferencias de la aplicación, características especiales de usuarios, tema actual, etc.
}
