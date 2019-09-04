import 'package:core/service/model/User.dart';
import 'package:flutter/cupertino.dart';

class GetUser with ChangeNotifier {
  List<User> user = [];
  String damn = "";

  void getUser() {
    user.clear();
    user.add(User(1, 1, "title", "https://via.placeholder.com/600/92c952",
        "https://via.placeholder.com/150/92c952"));
    user.add(User(1, 1, "title", "https://via.placeholder.com/600/92c952",
        "https://via.placeholder.com/150/92c952"));
    damn = "dannm";
    notifyListeners();
  }
}
