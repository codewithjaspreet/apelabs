import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';

class Homecontroller extends GetxController {
  final AudioPlayer audioPlayer = AudioPlayer();
  var isLoading = true.obs;
  var isEqEnabled = true.obs;
  var playerSessionId = 0.obs;

  @override
  void onInit() {
    super.onInit();
    playSampleSong();
  }

  void playSampleSong() async {
    const sampleSongUrl = 'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3';

    try {
      await audioPlayer.setUrl(sampleSongUrl);
      await audioPlayer.play();
      playerSessionId.value = audioPlayer.androidAudioSessionId!;
      isLoading.value = false;
    } catch (e) {
      print('Error loading sample song: $e');
      isLoading.value = false;
    }
  }

  void setEqEnabled(bool enabled) {
    isEqEnabled.value = enabled;
  }
}
