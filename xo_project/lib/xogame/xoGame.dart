import 'package:flutter/material.dart';

class XOGame extends StatefulWidget {
  @override
  _XOGameState createState() => _XOGameState();
}

class _XOGameState extends State<XOGame> {
  int get i => null;
  int get j => null;

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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildChannel(item, data),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildChannel(item, data) => GestureDetector(
        //onTap: () => onChannelPressed(row, col),
        child: Column(
          children: [
            //for (int i = 0; i < item; i++)
              //for (int j = 0; j < 3; j++)
                //Text(data[i][j].toString()),

                Container(
                    margin: EdgeInsets.all(2),
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        color: getBackgroundChannelFromStatus(data[2]),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(1),
                            topRight: Radius.circular(1),
                            bottomLeft: Radius.circular(1),
                            bottomRight: Radius.circular(1))),
                    child: Icon(getIconFromStatus(data[2]),
                        size: 60, color: Colors.blue.shade900)),
          ],
        ),
      );

  IconData getIconFromStatus(int status) {
    //print("XO $status");
    if (status == 1) {
      return Icons.close;
    } else if (status == 2) {
      return Icons.radio_button_unchecked;
    }
    return null;
  }

  Color getBackgroundChannelFromStatus(int status) {
    //print(status);
    if (status == 1) {
      return Colors.blue.shade200;
    } else if (status == 2) {
      return Colors.blue.shade200;
    }
    return Colors.blue.shade100;
  }
  //End Render Table

  //Event click
  onChannelPressed(int row, int col) {
    if (channelStatus[row][col] == NONE) {
      setState(() {
        channelStatus[row][col] = VALUE_X;
      });
    }
  }
  //End Evet
}
