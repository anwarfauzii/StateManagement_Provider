import 'package:flutter/material.dart';
import 'providers/weigh_provider.dart';
import 'package:provider/provider.dart';
import 'home_page.dart';
void main()=>runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>WeighProvider(),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.indigo
        ),
        home:  HomePage(),
        
      ),
    );
  }
}