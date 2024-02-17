import 'dart:io';

import 'package:better_player/better_player.dart';
import 'package:engineering_day_app/core/utils/app_colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class IntroVideo extends StatefulWidget {
  const IntroVideo({super.key});

  @override
  State<IntroVideo> createState() => _IntroVideoState();
}

class _IntroVideoState extends State<IntroVideo> {
  late BetterPlayerController _clearKeyControllerFile;


  @override
  void initState() {
    super.initState();
    _saveAssetVideoToFile();
    BetterPlayerConfiguration betterPlayerConfiguration =
    BetterPlayerConfiguration(
        autoDispose: true,
        controlsConfiguration: BetterPlayerControlsConfiguration(
          controlsHideTime: const Duration(seconds: 1),
          playerTheme: BetterPlayerTheme.custom,
          customControlsBuilder:
              (videoController, onPlayerVisibilityChanged) =>
              CustomPlayerControl(controller: videoController),
        ),
        aspectRatio: 16 / 9,
        looping: false,
        autoPlay: false);
    _clearKeyControllerFile = BetterPlayerController(betterPlayerConfiguration);
    _setupDataSources();
    _clearKeyControllerFile.setControlsVisibility(true);
    setState(() {

    });

  }



  void _setupDataSources() async {
    var _clearKeyDataSourceFile = BetterPlayerDataSource(
      BetterPlayerDataSourceType.file,
      await Utils.getFileUrl("video.mp4"),
    );

    _clearKeyControllerFile.setupDataSource(_clearKeyDataSourceFile);





  }




  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: AspectRatio(

          aspectRatio: 16 / 9,
          child: BetterPlayer(controller: _clearKeyControllerFile),
        ),
      ),
    );
  }
}

class VideoScrubber extends StatefulWidget {
  const VideoScrubber({
    required this.playerValue,
    required this.controller,
    super.key,
  });
  final VideoPlayerValue playerValue;
  final BetterPlayerController controller;
  @override
  VideoScrubberState createState() => VideoScrubberState();
}

class VideoScrubberState extends State<VideoScrubber> {
  double _value = 0.0;

  @override
  void initState() {
    _value = 0;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant VideoScrubber oldWidget) {
    super.didUpdateWidget(oldWidget);
    int position = oldWidget.playerValue.position.inSeconds;
    int duration = oldWidget.playerValue.duration?.inSeconds ?? 0;
    setState(() {
      _value = position / duration;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
          thumbShape: CustomThumbShape(), // Custom thumb shape
          overlayShape: SliderComponentShape.noOverlay),
      child:
      // Text("_value ${_value}");
      _value.toString() == "NaN"
          ? SizedBox()
          : Slider(
        value: _value,
        inactiveColor: Colors.grey,
        min: 0.0,
        max: 1.0,
        onChanged: (newValue) {
          setState(() {
            _value = newValue;
          });
          final newProgress = Duration(
              milliseconds: ((_value) *
                  widget.controller.videoPlayerController!.value
                      .duration!.inMilliseconds)
                  .toInt());
          widget.controller.seekTo(newProgress);
        },
      ),
    );
  }
}

class CustomPlayerControl extends StatelessWidget {
  const CustomPlayerControl({required this.controller, super.key});

  final BetterPlayerController controller;

  void _onTap() {
    controller.setControlsVisibility(true);
    if (controller.isPlaying()!) {
      controller.pause();
    } else {
      controller.play();
    }
  }

  void _controlVisibility() {
    controller.setControlsVisibility(true);
    Future.delayed(const Duration(seconds: 3))
        .then((value) => {
      if(controller.isPlaying()==true){
        controller.setControlsVisibility(false)
      }else{
        controller.setControlsVisibility(true)

      }
    });
  }

  String _formatDuration(Duration? duration) {
    if (duration != null) {
      String minutes = duration.inMinutes.toString().padLeft(2, '0');
      String seconds = (duration.inSeconds % 60).toString().padLeft(2, '0');
      return '$minutes:$seconds';
    } else {
      return '00:00';
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _controlVisibility,
      child: StreamBuilder(
        initialData: true,
        stream: controller.controlsVisibilityStream,
        builder: (context, snapshot) {
          return Stack(
            children: [
              Visibility(
                visible: snapshot.data!,
                child: Positioned(
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),

                          border: Border.all(color: AppColors.whiteColor)
                      ),
                      child: FloatingActionButton(
                        shape:RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100)
                        ),
                        onPressed: _onTap,
                        backgroundColor: Colors.black.withOpacity(0.7),
                        child: controller.isPlaying()!
                            ? const Icon(
                          Icons.pause,
                          color: Colors.white,
                          size: 40,
                        )
                            : const Icon(
                          Icons.play_arrow_rounded,
                          color: Colors.white,
                          size: 50,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 10,
                right: 10,
                bottom: 8,
                child: ValueListenableBuilder(
                  valueListenable: controller.videoPlayerController!,
                  builder: (context, value, child) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 36,
                              width: 100,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                shape: BoxShape.rectangle,
                                color: Colors.black.withOpacity(0.5),
                              ),
                              child: Text(
                                '${_formatDuration(value.position)}/${_formatDuration(value.duration)}',
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                            IconButton(
                              onPressed: () async {
                                controller.toggleFullScreen();
                              },
                              icon: const Icon(
                                Icons.crop_free_rounded,
                                size: 22,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                        // value >= min && value <= max
                        VideoScrubber(
                          controller: controller,
                          playerValue: value,
                        )
                      ],
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class CustomThumbShape extends SliderComponentShape {
  final double thumbRadius = 6.0;

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(
      PaintingContext context,
      Offset center, {
        required Animation<double> activationAnimation,
        required Animation<double> enableAnimation,
        required bool isDiscrete,
        required TextPainter labelPainter,
        required RenderBox parentBox,
        required SliderThemeData sliderTheme,
        required TextDirection textDirection,
        required double value,
        required double textScaleFactor,
        required Size sizeWithOverflow,
      }) {
    final canvas = context.canvas;
    final fillPaint = Paint()
      ..color = sliderTheme.thumbColor!
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, thumbRadius, fillPaint);
  }
}
class Utils {
  static Future<String> getFileUrl(String fileName) async {
    final directory = await getApplicationDocumentsDirectory();
    return "${directory.path}/$fileName";
  }
}

Future _saveAssetVideoToFile() async {
  var content = await rootBundle.load("assets/video.mp4");
  final directory = await getApplicationDocumentsDirectory();
  var file = File("${directory.path}/video.mp4");
  file.writeAsBytesSync(content.buffer.asUint8List());
}