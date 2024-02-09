import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';

class IntroVideo extends StatelessWidget {
  const IntroVideo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 181,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: BetterPlayer.network(
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
        betterPlayerConfiguration:const BetterPlayerConfiguration(
          aspectRatio: 16 / 9,
        ),
      ),
    );
  }
}
