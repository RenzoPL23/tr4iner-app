import 'package:loginTr4iner/providers/auth.dart';
import 'package:loginTr4iner/providers/users.dart';
import 'package:loginTr4iner/screens/auth_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class UserItem extends StatefulWidget {
  @override
  _UserItemState createState() => _UserItemState();
}

class _UserItemState extends State<UserItem> {
  @override
  Widget build(BuildContext context) {
    final userPresent = Provider.of<Auth>(context, listen: false);
    final userInfo = Provider.of<Users>(context);
    print(userInfo);
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 80, horizontal: 20),
        child: Column(children: <Widget>[
          Flexible(
            child: Container(
              margin: EdgeInsets.only(bottom: 20.0),
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 94.0),
              child: Text(
                'Bienvenido \$${userPresent.email}',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
            child: Padding(
              padding: EdgeInsets.all(4),
              child: ListTile(
                leading: CircleAvatar(
                  child: Padding(
                    padding: EdgeInsets.all(5),
                  ),
                ),
                title: Text(userPresent.email),
                subtitle: Text(
                  userPresent.userId,
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ),
          ),
          RaisedButton(
            onPressed: () {
              setState(() {
                userPresent.logout();
              });
            },
            textColor: Colors.white,
            padding: const EdgeInsets.all(0.0),
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.yellow,
              ),
              padding: const EdgeInsets.all(10.0),
              child: const Text('log out',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  )),
            ),
          ),
          // Text(userInfo.name),
          // Text(userInfo.lastname),
        ]),
      ),
    );
  }
}
