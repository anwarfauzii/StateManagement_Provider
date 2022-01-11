import 'package:latihan_state_management/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  getUser() async {
    final user = UserModel(
        name: 'Anwar Fauzi',
        username: 'anwarF',
        password: 'qwertyu12345',
        email: 'anwarfauzi2608@gmail.com',
        token: 'Bearer 589185918959');
    await saveToken(user.token!);
    return user;
  }

  saveToken(String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('token', token);
  }

  getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final result = sharedPreferences.getString('token');
    return result;
  }

  removeToken() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove('token');
  }
}
