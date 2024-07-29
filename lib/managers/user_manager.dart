import '../main.dart';
import '../models/user.dart';
import '../managers/authentication_manager.dart';

class UserManager {

  Future saveLogInUser(String email, String uid) async {
    final String encodedData = User.encode(User(
      email: email, 
      uid: uid
      ));
    await sharedPrefs?.setString('user', encodedData);
    await sharedPrefs?.setBool('isLogInUser', true);

    bool isUserLoggedIn(){
      var response = sharedPrefs?.getBool('isLogInUser') ?? false;

      return response;
    }
  }
}
