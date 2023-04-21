import 'package:shared_preferences/shared_preferences.dart';

import 'constants.dart';

class UserCredintials {
  storeId(int id) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setInt(userKey, id);
  }

  //reading the id of the logged in user
  Future<dynamic> readId() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getInt(userKey);
  }

//deletes all the locally saved data or (logout)
  clearId() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear();
  }
}
