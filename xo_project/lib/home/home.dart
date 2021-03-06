import 'package:flutter/material.dart';
import 'package:xo_project/xogame/xoprofile.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
//Method

  Widget showLogo() {
    //สร้าง Widget เพื่อนำไปใช้ใน SafeArea
    return Container(
      width: 120.0,
      height: 120.0,
      //child: Image.asset('images/resume.png'),
    );
  }

  Widget showAppName() {
    //สร้าง Widget เพื่อนำไปใช้ใน SafeArea
    return Text(
      'XO GAME',
      style: TextStyle(
        fontSize: 30.0,
        color: Colors.blue.shade700,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget singInButton() {
    // ignore: deprecated_member_use
    return RaisedButton(
      color: Colors.blue.shade800,
      child: Text('Sign In', style: TextStyle(color: Colors.white)),
      onPressed: () {
        MaterialPageRoute materialPageRoute =
            MaterialPageRoute(builder: (BuildContext context) => XOProfile());
        Navigator.of(context).push(materialPageRoute);
      },
    );
  }

  Widget registerButton() {
    // ignore: deprecated_member_use
    return RaisedButton(
      color: Colors.green.shade700,
      child: Text('Register', style: TextStyle(color: Colors.white)),
      onPressed: () {
        //print('You Click');

        // MaterialPageRoute materialPageRoute =
        //     MaterialPageRoute(builder: (BuildContext context) => Register());
        // Navigator.of(context)
        //     .push(materialPageRoute);
      },
    );
  }

  Widget apiTestButton() {
    return IconButton(
      icon: Icon(Icons.cloud_upload),
      onPressed: () {
        // MaterialPageRoute materialPageRoute =
        //     MaterialPageRoute(builder: (BuildContext context) => UserList());
        // Navigator.of(context)
        //     .push(materialPageRoute);
      },
    );
  }

  Widget showButton() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        singInButton(),
        SizedBox(
          width: 8.0,
        ),
        registerButton(),
        SizedBox(
          width: 8.0,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
            //image: DecorationImage(
            //image: AssetImage('images/PetBackground.png'),
            //fit: BoxFit.cover,
            //)
            ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 550.0,
              ),
              showAppName(),
              SizedBox(
                height: 8.0,
              ),
              showButton(),
            ],
          ),
        ),
      )),
    );
  }
}
