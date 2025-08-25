import 'package:dartz/dartz.dart';
import 'package:quotes_app/features/getQuotes/data/models/qoute_model.dart';

abstract class Repo {
  Future<Either<String, QuoteModel>> getQuote();
}
