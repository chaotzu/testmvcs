import 'base_command.dart';

class RefreshPostsCommand extends BaseCommand {

  Future<List<String>> run(String user) async {
    // Realiza una llamada a un servicio e inyecta la respuesta a un modelo
    List<String> posts = await userService.getPosts(user);
    userModel.userPosts = posts;

    // Regresa los post a quien llamó en caso de que los necesite.
    return posts;
  }
  
}