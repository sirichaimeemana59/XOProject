import 'package:flutter/material.dart';
import 'package:xo_project/xogame/xoGame.dart';

class XOProfile extends StatefulWidget {
  @override
  _XOProfileState createState() => _XOProfileState();
}

class _XOProfileState extends State<XOProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade800,
        title: Text('XO Profile'),
      ),
      body: SafeArea(
        child: Container(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  height: 8.0,
                ),
                showButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget showButton() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        submitButton(),
        SizedBox(
          width: 8.0,
        ),
        //apiTestButton()
      ],
    );
  }

    Widget submitButton() {
    // ignore: deprecated_member_use
    return RaisedButton(
      color: Colors.green.shade700,
      child: Text('OK', style: TextStyle(color: Colors.white)),
      onPressed: () {
        //print('You Click');

        MaterialPageRoute materialPageRoute =
            MaterialPageRoute(builder: (BuildContext context) => XOGame());
        Navigator.of(context)
            .push(materialPageRoute); //การสร้าง Route เพื่อเปิดหน้าใหม่
      },
    );
  }

}
