import 'package:quotes_app/features/getQuotes/domain/entities/eintites.dart';

class QuoteModel extends QuoteEntity {
  final String id;
  final String author;
  final List<String> tags;
  final String authorSlug;
  final int length;
  final String dateModified;

  QuoteModel({
    required String dataAdded,
    required String content,
    required this.id,
    required this.author,
    required this.tags,
    required this.authorSlug,
    required this.length,
    required this.dateModified,
  }) : super(
          dataAdded: dataAdded,
          content: content,
        );

  factory QuoteModel.fromJson(Map<String, dynamic> json) {
    return QuoteModel(
      id: json['_id'] ?? '',
      content: json['content'] ?? '',
      author: json['author'] ?? '',
      dataAdded: json['dateAdded'] ?? '',
      length: json['length'] ?? 0,
      dateModified: json['dateModified'] ?? '',
      tags: List<String>.from(json['tags'] ?? []),
      authorSlug: json['authorSlug'] ?? '',
    );
  }
}
