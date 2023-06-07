import 'package:flutter/material.dart';
import 'package:web_page/screens/main_page.dart';
import 'package:provider/provider.dart';
import 'package:web_page/controllers/appbar_provider.dart';
import 'package:web_page/controllers/expandable_provider.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setUrlStrategy(PathUrlStrategy());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppbarProvider()),
        ChangeNotifierProvider(create: (context) => ExpandableProvider())
      ],
      child: MaterialApp(
        initialRoute: "/",
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case '/':
              return MaterialPageRoute(builder: (_) => const MainPage());
            default:
              return MaterialPageRoute(builder: (_) => const MainPage());
          }
        },
        debugShowCheckedModeBanner: false,
        title: 'Daniel Bacab',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          primaryColor: Colors.blueAccent,
          iconTheme: const IconThemeData(color: Colors.white),
          cardColor: Colors.blueGrey,
          fontFamily: 'Lato',
          useMaterial3: true,
        ),
        home: const MainPage(),
      ),
    );
  }
}
