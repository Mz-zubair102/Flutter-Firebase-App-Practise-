import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Screens/add_post_screen_state.dart';
import 'Screens/main_button_screen.dart';
import 'Screens/user_info_screen_state.dart';
import 'Screens/users_list_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      // home: UsersListScreen(),
      home: ButtonScreen1(),
      // home: UserInfo(),
      // home: AddpostScreenState(),
    );
  }
}

