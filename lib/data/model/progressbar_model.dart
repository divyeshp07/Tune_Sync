class AudioDurationState {
  final Duration progress;
  final Duration buffered;
  final Duration total;

  AudioDurationState(
      {required this.progress, required this.buffered, required this.total});
}
