import 'package:flutter/material.dart';
import 'package:gtnm/screens/app.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>{
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: ElevatedButton(
                child: Text('LOGIN'),
                onPressed: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AppScreen()));
                },
              ),
            )
          ],
        )
      ),
    );
  }
}
