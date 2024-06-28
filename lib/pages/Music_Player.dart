import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.lightGreen,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: AudioPlayerScreen(),
    );
  }
}

class AudioPlayerScreen extends StatefulWidget {
  @override
  _AudioPlayerScreenState createState() => _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
  late AudioPlayer _audioPlayer;
  Map<String, String> _songMap = {
    'Song 1': 'lib/audios/Test.mp3',
    'Song 2': 'lib/audios/Test2.mp3',
    'Song 3': 'lib/audios/Test3.mp3',
    'Song 4': 'lib/audios/Test4.mp3',
    'Song 5': 'lib/audios/Test5.mp3',
  };

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  void _playSong(String assetPath) async {
    await _audioPlayer.setAsset(assetPath);
    _audioPlayer.play();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Audio Player'),
      ),
      body: Center(
        child: DropdownButton<String>(
          hint: Text('Select a song'),
          items: _songMap.keys.map((String song) {
            return DropdownMenuItem<String>(
              value: _songMap[song],
              child: Text(song),
            );
          }).toList(),
          onChanged: (String? value) {
            if (value != null) {
              _playSong(value);
            }
          },
        ),
      ),
    );
  }
}
