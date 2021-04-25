import 'package:flutter/material.dart';

class XOGame extends StatefulWidget {
  @override
  _XOGameState createState() => _XOGameState();
}

class _XOGameState extends State<XOGame> {
  //Set Valiable demo
  static const int NONE = 0;
  static const int VALUE_X = 1;
  static const int VALUE_O = 2;

  List<List<int>> channelStatus = [
    [VALUE_X, VALUE_O, NONE],
    [NONE, VALUE_O, VALUE_X],
    [VALUE_X, VALUE_O, VALUE_X],
    [NONE, VALUE_O, VALUE_X],
  ];

  //End valiable
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade800,
        title: Text('XO Profile'),
      ),
      body: getGride(),
    );
  }

//Get Column XO
  // ignore: missing_return
  Widget getGride() {
    int column = 0;
    //var statusColumn = [];
    for (int col = 0; col < channelStatus.length; col++) {
      //  for (int row = 0; row < channelStatus[col].length; row++) {
      column = channelStatus[col].length * channelStatus.length;
      //statusColumn = channelStatus[row];
      // }
      return GridView.count(
        crossAxisCount: channelStatus[col].length,
        children: buildGrideList(column),
        //children: [Text(channelStatus.toString()),],
      );
    }
  }

//List table
  // ignore: missing_return
  List<Container> buildGrideList(int count) {
    var newList = channelStatus.expand((x) => x).toList();
    return List.generate(
        count,
        (index) => Container(
              margin: EdgeInsets.all(3),
              decoration: BoxDecoration(
                  color: Colors.blue.shade700,
                  borderRadius: BorderRadius.all(Radius.circular(3))),
              padding: EdgeInsets.all(2),
              // ignore: deprecated_member_use
              child: RaisedButton(
                onPressed: () {
                  //print('$index');
                  onChannelPressed(index);
                },
                child: Column(
                  children: [
                    Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //Text('${channelStatus.length}+${newList[index]}'),
                          //Text(channelStatus[rol].length.toString()),
                          Icon(getIconFromStatus(newList[index]), size: 60),
                        ])
                  ],
                ),
              ),
            ));
  }

//Check ICON in Column
  IconData getIconFromStatus(int status) {
    if (status == VALUE_X) {
      return Icons.close;
    } else if (status == VALUE_O) {
      return Icons.radio_button_checked;
    } else {
      return null;
    }
  }

//End Check ICON in Column

//Event slect
  onChannelPressed(int col) {
    setState(() {
      // ignore: unrelated_type_equality_checks
      channelStatus[col] == VALUE_X;
    });
    // print(col);
  }
//End event
}
