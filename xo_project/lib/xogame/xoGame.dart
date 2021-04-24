import 'package:flutter/material.dart';

class XOGame extends StatefulWidget {
  @override
  _XOGameState createState() => _XOGameState();
}

class _XOGameState extends State<XOGame> {
  //setState
  void initState() {
    //Get State
    super.initState();
    // this.channelStatus();
  }

  //end state
//Valiable
  static const int NONE = 0;
  static const int VALUE_X = 1;
  static const int VALUE_O = 2;

  var channelStatus = [
    [VALUE_X, NONE, VALUE_O],
    [VALUE_O, VALUE_O, VALUE_X],
    [VALUE_O, NONE, VALUE_X],
    [VALUE_O, NONE, VALUE_X],
  ];

//End Valiable
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade600,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade800,
        title: Text('XO GAME'),
      ),
      body: getBody(),
    );
  }

  //Render Table
  Widget getBody() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
      ),
      //colNum = channelStatus.length*3;
      shrinkWrap: true,
      itemCount: channelStatus.length * 3,
      itemBuilder: (context, index) {
        //print(c);
        return genColumn(channelStatus.length, channelStatus);
      },
    );
  }

  Widget genColumn(item, data) {
    //print(item);
    return Container(
      height: 150,
      width: 150,
      padding: EdgeInsets.all(10),
      constraints: BoxConstraints.expand(),
      color: Colors.blue.shade600,
      child: Center(
        child: Container(
          color: Colors.blue.shade500,
          //padding: EdgeInsets.all(4),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: buildRowChannel(item),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> buildRowChannel(int row) {
    // ignore: deprecated_member_use
    List<Widget> listWidget = List();
    for (int rol = 0; rol <= row; rol++) {
      for (int col = 0; col <= 3; col++) {
        // ignore: unused_local_variable
        Widget widget = buildChannel(row, col);
        //print("Rol $rol Col $col Status");
      }
      listWidget.add(widget);
    }
    //print(data);
    return listWidget;
  }

  Widget buildChannel(int row, int col) => GestureDetector(
        //onTap: () => onChannelPressed(row, col),
        child: Column(
          children: [
           // Text(col.toString()),
            Container(
                margin: EdgeInsets.all(2),
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    //color: getBackgroundChannelFromStatus(col),
                   ),
                //child: Icon(getIconFromStatus(col),
                    //size: 60, color: Colors.blue.shade900)
                    ),
          ],
        ),
      );

  // IconData getIconFromStatus(int status) {
  //   //print("XO $status");
  //   if (status == 1) {
  //     return Icons.close;
  //   } else if (status == 2) {
  //     return Icons.radio_button_unchecked;
  //   }
  //   return null;
  // }

  // Color getBackgroundChannelFromStatus(int status) {
  //   //print(status);
  //   if (status == 1) {
  //     return Colors.blue.shade200;
  //   } else if (status == 2) {
  //     return Colors.blue.shade200;
  //   }
  //   return Colors.blue.shade100;
  // }
  // //End Render Table

  // //Event click
  // onChannelPressed(int row, int col) {
  //   if (channelStatus[row][col] == NONE) {
  //     setState(() {
  //       channelStatus[row][col] = VALUE_X;
  //     });
  //   }
  // }
  //End Evet
}
