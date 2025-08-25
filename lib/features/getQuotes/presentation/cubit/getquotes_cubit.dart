import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes_app/features/getQuotes/data/datasources/datasources.dart';
import 'package:quotes_app/features/getQuotes/data/repositories/repo_impl.dart';
import 'package:quotes_app/features/getQuotes/domain/entities/eintites.dart';
import 'package:quotes_app/features/getQuotes/domain/usecases/usecases.dart';
part 'getquotes_state.dart';

class GetquotesCubit extends Cubit<GetquotesState> {
  GetquotesCubit() : super(GetquotesInitial());

  Future<void> getdate() async {
    emit(GetquotesLoading());
    final datasources = DataSources();
    final repo = RepoImpl(dataSources: datasources);
    final usecases = QuotesUsecases(repo);
    var response = await usecases.call();
    response.fold(
      (failure) => emit(GetquotesError(message: failure.toString())),
      (quote) => emit(GetquotesLoaded(quote: quote)),
    );
  }
}
