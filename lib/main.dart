import 'package:flutter/material.dart';
import 'package:untitled/main_screen.dart';
import 'package:untitled/provider/done_tourism_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DoneTourismProvider(),
      child: MaterialApp(
        title: 'Concats',
        theme: ThemeData(),
        home: MainScreen(),
      ),
    );
  }
}


