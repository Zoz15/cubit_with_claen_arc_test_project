import 'package:dartz/dartz.dart';
import 'package:quotes_app/features/getQuotes/domain/entities/eintites.dart';
import 'package:quotes_app/features/getQuotes/domain/repositories/repo.dart';

class QuotesUsecases {
  final Repo repo;

  QuotesUsecases(this.repo); // 👈 لازم constructor عشان تدي repo

  Future<Either<String, QuoteEntity>> call() async {
    return await repo.getQuote();
  }
}
