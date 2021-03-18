import 'base_command.dart';
import 'refresh_posts_command.dart';

class LoginCommand extends BaseCommand {

  Future<bool> run(String user, String pass) async {
    // Espera alguna llamada de servicio
    bool loginSuccess = await userService.login(user, pass);
    
    //Ejecuta un segundo comando si el servicio fue llamado de forma exitosa
    if (loginSuccess) {
      await RefreshPostsCommand().run(user);
    }
    //Actualiza appModel con el usuario actual. Cualquier vista vinculada a esto se reconstruirá
    appModel.currentUser = loginSuccess? user : null;

    // Devuelve el resultado a quien llamó al comando en caso de que este resultado sea de utilidad.
    return loginSuccess;
  }
  
}