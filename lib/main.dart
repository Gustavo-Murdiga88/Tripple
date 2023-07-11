import 'package:flutter/material.dart';
import 'package:tripler/src/modules/fetch/presentation/page/fetch_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Fetch repositories'),
    );
  }
}
