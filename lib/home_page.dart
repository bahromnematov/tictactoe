import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static final String id = "home_page";

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool oTurn = true;
  int xScore = 0;
  int oScore = 0;
  int fillBoxes = 0;

  List<String> items = ["", "", "", "", "", "", "", "", ""];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Tic Tac Toe",
          style: TextStyle(fontSize: 22),
        ),
        actions: [
          Icon(
            Icons.light_mode_sharp,
            color: Colors.red,
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(30),
                child: Text(
                  "Player X",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Text(
                "= $xScore",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: EdgeInsets.all(30),
                child: Text(
                  "Player O",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
              Text(
                "= $oScore",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ],
          )),
          Expanded(
              flex: 4,
              child: GridView.builder(
                itemCount: 9,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      _tapped(index);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 2, color: Colors.white)),
                      child: Center(
                        child: Text(
                          items[index],
                          style: TextStyle(color: Colors.white, fontSize: 36),
                        ),
                      ),
                    ),
                  );
                },
              )),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    clearScore();
                  },
                  child: const Text("Clear Score Board"))
            ],
          )),
        ],
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (oTurn && items[index] == "") {
        items[index] = 'O';
        fillBoxes++;
      } else if (!oTurn && items[index] == "") {
        items[index] = "X";
        fillBoxes++;
      }
      oTurn = !oTurn;

      _chekWinner();
    });
  }

  void _chekWinner() {
    if (items[0] == items[1] && items[0] == items[2] && items[0] != "") {
      _showWinDialog(items[0]);
    }
    if (items[3] == items[4] && items[3] == items[5] && items[3] != "") {
      _showWinDialog(items[3]);
    }
    if (items[6] == items[7] && items[6] == items[8] && items[6] != "") {
      _showWinDialog(items[6]);
    }

    if (items[0] == items[3] && items[0] == items[6] && items[0] != "") {
      _showWinDialog(items[0]);
    }

    if (items[1] == items[4] && items[1] == items[7] && items[1] != "") {
      _showWinDialog(items[1]);
    }

    if (items[2] == items[5] && items[2] == items[8] && items[2] != "") {
      _showWinDialog(items[2]);
    }

    if (items[0] == items[4] && items[0] == items[8] && items[0] != "") {
      _showWinDialog(items[0]);
    }

    if (items[2] == items[4] && items[2] == items[6] && items[2] != "") {
      _showWinDialog(items[2]);
    } else if (fillBoxes == 9) {
      _showDrawDialog();
    }
  }

  void _showWinDialog(String winner) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("\" $winner\" is winner!!"),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    clearScore();
                    Navigator.of(context).pop();
                  },
                  child: Text("Play Again"))
            ],
          );
        });
  }

  void clearScore() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        items[i] = "";
      }
    });
    fillBoxes = 0;
  }

  void _showDrawDialog() {
    showDialog(
        context: context,
        builder: (BuildContext contetx) {
          return AlertDialog(
            title: Text("Draw"),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Play Again")),
            ],
          );
        });
  }
}
