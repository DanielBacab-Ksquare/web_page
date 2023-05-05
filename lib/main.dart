import 'package:flutter/material.dart';
import 'package:web_page/screens/main_page.dart';
import 'package:provider/provider.dart';
import 'package:web_page/controllers/appbar_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context)=>AppbarProvider())
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Daniel Bacab',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        primaryColor: Colors.blueAccent,
        iconTheme: IconThemeData(color: Colors.white),
        cardColor: Colors.blueGrey,
         
        useMaterial3: true,
      ),
      home: MainPage(),
    ),
    );
  }
}

