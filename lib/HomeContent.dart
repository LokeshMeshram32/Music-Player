import 'package:flutter/material.dart';

class Homecontent extends StatefulWidget {
  Homecontent({super.key});

  @override
  State<Homecontent> createState() => _HomecontentState();
}

class _HomecontentState extends State<Homecontent> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      body: Column(
        children: [
          // Fixed Search Bar
          Padding(
            padding: const EdgeInsets.only(
                top: 40.0, left: 16.0, right: 16.0, bottom: 10.0),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[800],
                hintText: 'Search for songs, artists, or playlists',
                hintStyle:
                    theme.textTheme.bodyLarge?.copyWith(color: Colors.white70),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: Icon(Icons.search, color: Colors.white70),
              ),
            ),
          ),

          // Scrollable content
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _createCategoryTile(
                          'Liked Songs',
                          Icons.favorite,
                          color: const Color.fromARGB(106, 255, 64, 128),
                          iconColor: Colors.white,
                          gradient: LinearGradient(colors: [
                            Color.fromARGB(180, 233, 30, 98),
                            const Color.fromARGB(180, 255, 82, 82)
                          ]),
                        ),
                        _createCategoryTile(
                          'Top Hits',
                          Icons.trending_up,
                          color: Colors.orangeAccent,
                          iconColor: Colors.white,
                          gradient: LinearGradient(colors: [
                            const Color.fromARGB(180, 255, 153, 0),
                            const Color.fromARGB(180, 255, 86, 34)
                          ]),
                        ),
                      ],
                    ),
                    SizedBox(height: 22),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _createCategoryTile(
                          'All Out 20\'s',
                          Icons.album,
                          color: Colors.blueAccent,
                          iconColor: Colors.white,
                          gradient: LinearGradient(colors: [
                            const Color.fromARGB(180, 33, 149, 243),
                            const Color.fromARGB(180, 64, 195, 255)
                          ]),
                        ),
                        _createCategoryTile(
                          'Most Played',
                          Icons.bar_chart,
                          color: Colors.greenAccent,
                          iconColor: Colors.white,
                          gradient: LinearGradient(colors: [
                            const Color.fromARGB(180, 76, 175, 79),
                            const Color.fromARGB(180, 178, 255, 89)
                          ]),
                        ),
                      ],
                    ),
                    const SizedBox(height: 50),
                    Text('Popular Songs', style: _sectionTitleStyle()),
                    const SizedBox(height: 10),

                    // Horizontal scrolling list for popular songs
                    SizedBox(
                      height: 165,
                      child: ListView(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        children: [
                          _buildHorizontalTile(
                              'assets/images/ab67616d0000b27352fe6875028c892308ffc2f7.jpeg',
                              'Tum Se Hi',
                              'Mohit Chauhan'),
                          SizedBox(width: 15),
                          _buildHorizontalTile('assets/images/size_l.jpg',
                              'Stay', 'Justin Bieber'),
                          SizedBox(width: 15),
                          _buildHorizontalTile(
                              'assets/images/dil_dhadakne_do.jpg',
                              'Gallan Goodiyan',
                              'Shankar-Ehsaan-Loy'),
                          SizedBox(width: 15),
                          _buildHorizontalTile(
                              'assets/images/One Love Lyrics - Shubh.jpg',
                              'One Love',
                              'Shubh'),
                          SizedBox(width: 15),
                          _buildHorizontalTile('assets/images/sultan.jpg',
                              'Bulleya', 'Vishal-Shekhar, Papon,Irshad Kamil'),
                          SizedBox(width: 15),
                          _buildHorizontalTile(
                              'assets/images/iktaara.jpg',
                              'Iktara',
                              'Amit Trivedi, Kavita Seth, Amitabh Bhattacharya'),
                        ],
                      ),
                    ),

                    // Section: Your Favourite Artists
                    const SizedBox(height: 45),
                    Text('Popular artists', style: _sectionTitleStyle()),
                    const SizedBox(height: 10),

                    SizedBox(
                      height: 180,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        children: [
                          _buildArtistTile(
                              'Arijit Singh', 'assets/images/arijitsingh.webp'),
                          _buildArtistTile(
                              'Atif Aslam', 'assets/images/atif-aslam.jpg'),
                          _buildArtistTile('Shreya Ghoshal',
                              'assets/images/shreyaghosal.jpg'),
                          _buildArtistTile('Rahat Fateh Ali Khan',
                              'assets/images/fatehalikhan.jpg'),
                          _buildArtistTile(
                              'Taylor Swift', 'assets/images/taylor-swift.jpg'),
                          _buildArtistTile('Adele', 'assets/images/Adele1.jpg'),
                        ],
                      ),
                    ),

                    // Section: Popular Albums
                    const SizedBox(height: 20),
                    Text('Popular albums', style: _sectionTitleStyle()),
                    const SizedBox(height: 10),

                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: 300,
                      ),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        children: [
                          _buildAlbumTile(
                              'assets/images/3-idiots.png', '3 Idiots', '7'),
                          _buildAlbumTile(
                              'assets/images/aashiki2.jpg', 'Aashiqui 2', '11'),
                          _buildAlbumTile(
                              'assets/images/YeJavaaniHaiDivani.jpg',
                              'Ye Jawani Hai Diwani',
                              '9'),
                          _buildAlbumTile(
                              'assets/images/ab67616d0000b27352fe6875028c892308ffc2f7.jpeg',
                              'Jab We Met',
                              '9'),
                          _buildAlbumTile(
                              'assets/images/Sairat.jpg', 'Sairat', '4'),
                        ],
                      ),
                    ),
                    SizedBox(height: 100),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to build a category tile (e.g., "Liked Songs")
  Widget _buildCategoryTile(String title, IconData leadingIcon) {
    return Expanded(
      child: Card(
        color: Colors.grey[900],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Icon(
                leadingIcon,
                color: Colors.white,
                size: 24,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper methods for tiles (same as in your original code)
  // _buildHorizontalTile, _buildArtistTile, _buildAlbumTile, and _sectionTitleStyle remain unchanged
}

Widget _createCategoryTile(String title, IconData icon,
    {required Color color,
    required Color iconColor,
    required Gradient gradient}) {
  return Container(
    width: 160,
    padding: EdgeInsets.all(16),
    decoration: BoxDecoration(
      gradient: gradient,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 8,
          offset: Offset(4, 4),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 35,
          color: iconColor,
        ),
        SizedBox(height: 8),
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}

// Helper method to build a horizontal tile for playlists or jump back in section
Widget _buildHorizontalTile(
    String imagePath, String songName, String artistName) {
  return Padding(
    padding: const EdgeInsets.only(right: 12.0),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start
      children: [
        Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SizedBox(
                height: 100,
                width: 100, // Fixed width for the image
                child: Image.asset(imagePath, fit: BoxFit.cover),
              ),
            ),
            Positioned(
              bottom: 8,
              right: 8,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black45,
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(4),
                child:
                    Icon(Icons.play_circle_fill, color: Colors.white, size: 28),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: 100, // Same width as the image
          child: Text(
            songName,
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600, fontSize: 14),
            overflow: TextOverflow.ellipsis, // Show "..." if text exceeds width
            maxLines: 1, // Restrict to one line
          ),
        ),
        const SizedBox(height: 4),
        SizedBox(
          width: 100, // Same width as the image
          child: Text(
            artistName,
            style: const TextStyle(color: Colors.white70, fontSize: 12),
            overflow: TextOverflow.ellipsis, // Show "..." if text exceeds width
            maxLines: 1, // Restrict to one line
          ),
        ),
      ],
    ),
  );
}

// Helper method to build an artist circular tile
Widget _buildArtistTile(String artistName, String imagePath) {
  return Padding(
    padding: const EdgeInsets.only(right: 30.0),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () {
            // Define action on tap
          },
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF222222),
                  Color(0xFF333333)
                ], // Dark gradient to match black background
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.white
                      .withOpacity(0.1), // Subtle highlight for the shadow
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
                BoxShadow(
                  color: Colors.black
                      .withOpacity(0.6), // Soft drop shadow for depth
                  blurRadius: 16,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: CircleAvatar(
              backgroundImage: AssetImage(imagePath),
              radius: 50,
            ),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: 100, // Adjust width to match avatar
          child: Text(
            artistName,
            style: const TextStyle(
              color: Color(0xFFE0E0E0), // Light gray text for contrast on black
              fontWeight: FontWeight.bold,
              fontSize: 14,
              letterSpacing: 0.8,
              shadows: [
                Shadow(
                  color: Colors.black54, // Adds subtle depth to the text
                  offset: Offset(1, 1),
                  blurRadius: 6,
                ),
              ],
            ),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
      ],
    ),
  );
}

// Helper method to build an album tile
Widget _buildAlbumTile(String imagePath, String albumName, String songCount) {
  return Padding(
    padding: const EdgeInsets.only(right: 16.0),
    child: Container(
      width: 160, // Slightly larger to stand out
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF2A2A2A),
            Color(0xFF1A1A1A)
          ], // Dark gradient for depth
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.7), // Darker, subtle shadow
            blurRadius: 10,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: Stack(
              children: [
                Image.asset(
                  imagePath,
                  width: double.infinity,
                  height: 140,
                  fit: BoxFit.cover,
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.black.withOpacity(0.4),
                        Colors.transparent
                      ],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  height: 140, // To apply a soft gradient overlay
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              albumName,
              style: const TextStyle(
                color: Color(0xFFECECEC), // Light gray for contrast on black
                fontWeight: FontWeight.w800,
                fontSize: 14,
                letterSpacing: 0.5,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            '$songCount songs',
            style: const TextStyle(
              color: Color(0xFFB0B0B0), // Soft gray for secondary text
              fontSize: 12,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              // Add play all functionality
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 32),
              backgroundColor:
                  const Color(0xFF00C853), // Modern green color for "Play All"
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(30), // More rounded for modern look
              ),
              shadowColor: Colors.greenAccent
                  .withOpacity(0.3), // Subtle glow around the button
            ),
            child: const Text(
              'Play All',
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
                letterSpacing: 0.5,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    ),
  );
}

// Helper method for section title styling
TextStyle _sectionTitleStyle() {
  return const TextStyle(
      color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold);
}
