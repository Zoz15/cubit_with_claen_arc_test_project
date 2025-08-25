import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes_app/features/getQuotes/data/datasources/datasources.dart';
import 'package:quotes_app/features/getQuotes/data/repositories/repo_impl.dart';
import 'package:quotes_app/features/getQuotes/domain/usecases/usecases.dart';
import 'package:quotes_app/features/getQuotes/presentation/cubit/getquotes_cubit.dart';

class QuoteScreen extends StatelessWidget {
  const QuoteScreen({super.key});

  // Future<String> getQuoteText() async {
  //   final datasources = DataSources();
  //   final repo = RepoImpl(dataSources: datasources);
  //   final usecases = QuotesUsecases(repo);

  //   final response = await usecases.call();

  //   // convert Either -> String عشان نعرضه
  //   return response.fold(
  //     (failure) => "❌ Error: $failure",
  //     (quote) => "📜 ${quote.content}\n— added on ${quote.dataAdded}",
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Random Quote")),
      body: Center(
        child: BlocProvider(
          create: (context) => GetquotesCubit(),
          child: BlocBuilder<GetquotesCubit, GetquotesState>(
            // future: getQuoteText(),
            builder: (context, state) {
              if (state is GetquotesLoading) {
                return const CircularProgressIndicator(); // loading
              } else if (state is GetquotesError) {
                return Text("❌ Error: ${state.message}");
              } else if (state is GetquotesInitial) {
                return ElevatedButton(
                  onPressed: () {
                    context.read<GetquotesCubit>().getdate();
                  },
                  child: Text('Get random quote'),
                );
              } else if (state is GetquotesLoaded) {
                return Text(
                  '📜 ${state.quote.content}\n— added on ${state.quote.dataAdded}"',
                );
              } else {
                return Text('error');
              }
            },
          ),
        ),
      ),
    );
  }
}
