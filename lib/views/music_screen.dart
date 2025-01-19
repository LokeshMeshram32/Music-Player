import 'package:flutter/material.dart';
import 'package:flutter_login_screens/controllers/player_controller.dart';
import 'package:flutter_login_screens/views/player.dart';
import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';

class MusicScreen extends StatefulWidget {
  const MusicScreen({super.key});

  @override
  _MusicScreenState createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  var controller = Get.put(PlayerController());
  final TextEditingController searchController = TextEditingController();
  List<SongModel> allSongs = [];
  List<SongModel> filteredSongs = [];
  bool isSearching = false;
  bool isLoading = true; // Added loading flag

  @override
  void initState() {
    super.initState();
    fetchSongs();
  }

  void fetchSongs() async {
    setState(() {
      isLoading = true; // Start loading
    });

    List<SongModel> songs = await controller.audioQuery.querySongs(
      ignoreCase: true,
      orderType: OrderType.ASC_OR_SMALLER,
      sortType: null,
      uriType: UriType.EXTERNAL,
    );

    setState(() {
      allSongs = songs;
      filteredSongs = songs;
      isLoading = false; // Loading finished
    });
  }

  void filterSongs(String query) {
    List<SongModel> results = [];
    if (query.isEmpty) {
      results = allSongs;
    } else {
      results = allSongs
          .where((song) =>
              song.displayName.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }

    setState(() {
      filteredSongs = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/images/8ojC2g.jpg'), // Change to your image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Overlay with a dark color for better text visibility
          Container(
            color: Colors.black54, // Adjust opacity as needed
          ),
          // Main content
          Column(
            children: [
              AppBar(
                backgroundColor: Colors.transparent, // Make AppBar transparent
                leading: const Icon(
                  Icons.sort_rounded,
                  color: Colors.white,
                ),
                title: isSearching
                    ? TextField(
                        controller: searchController,
                        autofocus: true,
                        decoration: const InputDecoration(
                          hintText: "Search songs...",
                          hintStyle: TextStyle(color: Colors.white70),
                          border: InputBorder.none,
                        ),
                        style: const TextStyle(color: Colors.white),
                        onChanged: (value) {
                          filterSongs(value);
                        },
                      )
                    : const Text(
                        "Saved Musics",
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: IconButton(
                      icon: Icon(
                        isSearching ? Icons.close : Icons.search,
                        color: Colors.white,
                        size: 35,
                      ),
                      onPressed: () {
                        setState(() {
                          if (isSearching) {
                            searchController.clear();
                            filterSongs('');
                          }
                          isSearching = !isSearching;
                        });
                      },
                    ),
                  ),
                ],
                elevation: 4,
              ),
              Expanded(
                child: isLoading
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white, // Loading animation
                        ),
                      )
                    : filteredSongs.isEmpty
                        ? const Center(
                            child: Text(
                              "No song found",
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              itemCount: filteredSongs.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  margin: const EdgeInsets.only(bottom: 4),
                                  child: Obx(
                                    () => ListTile(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      tileColor: Color.fromARGB(0, 24, 24, 24),
                                      title: Text(
                                        filteredSongs[index].displayName,
                                        style: const TextStyle(
                                            color: Color.fromARGB(
                                                255, 255, 255, 255),
                                            fontWeight: FontWeight.w600),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      subtitle: Text(
                                        filteredSongs[index].artist ??
                                            'Unknown Artist',
                                        style: const TextStyle(
                                            color: Color.fromARGB(
                                                255, 203, 203, 203)),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      leading: QueryArtworkWidget(
                                        id: filteredSongs[index].id,
                                        type: ArtworkType.AUDIO,
                                        nullArtworkWidget: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 7, right: 3),
                                          child: const Icon(
                                            Icons.music_note,
                                            color: Colors.white,
                                            size: 40,
                                          ),
                                        ),
                                      ),
                                      trailing: controller.playIndex == index
                                          ? const Icon(Icons.pause_circle,
                                              color: Colors.white, size: 26)
                                          : const Icon(Icons.play_circle,
                                              color: Colors.white, size: 26),
                                      onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) => Player(
                                              data: filteredSongs,
                                            ),
                                          ),
                                        );
                                        controller.playSong(
                                            filteredSongs[index].uri, index);
                                      },
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
