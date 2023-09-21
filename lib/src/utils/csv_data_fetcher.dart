import 'package:flickott/models/title_model.dart';
// import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:csv/csv.dart';

class CsvDataFetcher {
  static Future<List<TitleModel>> fetchTitleDataFromCsv() async {
    final String csvString =
        await rootBundle.loadString('assets/imdb_top_1000.csv');
    final List<List<dynamic>> csvTable =
        const CsvToListConverter().convert(csvString);

    final List<TitleModel> titles = [];

    for (final row in csvTable) {
      final thumbnailURL = row[0];
      final title = row[1];
      final director = row[9];
      final year = int.tryParse(row[2]?.toString() ?? '') ?? 0;
      final rating = double.tryParse(row[6]?.toString() ?? '') ?? 0.0;
      final runtime = row[4];
      final genre = row[5];
      final certificate = row[3];

      final movie = TitleModel(
        title: title.toString(),
        director: director,
        year: year,
        rating: rating,
        thumbnailUrl: thumbnailURL,
        runTime: runtime,
        genre: genre,
        certificate: certificate.toString(),
      );

      titles.add(movie);
    }

    return titles;
  }
}
