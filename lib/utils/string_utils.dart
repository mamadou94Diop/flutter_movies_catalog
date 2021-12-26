String formatDuration(String duration){
  String formattedDuration = duration.replaceFirst("PT", "").replaceFirst("M", "");
  int durationInInt = int.parse(formattedDuration);
  int hours = durationInInt~/60;
  int minutes = durationInInt % 60;
  if (hours > 0) {
    return "${hours}h${minutes}";
  } else{
    return "${minutes}";
  }
}