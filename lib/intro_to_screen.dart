import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_page.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen>
    with SingleTickerProviderStateMixin {


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
    const color = Colors.white;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.teal[900],
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 70.0),
                    child: Container(
                      child: Text(
                        "TIC TAC TOE",
                        style: myNewFontWhite.copyWith(fontSize: 30),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: AvatarGlow(
                    endRadius: 140,
                    duration: const Duration(seconds: 2),
                    glowColor: Colors.white,
                    repeat: true,
                    repeatPauseDuration: const Duration(seconds: 1),
                    startDelay: const Duration(seconds: 1),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            style: BorderStyle.none,
                          ),
                          shape: BoxShape.circle),
                      child: Center(
                        child: CircleAvatar(
                          backgroundColor: Colors.teal[900],
                          radius: 80.0,
                          child: Container(
                            child: Image.asset(
                              'images/tictactoelogo.png',
                              color: Colors.white,
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 70.0),
                    child: Text(
                      "@CREATEDBYJAWAD",
                      style: myNewFontWhite.copyWith(fontSize: 20),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 40, right: 40, bottom: 40),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: const EdgeInsets.all(30),
                        color: Colors.white,
                        child: Center(
                          child: Text(
                            'PLAY GAME',
                            style: myNewFont,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),


              ],
            ),
          )),
    );
  }
}