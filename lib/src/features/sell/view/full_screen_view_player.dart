

// New Full-screen Video Player Screen
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class FullScreenVideoPlayer extends StatefulWidget {
  final File videoFile;

  const FullScreenVideoPlayer({required this.videoFile});

  @override
  _FullScreenVideoPlayerState createState() => _FullScreenVideoPlayerState();
}

class _FullScreenVideoPlayerState extends State<FullScreenVideoPlayer> {
  late VideoPlayerController _controller;
  bool _isPlaying = true;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.file(widget.videoFile)
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: _controller.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _isPlaying
                                ? _controller.pause()
                                : _controller.play();
                            _isPlaying = !_isPlaying;
                          });
                        },
                        child: VideoPlayer(_controller),
                      ),
                    )
                  : CircularProgressIndicator(),
            ),
            // Positioned(
            //   top: 16,
            //   left: 16,
            //   child: IconButton(
            //     icon: Icon(Icons.arrow_back, color: Colors.white),
            //     onPressed: () => Navigator.pop(context),
            //   ),
            // ),
            if (!_isPlaying)
              Center(
                child: Icon(
                  Icons.play_circle_fill,
                  color: Colors.white,
                  size: 50,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
