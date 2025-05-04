import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FetchSongs extends StatefulWidget {
  const FetchSongs({super.key});

  @override
  State<FetchSongs> createState() => _FetchSongsState();
}

class _FetchSongsState extends State<FetchSongs> {
  List<dynamic> songs = [];

  @override
  void initState() {
    super.initState();
    fetchSongs();
  }

  void fetchSongs() async {
    const url = 'https://aminb-1104.github.io/Songs-Api/songs_api.json';
    final response = await http.get(Uri.parse(url));

    final jsonData = jsonDecode(response.body);
    setState(() {
      songs = jsonData['songs'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Text(
            "Trending Songs",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              fontFamily: 'ZenDots',
            ),
          ),
        ),
        Container(
          height: 700,
          decoration: BoxDecoration(
            color: Colors.deepPurple[300],
            borderRadius: BorderRadius.circular(30),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListView.builder(
              itemCount: songs.length,
              itemBuilder: (context, index) {
                final song = songs[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple[100],
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        song['song_name'],
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Poppins',
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'From ' + song['artist_name'],
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(song['duration']),
                        ],
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          print('Now Playing ' + song['song_name']);
                        },
                        icon: Icon(Icons.play_arrow),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
