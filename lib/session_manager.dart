import 'package:shared_preferences/shared_preferences.dart';

// - Key for Shared Preferences
class SessionManagerKey {
  static const String TOKEN = 'TOKEN';
  static const String IS_FIRST_OPEN_APP = 'IS_FIRST_OPEN_APP';
  static const String USER_PROFILE = 'USER_PROFILE';
  static const String REGIONS = 'REGIONS';
  static const String ADDRESS = 'ADDRESS';
  static const String FIREBASE_TOKEN = 'FIREBASE_TOKEN';
  static const String MY_LOCATION = 'MY_LOCATION';
  static const String IS_RECEIVE_NOTIFICATION = 'IS_RECEIVE_NOTIFICATION';
  static const String KEY_COUNTRY = 'KEY_COUNTRY';
}

class SessionManager{
  SessionManager._privateConstructor();
  static final SessionManager share = SessionManager._privateConstructor();


  /// First open app
  Future<bool> isFirstOpenApp() async{
    return getIsFirstOpenApp();
  }

  Future<bool> setIsFirstOpenApp() async{
    final myPrefs = await SharedPreferences.getInstance();
    return myPrefs.setBool(SessionManagerKey.IS_FIRST_OPEN_APP, false);
  }

  Future<bool> getIsFirstOpenApp() async{
    final myPrefs = await SharedPreferences.getInstance();
    return myPrefs.getBool(SessionManagerKey.IS_FIRST_OPEN_APP) ?? true;
  }

  Future<bool> removeIsFirstOpenApp() async{
    final myPrefs = await SharedPreferences.getInstance();
    return myPrefs.remove(SessionManagerKey.IS_FIRST_OPEN_APP);
  }

  /// User's information
  Future<bool> saveUserInfo() async{
    final myPrefs = await SharedPreferences.getInstance();
    return myPrefs.setString(SessionManagerKey.USER_PROFILE, 'UserInfo');
  }

}