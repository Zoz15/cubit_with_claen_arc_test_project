import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:quotes_app/features/getQuotes/data/models/qoute_model.dart';

class DataSources {
  Future<Either<String, QuoteModel>> getfromapi() async {
    final String baseUrl = "https://api.quotable.io/random";

    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return Right(QuoteModel.fromJson(data));
    } else {
      return Left('error win get data');
    }
  }

  // Future<Quote> getfromcash() {}
}
