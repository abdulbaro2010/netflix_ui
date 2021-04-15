import 'package:flutter/material.dart';
import 'package:netflex_ui/models/content_model.dart';
import 'package:video_player/video_player.dart';

class ContentHeader extends StatefulWidget {

final Content featuredContent;

  const ContentHeader({Key key, this.featuredContent}) : super(key: key);

  @override
  _ContentHeaderState createState() => _ContentHeaderState();
}

class _ContentHeaderState extends State<ContentHeader> {

  VideoPlayerController _videoController;
  bool _isMuted = true;

  @override
  void initState() {
    super.initState();
    _videoController =VideoPlayerController.network(widget.featuredContent.videoUrl)
    ..initialize().then((_) => setState((){}))..setVolume(0)..play();
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _videoController.value.isPlaying
      ? _videoController.pause()
      : _videoController.play(),
        child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          AspectRatio(
          aspectRatio: _videoController.value.initialized
          ? _videoController.value.aspectRatio
          : 2.344,
          child: _videoController.value.initialized
          ? VideoPlayer(_videoController)
          : Image.asset(
            widget.featuredContent.imageUrl,
            fit: BoxFit.cover,
          )
          ),

           Positioned(
            left: 0,
            right: 0,
            bottom: -1.0,
          child: AspectRatio(
          aspectRatio: _videoController.value.initialized
          ? _videoController.value.aspectRatio
          : 2.344,
          child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black, Colors.transparent],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
          ),
          ),
           ),

          Positioned(
            left: 60.0,
            right: 60.0,
            bottom: 150.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                width: 250.0,
                child: Image.asset(widget.featuredContent.titleImageUrl),
                ),
                const SizedBox(height: 15.0),
                Text(
                  widget.featuredContent.description,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                    shadows: [
                      Shadow(
                        color: Colors.black,
                        offset: Offset(2.0, 4.0),
                        blurRadius: 6.0,
                      ),
                    ]
                  ),
                ),
          const SizedBox(height: 20.0),
          Row(
            children: [
              _PlayButton(),
              const SizedBox(width: 16.0),
              // ignore: deprecated_member_use
              FlatButton.icon(
              onPressed: () => print('More Info'),
              color:  Colors.white,
              icon: const Icon(Icons.info_outline),
              label: const Text(
                'More Info',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              ),
              if (_videoController.value.initialized)
              IconButton(
              icon: Icon(
                _isMuted ? Icons.volume_off : Icons.volume_up,
              ),
              color: Colors.white,
              iconSize: 30.0,
              onPressed: () => setState((){
                _isMuted
                ? _videoController.setVolume(100)
                : _videoController.setVolume(0);
                _isMuted = _videoController.value.volume == 0;
              }),
              ),
            ],
          ),
              ],
            ),
          ),
        ],
        
      ),
    );
  }
}

class _PlayButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return FlatButton.icon(
      padding: EdgeInsets.fromLTRB(15.0, 5.0, 20.0, 5.0),
      onPressed: () => print('Play'),
      color: Colors.white,
      icon: const Icon(Icons.play_arrow, size: 30.0),
      label: const Text(
      'Play',
      style: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
      ),
      ),
      
    );
  }
}