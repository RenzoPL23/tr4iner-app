import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class User with ChangeNotifier{
  final String name;
  final String lastname;
  
  User({
    @required this.name,
    @required this.lastname,
  });

}