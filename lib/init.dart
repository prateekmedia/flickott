import 'package:flickott/models/title_model.dart';
import 'package:flickott/src/utils/csv_data_fetcher.dart';

Future<List<TitleModel>> init() async {
  final titles = await CsvDataFetcher.fetchTitleDataFromCsv();
  return titles;
}
