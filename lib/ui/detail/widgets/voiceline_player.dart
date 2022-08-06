import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class VoicelinePlayer extends StatefulWidget {
  const VoicelinePlayer({Key? key, this.voiceLine = ''}) : super(key: key);
  final String voiceLine;

  @override
  State<VoicelinePlayer> createState() => _VoicelinePlayerState();
}

class _VoicelinePlayerState extends State<VoicelinePlayer> {
  final player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    final String voiceLine = widget.voiceLine;
    player.setSourceUrl(voiceLine);
    player.resume();
  }

  @override
  void dispose() {
    player.release();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
