class TitleModel {
  final String thumbnailUrl;
  final String title;
  final String certificate;
  final String genre;
  final String director;
  final String runTime;
  final int year;
  final double rating;

  TitleModel({
    required this.title,
    required this.director,
    required this.year,
    required this.rating,
    required this.genre,
    required this.certificate,
    required this.runTime,
    required this.thumbnailUrl,
  });
}
