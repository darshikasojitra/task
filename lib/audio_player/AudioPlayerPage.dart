import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioPlayerPage extends StatefulWidget {
  @override
  _AudioPlayerPageState createState() => _AudioPlayerPageState();
}

class _AudioPlayerPageState extends State<AudioPlayerPage> {
  AudioPlayer audioPlayer = AudioPlayer();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Audio Player'),
        backgroundColor: const Color(0xff1C6BA4),
      ),
      body: Center(
        child: MaterialButton(
          onPressed: () async {
            audioPlayer.play(
              AssetSource('audio/sample-3s.mp3'),
            );
          },
          color: const Color(0xff1C6BA4),
          child: const Text(
            'Play Audio',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
