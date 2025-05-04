import 'package:flutter/material.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shadowColor: Colors.deepPurple[900],
      backgroundColor: Colors.white,
      child: Stack(
        children: [
          ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                accountName: Text(
                  "AmeenB",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                accountEmail: Text(
                  "ameenb1104@gmail.com",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                currentAccountPicture: CircleAvatar(
                  child: ClipOval(
                    child: Image.asset(
                      "assets/img/pfp.jpg",
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/img/siderbarbg.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              ListTile(
                leading: Icon(
                  Icons.music_note_rounded,
                  color: Colors.deepPurpleAccent,
                ),
                title: Text(
                  "Favourite Songs",
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () => print("Favourite Songs"),
              ),

              ListTile(
                leading: Icon(
                  Icons.favorite_outlined,
                  color: Colors.deepPurpleAccent,
                ),
                title: Text(
                  "Favourite Artists",
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () => print("Favourite Artists"),
              ),

              ListTile(
                leading: Icon(
                  Icons.my_library_music_rounded,
                  color: Colors.deepPurpleAccent,
                ),
                title: Text(
                  "Playlists",
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () => print("playlists"),
              ),

              ListTile(
                leading: Icon(Icons.mic, color: Colors.deepPurpleAccent),
                title: Text(
                  "Upload Music",
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () => print("Upload Music"),
              ),

              Divider(indent: 20, endIndent: 20),

              ListTile(
                leading: Icon(Icons.history, color: Colors.deepPurpleAccent),
                title: Text(
                  "History",
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () => print("History"),
              ),

              ListTile(
                leading: Icon(Icons.settings, color: Colors.deepPurpleAccent),
                title: Text(
                  "Settings",
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () => print("Settings"),
              ),

              ListTile(
                leading: Icon(
                  Icons.support_agent,
                  color: Colors.deepPurpleAccent,
                ),
                title: Text(
                  "Contact Support",
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                onTap: () => print("Contact Support"),
              ),
            ],
          ),

          Positioned(
            top: 16,
            right: 16,
            child: IconButton(
              icon: Icon(Icons.close, color: Colors.black),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
