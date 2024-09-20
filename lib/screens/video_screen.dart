import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  final void Function() startQuiz;
  final bool isSecondVideo; // Flag to switch between the first and second video

  const VideoScreen(
      {super.key, required this.startQuiz, required this.isSecondVideo});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late VideoPlayerController _controller;
  bool showTips = true;
  bool isMuted = false;

  @override
  void initState() {
    super.initState();

    // Initialize the correct video
    _controller = widget.isSecondVideo
        ? VideoPlayerController.asset('assets/videos/s2.mp4')
        : VideoPlayerController.asset('assets/videos/s1.mp4');

    _controller.initialize().then((_) {
      setState(() {});
      _controller.play();
    });

    // Hide tips after 15 seconds
    Future.delayed(const Duration(seconds: 15), () {
      setState(() {
        showTips = false;
      });
    });

    // Listen for video completion
    _controller.addListener(() {
      if (_controller.value.position == _controller.value.duration) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _togglePlayPause() {
    setState(() {
      _controller.value.isPlaying ? _controller.pause() : _controller.play();
    });
  }

  void _toggleMuteUnmute() {
    setState(() {
      isMuted = !isMuted;
      _controller.setVolume(isMuted ? 0 : 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Listen to the video and answer the quiz',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20),
          if (_controller.value.isInitialized)
            AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            )
          else
            Column(
              children: const [
                CircularProgressIndicator(
                  color: Color(0xFF002366),
                ),
                SizedBox(height: 20),
              ],
            ),
          const SizedBox(height: 20),
          if (_controller.value.isInitialized)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(
                    _controller.value.isPlaying
                        ? Icons.pause
                        : Icons.play_arrow,
                    color: Colors.white,
                  ),
                  onPressed: _togglePlayPause,
                ),
                IconButton(
                  icon: Icon(
                    isMuted ? Icons.volume_off : Icons.volume_up,
                    color: Colors.white,
                  ),
                  onPressed: _toggleMuteUnmute,
                ),
              ],
            ),
          const SizedBox(height: 20),
          if (_controller.value.position == _controller.value.duration)
            OutlinedButton.icon(
              onPressed: widget.startQuiz,
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              label: const Text('Start Quiz'),
              icon: const Icon(Icons.quiz),
            ),
        ],
      ),
    );
  }
}
