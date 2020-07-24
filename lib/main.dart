import 'package:flutter/material.dart';
import 'dart:math';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart'; // needed for vibration


void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey[800],
        appBar: AppBar(
          title: Text('Diceee'),
          backgroundColor: Colors.blueGrey[800],
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {

  AudioCache _audioCache;


  @override
  void initState() {
    super.initState();
    // create this only once
    _audioCache = AudioCache(prefix: "audios/", fixedPlayer: AudioPlayer()..setReleaseMode(ReleaseMode.STOP));
  }
  int  diceNumber = 1;

  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(100.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  onPressed: (){
                    HapticFeedback.lightImpact();
                    setState(() {

                      diceNumber = Random().nextInt(6)+1;

                    });

                    _audioCache.play('$diceNumber.mp3');
                  },
                  child: Image.asset("images/dice$diceNumber.png"),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
