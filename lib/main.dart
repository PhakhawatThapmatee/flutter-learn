import 'package:flutter/material.dart';
import 'calculator.dart';
import 'ListView.dart';
import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // ),
      home: const HomePage(
        title: "Home Page",
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        // "/": (context) => const HomePage(title: "home"),
        "/calculator": (context) => const CalculatorPage(
              title: "calcula1tor",
            ),
        "/listview": (context) => const ListViewPage(title: "List View")
      },
    );
  }
}
