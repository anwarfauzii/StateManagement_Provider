import 'package:flutter/material.dart';
import 'package:latihan_state_management/pages/home_page.dart';
import 'package:latihan_state_management/providers/user_provider.dart';
import 'package:provider/provider.dart';

import 'login_page.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
   checkToken();
  }
  checkToken()async{
     UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);
    await userProvider.checkToken();

    if (userProvider.user!.token == null) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
