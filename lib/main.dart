import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/screen/provider/todo_provider.dart';
import 'package:todo_app/screen/view/login_screen.dart';

import 'screen/view/first_screen.dart';
import 'screen/view/singnup_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => TodoProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => LodinScreen(),
          'sin': (context) => SignupScreen(),
          'fir': (context) => FirstScreen(),
        },
      ),
    ),
  );
}
