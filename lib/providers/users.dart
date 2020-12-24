import 'package:flutter/cupertino.dart';
import 'package:loginTr4iner/providers/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Users with ChangeNotifier {
  final String authToken;
  final String userId;
  String _name;
  String _lastname;

  String get name {
    return _name;
  }

  String get lastname {
    return _lastname;
  }

  Users(this.authToken, this.userId);

  Future<void> addUser(User user) async {
    final url =
        'https://tr4iner-app-184a3-default-rtdb.firebaseio.com/User.json?auth=$authToken';
    //POST
    try {
      await http.post(
        url,
        body: json.encode(
          {
            'name': user.name,
            'lastname': user.lastname,
            'creatorId': userId,
          },
        ),
      );
      final newUser = User(
        name: user.name,
        lastname: user.lastname,
      );
      _name = newUser.name;
      _lastname = newUser.lastname;

      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }

  Future<void> getUserInfo() async {
    var url =
        'https://tr4iner-app-184a3-default-rtdb.firebaseio.com/User.json?auth=$authToken';

    final response = await http.get(url);
    final extractedData = json.decode(response.body) as Map<String, dynamic>;
    User loadedUser;
    try {
      extractedData.forEach((id, prodData) {
        loadedUser = new User(
          name: prodData['name'],
          lastname: prodData['lastname'],
        );
      });
      _name = loadedUser.name;
      _lastname = loadedUser.lastname;
      notifyListeners();
    } catch (e) {
      throw e;
    }
  }
}
