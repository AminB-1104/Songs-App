import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:song_app/screens/fetch_songs.dart';
import 'package:song_app/screens/sideBar.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    var arrArtists = [
      {
        "name": "Atif Aslam",
        "songCount": "200+ Songs",
        "image": "atif_aslam.jpg",
      },
      {
        "name": "Arijit Singh",
        "songCount": "250+ Songs",
        "image": "arijit_singh.jpg",
      },
      {
        "name": "Ali Zafar",
        "songCount": "150+ Songs",
        "image": "ali_zafar.jpg",
      },
      {
        "name": "A. R. Rahman",
        "songCount": "300+ Songs",
        "image": "ar_rahman.jpg",
      },
      {"name": "KK", "songCount": "100+ Songs", "image": "kk.jpg"},
    ];

    return Scaffold(
      drawer: Sidebar(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              print("Search");
            },
            icon: Icon(Icons.search),
            color: Colors.deepPurpleAccent,
          ),
          SizedBox(width: 50),
        ],
        title: Center(
          child: Text(
            'Songs App',
            style: TextStyle(
              color: Colors.deepPurpleAccent,
              fontFamily: 'ZenDots',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        iconTheme: IconThemeData(color: Colors.deepPurpleAccent),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(2.0),
          child: Container(
            // color: Colors.grey,
            height: 2.0,
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.deepPurpleAccent,
            ),
          ),
        ),
      ),

      backgroundColor: Colors.white,

      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 25),
          children: [
            Text(
              "Weekly Drops",
              style: TextStyle(
                color: Colors.deepPurple,
                fontSize: 40,
                fontWeight: FontWeight.bold,
                fontFamily: 'Poppins',
              ),
            ),
            SizedBox(height: 10),

            FetchSongs(),

            SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Explore",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                Icon(
                  Icons.local_fire_department,
                  color: Colors.deepOrangeAccent,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Recommended",
                    style: TextStyle(
                      color: Colors.deepPurpleAccent,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    "2025 Songs",
                    style: TextStyle(color: Colors.grey, fontSize: 15),
                  ),
                  Text(
                    "New Songs",
                    style: TextStyle(color: Colors.grey, fontSize: 15),
                  ),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(height: 30),
                  Text(
                    "Top Artists",
                    style: TextStyle(
                      color: Colors.deepPurpleAccent,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'ZenDots',
                    ),
                  ),
                  SizedBox(height: 15),
                  SizedBox(
                    height: 300,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            children: [
                              Container(
                                height: 200,
                                width: 200,
                                decoration: BoxDecoration(
                                  color: Colors.deepPurpleAccent[100],
                                  borderRadius: BorderRadius.circular(50),
                                  image: DecorationImage(
                                    image: AssetImage(
                                      "assets/img/${arrArtists[index]["image"].toString()}",
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 20),

                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          arrArtists[index]["name"].toString(),
                                          style: TextStyle(
                                            color: Colors.deepPurple[800],
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          arrArtists[index]["songCount"]
                                              .toString(),
                                          style: TextStyle(
                                            color: Colors.deepPurple[800],
                                            fontSize: 17,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 20),
                                    // Icon(Icons.favorite_border_outlined),
                                    LikeButton(
                                      bubblesColor: BubblesColor(
                                        dotPrimaryColor: Colors.deepPurple,
                                        dotSecondaryColor:
                                            Colors.deepPurpleAccent,
                                      ),

                                      circleColor: CircleColor(
                                        start: Colors.deepPurple,
                                        end: Colors.deepPurpleAccent,
                                      ),

                                      likeBuilder: (bool isLiked) {
                                        return Icon(
                                          Icons.favorite,
                                          color:
                                              isLiked
                                                  ? Colors.deepPurpleAccent
                                                  : Colors.grey,
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      itemCount: arrArtists.length,
                      // itemExtent: 150,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
