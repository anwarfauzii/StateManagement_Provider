import 'package:flutter/material.dart';
import '../providers/user_provider.dart';
import 'home_page.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider> (context);
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () async{
            await userProvider.getUser();
            Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));

          },
          style: TextButton.styleFrom(
            backgroundColor: Colors.indigo,
          ),
          child: const Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                'Login',
                style: TextStyle(fontSize: 20, color: Colors.white),
              )),
        ),
      ),
    );
  }
}
