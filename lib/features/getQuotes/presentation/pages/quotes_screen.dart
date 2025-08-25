import 'package:flutter/material.dart';
import 'package:quotes_app/features/getQuotes/data/datasources/datasources.dart';
import 'package:quotes_app/features/getQuotes/data/repositories/repo_impl.dart';
import 'package:quotes_app/features/getQuotes/domain/usecases/usecases.dart';

class QuoteScreen extends StatelessWidget {
  const QuoteScreen({super.key});

  Future<String> getQuoteText() async {
    final datasources = DataSources();
    final repo = RepoImpl(dataSources: datasources);
    final usecases = QuotesUsecases(repo);

    final response = await usecases.call();

    // convert Either -> String عشان نعرضه
    return response.fold(
      (failure) => "❌ Error: $failure",
      (quote) => "📜 ${quote.content}\n— added on ${quote.dataAdded}",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Random Quote")),
      body: Center(
        child: FutureBuilder<String>(
          future: getQuoteText(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator(); // loading
            } else if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            } else if (!snapshot.hasData) {
              return const Text("No quote found");
            }
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                snapshot.data!,
                style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
            );
          },
        ),
      ),
    );
  }
}
