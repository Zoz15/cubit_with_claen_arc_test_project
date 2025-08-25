import 'package:dartz/dartz.dart';
import 'package:quotes_app/features/getQuotes/data/datasources/datasources.dart';
import 'package:quotes_app/features/getQuotes/data/models/qoute_model.dart';
import 'package:quotes_app/features/getQuotes/domain/repositories/repo.dart';

class RepoImpl extends Repo {
  final DataSources dataSources;
  RepoImpl({required this.dataSources});
  @override
  Future<Either<String, QuoteModel>> getQuote() async {
    var respon = await dataSources.getfromapi();
    return respon;
  }
}
