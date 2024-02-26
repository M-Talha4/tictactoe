import 'package:flutter/material.dart';
import 'package:tictactoe/widget/custom_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  int scoreOfX = 0;
  int scoreOfO = 0;
  bool turnOfO = true;
  int filledBoxes = 0;

  late double height;
  late double width;

  List<String> oAndXList = [
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
    "",
  ];

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: cText(
          text: "Tic Tac Toe",
          size: width * 0.065,
        ),
        // centerTitle: true,
      ),
      body: SizedBox(
        width: width,
        height: height,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.08, vertical: height * 0.05),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              score(),
              table(),
              turn(),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      clearBoard();
                    });
                  },
                  child: cText(
                    text: "Clear Board",
                    size: width * 0.05,
                  )),
            ],
          ),
        ),
      ),
    ));
  }

  Widget score() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Card(
            elevation: 5,
            shadowColor: Colors.blue,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(width * 0.03)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  cText(
                    text: "Player 1 (O)",
                    size: width * 0.06,
                    color: Colors.deepPurple,
                    weight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  cText(
                    text: scoreOfO.toString(),
                    size: width * 0.06,
                    color: Colors.blue,
                    weight: FontWeight.bold,
                  ),
                ],
              ),
            )),
        Card(
            elevation: 5,
            shadowColor: Colors.red,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(width * 0.03)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  cText(
                    text: "Player 2 (X)",
                    size: width * 0.06,
                    color: Colors.deepPurple,
                    weight: FontWeight.bold,
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  cText(
                    text: scoreOfX.toString(),
                    size: width * 0.06,
                    color: Colors.red,
                    weight: FontWeight.bold,
                  ),
                ],
              ),
            )),
      ],
    );
  }

  Widget table() {
    return SizedBox(
      height: height * 0.4,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: 9,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              tapped(index);
            },
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black, width: 1)),
              child: cText(
                text: oAndXList[index],
                size: width * 0.065,
                weight: FontWeight.bold,
                color: oAndXList[index] == "X" ? Colors.red : Colors.blue,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget turn() {
    return cText(
      text: " Turn of Player: ${turnOfO ? 1 : 2}",
      color: turnOfO ? Colors.blue : Colors.red,
      weight: FontWeight.bold,
      size: width * 0.055,
    );
  }

  // on Box Tapping
  void tapped(int index) {
    setState(() {
      if (turnOfO && oAndXList[index] == "") {
        oAndXList[index] = "O";
        filledBoxes += 1;
        turnOfO = !turnOfO;
      } else if (!turnOfO && oAndXList[index] == "") {
        oAndXList[index] = "X";
        filledBoxes += 1;
        turnOfO = !turnOfO;
      }

      checkWinner();
    });
  }

  void checkWinner() {
    // first Row
    if (oAndXList[0] == oAndXList[1] &&
        oAndXList[0] == oAndXList[2] &&
        oAndXList[0] != "") {
      matchResult(oAndXList[0] == "X" ? "X" : "O");
    }

    // second Row
    else if (oAndXList[3] == oAndXList[4] &&
        oAndXList[3] == oAndXList[5] &&
        oAndXList[3] != "") {
      matchResult(oAndXList[3] == "X" ? "X" : "O");
    }

    // third Row
    else if (oAndXList[6] == oAndXList[7] &&
        oAndXList[6] == oAndXList[8] &&
        oAndXList[6] != "") {
      matchResult(oAndXList[6] == "X" ? "X" : "O");
    }

    // first column
    else if (oAndXList[0] == oAndXList[3] &&
        oAndXList[0] == oAndXList[6] &&
        oAndXList[0] != "") {
      matchResult(oAndXList[0] == "X" ? "X" : "O");
    }

    // second column
    else if (oAndXList[1] == oAndXList[4] &&
        oAndXList[1] == oAndXList[7] &&
        oAndXList[1] != "") {
      matchResult(oAndXList[1] == "X" ? "X" : "O");
    }

    // third column
    else if (oAndXList[2] == oAndXList[5] &&
        oAndXList[2] == oAndXList[8] &&
        oAndXList[2] != "") {
      matchResult(oAndXList[2] == "X" ? "X" : "O");
    }

    // first diagonal
    else if (oAndXList[0] == oAndXList[4] &&
        oAndXList[0] == oAndXList[8] &&
        oAndXList[0] != "") {
      matchResult(oAndXList[0] == "X" ? "X" : "O");
    }

    // second diagonal
    else if (oAndXList[2] == oAndXList[4] &&
        oAndXList[2] == oAndXList[6] &&
        oAndXList[2] != "") {
      matchResult(oAndXList[2] == "X" ? "X" : "O");
    }

    // draw

    else if (filledBoxes == 9) {
      matchResult("Draw");
    }
  }

  // Dialog Box
  void matchResult(String winner) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(winner == "Draw" ? "Draw" : "Winner"),
            content: Text(
              winner == "Draw"
                  ? "This Match is Draw"
                  : winner == "X"
                      ? "The Winner is Player 2"
                      : "The Winner is Player 1",
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context, 'OK');
                  },
                  child: const cText(text: "OK"))
            ],
          );
        });

    clearBoard();

    // Score
    if (winner == "X") {
      scoreOfX += 1;
    } else if (winner == "O") {
      scoreOfO += 1;
    }
  }

  void clearBoard() {
    filledBoxes = 0;
    for (int i = 0; i < oAndXList.length; i++) {
      oAndXList[i] = "";
    }
  }
}
