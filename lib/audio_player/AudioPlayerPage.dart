import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioPlayerPage extends StatefulWidget {
  @override
  _AudioPlayerPageState createState() => _AudioPlayerPageState();
}

class _AudioPlayerPageState extends State<AudioPlayerPage> {
  AudioPlayer audioPlayer = AudioPlayer();
  @override
  void initState() {
    super.initState();
    audioPlayer = AudioPlayer();
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Build your UI here
    return Scaffold(
      appBar: AppBar(
        title: Text('Audio Player'),
        backgroundColor: Color(0xff1C6BA4),
      ),
      body: Center(
        child: MaterialButton(
          onPressed: () async {
            await audioPlayer.play(
              'assets/audio/sample-3s.mp3' as Source,
            );
          },
          child: Text('Play Audio'),
        ),
      ),
    );
  }
}
