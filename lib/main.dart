import 'package:flutter/material.dart';
import 'package:loginTr4iner/providers/auth.dart';
import 'package:loginTr4iner/providers/users.dart';
import 'package:loginTr4iner/screens/auth_screen.dart';
import 'package:loginTr4iner/screens/customer_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, Users>(
          create: null,
          update: (ctx, auth, _) => Users(
            auth.token,
            auth.userId,
          ),
        )
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) => MaterialApp(
          title: 'trainer',
          theme: ThemeData(
            primaryColor: Colors.black,
            accentColor: Colors.deepOrange,
          ),
          home: auth.isAuth ? CustomerScreen() : AuthScreen(),
          routes: {
            CustomerScreen.routeName: (ctx) => CustomerScreen(),
          },
        ),
      ),
    );
  }
}
