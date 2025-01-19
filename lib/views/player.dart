import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_screens/consts/colors.dart';
import 'package:flutter_login_screens/consts/text_style.dart';
import 'package:flutter_login_screens/controllers/player_controller.dart';
import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';

class Player extends StatelessWidget {
  final List<SongModel> data;
  const Player({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<PlayerController>();

    return Scaffold(
      body: Stack(
        children: [
          // Background Image with Blur Effect (using a GIF)
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/images/tumblr_nrlec0774m1uzwbyjo1_500.gif'),
                  fit: BoxFit.cover,
                ),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(color: Colors.black.withOpacity(0.5)),
              ),
            ),
          ),
          // Main Content
          Column(
            children: [
              // Custom AppBar with modern icons
              Padding(
                padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.settings, color: whiteColor),
                      onPressed: () {
                        // Settings action
                      },
                    ),
                    Text(
                      'Now Playing',
                      style: ourStyle(
                        color: whiteColor,
                        family: bold,
                        size: 20,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.favorite_border, color: whiteColor),
                      onPressed: () {
                        // Favorite action
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Album Art with Glow Effect
              Expanded(
                child: Center(
                  child: Container(
                    height: 280,
                    width: 280,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 130, 115, 133)
                              .withOpacity(0.4),
                          blurRadius: 30,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: Obx(
                        () => QueryArtworkWidget(
                          id: data[controller.playIndex.value].id,
                          type: ArtworkType.AUDIO,
                          artworkHeight: double.infinity,
                          artworkWidth: double.infinity,
                          nullArtworkWidget: Icon(
                            Icons.music_note,
                            size: 64,
                            color: whiteColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Floating Song Info and Playback Controls
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(30),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        // Song Info
                        Obx(
                          () => Text(
                            data[controller.playIndex.value].displayNameWOExt,
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: ourStyle(
                              color: whiteColor,
                              family: bold,
                              size: 22,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Obx(
                          () => Text(
                            data[controller.playIndex.value].artist ??
                                'Unknown Artist',
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: ourStyle(
                              color: whiteColor.withOpacity(0.7),
                              family: regular,
                              size: 16,
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        // Playback Slider
                        Obx(
                          () => Row(
                            children: [
                              Text(
                                controller.position.value,
                                style: ourStyle(
                                    color: whiteColor.withOpacity(0.7)),
                              ),
                              Expanded(
                                child: TweenAnimationBuilder<double>(
                                  tween: Tween<double>(
                                      begin: controller.value.value,
                                      end: controller.value.value),
                                  duration: Duration(
                                      milliseconds: 100), // Faster animation
                                  builder: (context, value, child) {
                                    return Slider(
                                      min: 0,
                                      max: controller.max.value,
                                      value: value,
                                      onChanged: (newValue) {
                                        controller.changeDurationToSeconds(
                                            newValue.toInt());
                                      },
                                      activeColor: sliderColor,
                                      inactiveColor:
                                          whiteColor.withOpacity(0.3),
                                      thumbColor: sliderColor,
                                    );
                                  },
                                ),
                              ),
                              Text(
                                controller.duration.value,
                                style: ourStyle(
                                    color: whiteColor.withOpacity(0.7)),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 30),
                        // Playback Controls with original functionality
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(
                              onPressed: () {
                                // Play previous song
                                if (controller.playIndex.value > 0) {
                                  controller.playIndex.value--;
                                  controller.playSong(
                                      data[controller.playIndex.value].uri,
                                      controller.playIndex.value);
                                }
                              },
                              icon: Icon(
                                Icons.skip_previous_rounded,
                                size: 42,
                                color: whiteColor,
                              ),
                            ),
                            Obx(
                              () => GestureDetector(
                                onTap: () {
                                  if (controller.isPlaying.value) {
                                    controller.audioPlayer.pause();
                                    controller.isPlaying(false);
                                  } else {
                                    controller.audioPlayer.play();
                                    controller.isPlaying(true);
                                  }
                                },
                                child: CircleAvatar(
                                  radius: 35,
                                  backgroundColor: sliderColor,
                                  child: Icon(
                                    controller.isPlaying.value
                                        ? Icons.pause
                                        : Icons.play_arrow_rounded,
                                    size: 40,
                                    color: whiteColor,
                                  ),
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                // Play next song
                                if (controller.playIndex.value <
                                    data.length - 1) {
                                  controller.playIndex.value++;
                                  controller.playSong(
                                      data[controller.playIndex.value].uri,
                                      controller.playIndex.value);
                                }
                              },
                              icon: Icon(
                                Icons.skip_next_rounded,
                                size: 42,
                                color: whiteColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
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
