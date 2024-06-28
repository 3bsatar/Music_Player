import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AudioPlayerScreen(),
    );
  }
}

class AudioPlayerScreen extends StatefulWidget {
  @override
  _AudioPlayerScreenState createState() => _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  String? _selectedSong;
  Duration _currentPosition = Duration.zero;
  Duration _totalDuration = Duration.zero;
  bool _isPlaying = false;

  final List<Map<String, String>> _songs = [
    {"name": "Emperor Concerto", "path": "lib/audios/Beet.mp3", "image": "lib/audios/Beethoven.jpeg"},
    {"name": "G Minor", "path": "lib/audios/GG.mp3", "image": "lib/images/Mozart.jpeg"},
    {"name": "Brandenberg Concerto", "path": "lib/audios/Test.mp3", "image": "lib/audios/Beethoven.jpeg"},
    {"name": "Water Music", "path": "lib/audios/song4.mp3", "image": "lib/audios/song4.jpg"},
    {"name": "The four Seasons", "path": "lib/audios/song5.mp3", "image": "lib/audios/song5.jpg"},
  ];

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  Future<void> _playSong(String path) async {
    try {
      await _audioPlayer.setAsset(path);
      _audioPlayer.play();
      setState(() {
        _isPlaying = true;
      });
      _audioPlayer.positionStream.listen((position) {
        setState(() {
          _currentPosition = position;
        });
      });
      _audioPlayer.durationStream.listen((duration) {
        setState(() {
          _totalDuration = duration ?? Duration.zero;
        });
      });
      _audioPlayer.playerStateStream.listen((state) {
        if (state.processingState == ProcessingState.completed) {
          setState(() {
            _isPlaying = false;
          });
        }
      });
    } catch (e) {
      print('Error loading audio asset: $e');
    }
  }

  void _togglePlayPause() {
    if (_isPlaying) {
      _audioPlayer.pause();
    } else {
      _audioPlayer.play();
    }
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF5ED2B6), // Light green color
        title: DropdownButtonHideUnderline(
          child: DropdownButton2(
            hint: Text(
              'Select a Music',
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            items: _songs.map((song) {
              return DropdownMenuItem<String>(
                value: song['path'],
                child: Text(song['name']!, style: TextStyle(fontWeight: FontWeight.bold)),
              );
            }).toList(),
            value: _selectedSong,
            onChanged: (value) {
              setState(() {
                _selectedSong = value as String?;
                _playSong(_selectedSong!);
              });
            },
            buttonWidth: 200, // Make the dropdown list wider
            dropdownWidth: 200, // Make the dropdown list wider
            buttonDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.white),
              color: Color(0xFF5ED2B6), // Light green color
            ),
            dropdownDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.white,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: Color(0xFFFFFFFF), // Blue color
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (_selectedSong != null)
                Column(
                  children: [
                    Image.asset(
                      _songs.firstWhere((song) => song['path'] == _selectedSong)['image']!,
                      height: 350, // Maximized image height
                    ),
                    SizedBox(height: 20),
                    Slider(
                      value: _currentPosition.inSeconds.toDouble(),
                      max: _totalDuration.inSeconds.toDouble(),
                      onChanged: (value) {
                        setState(() {
                          _audioPlayer.seek(Duration(seconds: value.toInt()));
                        });
                      },
                    ),
                    Text(
                      "${_currentPosition.toString().split('.').first} / ${_totalDuration.toString().split('.').first}",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    SizedBox(height: 20),
                    IconButton(
                      icon: Icon(
                        _isPlaying ? Icons.pause_circle_filled : Icons.play_circle_filled,
                        color: Color(0xFF5ED2B6), // Light green color
                        size: 50,
                      ),
                      onPressed: _togglePlayPause,
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
