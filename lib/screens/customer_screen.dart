import 'package:flutter/material.dart';
import 'package:loginTr4iner/items/user_item.dart';
import 'package:loginTr4iner/providers/users.dart';
import 'package:provider/provider.dart';

class CustomerScreen extends StatefulWidget {
  static const routeName = '/customer-info';

  @override
  _CustomerScreenState createState() => _CustomerScreenState();
}

class _CustomerScreenState extends State<CustomerScreen> {
  @override
  void didChangeDependencies() {
    Provider.of<Users>(context).getUserInfo();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Center(
          child: Text('User Interface',style: TextStyle(color: Colors.black)),
        ),
      ),
      body: UserItem(),
    );
  }
}
