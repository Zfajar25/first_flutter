import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PlayVideo extends StatefulWidget {
  const PlayVideo({Key? key}) : super(key: key);

  @override
  _PlayVideoState createState() => _PlayVideoState();
}

class _PlayVideoState extends State<PlayVideo> {
  final videoAsset = 'web/videos/menkrep.mp4';
  late VideoPlayerController _videocontroller;

  @override
  void initState() {
    super.initState();
    _videocontroller = VideoPlayerController.asset(videoAsset)
      ..addListener(() => setState(() {}))
      ..setLooping(true)
      ..initialize().then((value) => _videocontroller.play());
  }

  @override
  void dispose() {
    _videocontroller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMuted = _videocontroller.value.volume == 0;
    return Scaffold(
        backgroundColor: Colors.blue[200],
        appBar: AppBar(
          title: Text('This is the video Player'),
          backgroundColor: Colors.blue,
          centerTitle: true,
          elevation: 0,
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          if (_videocontroller != null && _videocontroller.value.isInitialized)
            Stack(children: [
              Container(
                  alignment: Alignment.topCenter,
                  child: AspectRatio(
                    aspectRatio: _videocontroller.value.aspectRatio,
                    child: VideoPlayer(_videocontroller),
                  )),
              Positioned.fill(
                  child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () => _videocontroller.value.isPlaying
                    ? _videocontroller.pause()
                    : _videocontroller.play(),
                child: Stack(
                  children: [
                    Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: VideoProgressIndicator(
                          _videocontroller,
                          allowScrubbing: true,
                        )),
                    if (_videocontroller.value.isPlaying)
                      Container()
                    else
                      Container(
                        alignment: Alignment.center,
                        color: Colors.black26,
                        child: Icon(
                          Icons.play_arrow,
                          size: 80,
                          color: Colors.white,
                        ),
                      )
                  ],
                ),
              ))
            ])
          else
            Container(
                height: 100,
                child: Center(
                  child: CircularProgressIndicator(),
                )),
          SizedBox(
            height: 50,
          ),
          if (_videocontroller != null && _videocontroller.value.isInitialized)
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.blue,
              child: IconButton(
                icon: Icon(isMuted ? Icons.volume_mute : Icons.volume_up),
                onPressed: () => _videocontroller.setVolume(isMuted ? 1 : 0),
              ),
            )
        ]));
  }
}
