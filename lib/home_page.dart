import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> displayExOh = [
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
  bool ohTurn = true;
  var myTextStyle = const TextStyle(color: Colors.white, fontSize: 30);
  int ohScore = 0;
  int exScore = 0;
  int filledBoxes = 0;

  static var myNewFont = GoogleFonts.pressStart2p(
      textStyle: const TextStyle(color: Colors.black, letterSpacing: 3)
  );

  static var myNewFontWhite = GoogleFonts.pressStart2p(
      textStyle: const TextStyle(
          color: Colors.white, letterSpacing: 3, fontSize: 15
      )
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[900],
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                child: Container(
                  child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Player X",
                                style: myNewFontWhite,
                              ),
                              const SizedBox(height: 20,),
                              Text(
                                exScore.toString(),
                                style: myNewFontWhite,
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 60,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Player O",
                                style: myNewFontWhite,
                              ),
                              const SizedBox(height: 20,),
                              Text(
                                ohScore.toString(),
                                style: myNewFontWhite,
                              ),
                            ],
                          ),
                        ],
                      )),
                )),
            Expanded(
              flex: 5,
              child: GridView.builder(
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      _tapped(index);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.teal[700]!)),
                      child: Center(
                          child: Text(
                            displayExOh[index],
                            style:
                            const TextStyle(color: Colors.white, fontSize: 40),
                          )),
                    ),
                  );
                },
              ),
            ),
            Expanded(child: Container(
              child: Center(
                child: Text(
                  "TIC TAC TOE",
                  style: myNewFontWhite,
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (ohTurn && displayExOh[index] == "") {
        displayExOh[index] = "O";
        filledBoxes+=1;
        ohTurn = !ohTurn;
      } else if (!ohTurn && displayExOh[index] == "") {
        displayExOh[index] = "X";
        filledBoxes+=1;
        ohTurn = !ohTurn;
      }
      _checkWinner();
    });
  }

  void _checkWinner() {
    if (displayExOh[0] == displayExOh[1] &&
        displayExOh[0] == displayExOh[2] &&
        displayExOh[0] != '') {
      _showWinDialog(displayExOh[0]);
    }
    if (displayExOh[3] == displayExOh[4] &&
        displayExOh[3] == displayExOh[5] &&
        displayExOh[3] != '') {
      _showWinDialog(displayExOh[3]);
    }
    if (displayExOh[6] == displayExOh[7] &&
        displayExOh[6] == displayExOh[8] &&
        displayExOh[6] != '') {
      _showWinDialog(displayExOh[6]);
    }
    if (displayExOh[0] == displayExOh[3] &&
        displayExOh[0] == displayExOh[6] &&
        displayExOh[0] != '') {
      _showWinDialog(displayExOh[0]);
    }
    if (displayExOh[1] == displayExOh[4] &&
        displayExOh[1] == displayExOh[7] &&
        displayExOh[1] != '') {
      _showWinDialog(displayExOh[1]);
    }
    if (displayExOh[2] == displayExOh[5] &&
        displayExOh[2] == displayExOh[8] &&
        displayExOh[2] != '') {
      _showWinDialog(displayExOh[2]);
    }
    if (displayExOh[0] == displayExOh[4] &&
        displayExOh[0] == displayExOh[8] &&
        displayExOh[0] != '') {
      _showWinDialog(displayExOh[0]);
    }
    if (displayExOh[2] == displayExOh[4] &&
        displayExOh[2] == displayExOh[6] &&
        displayExOh[2] != '') {
      _showWinDialog(displayExOh[2]);
    }
    else if(filledBoxes == 9){
      _showDrawDialog();
    }
  }

  void _showDrawDialog(){
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("It's a Draw"),
          actions: [
            ElevatedButton(
              onPressed: (){
                filledBoxes == 0;
                _clearBoard();
                Navigator.pop(context);
              },
              child: const Text("Play Again!"),
            )
          ],
        );
      },
    );
  }

  void _showWinDialog(String winner) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Winner is $winner ....!!!!"),
          actions: [
            ElevatedButton(
              onPressed: (){
                filledBoxes == 0;
                _clearBoard();
                Navigator.pop(context);
              },
              child: const Text("Play Again!"),
            )
          ],
        );
      },
    );
    if(winner == "O"){
      setState(() {
        ohScore +=1;
      });
    } else if(winner == "X"){
      setState(() {
        exScore +=1;
      });
    }
  }

  void _clearBoard(){
    filledBoxes = 0;
    setState(() {
      for(int i=0;i<9;i++){
        displayExOh[i] = "";
      }
    });
  }
}
