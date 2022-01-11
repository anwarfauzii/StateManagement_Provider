import 'package:flutter/material.dart';
import 'package:latihan_state_management/providers/user_provider.dart';
import 'providers/weigh_provider.dart';
import 'package:provider/provider.dart';
import 'pages/splash_screen_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => WeighProvider()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
      ],
      child: MaterialApp(
        theme: ThemeData(primarySwatch: Colors.indigo),
        home: const SplashScreenPage(),
      ),
    );
  }
}
