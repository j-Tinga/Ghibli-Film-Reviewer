final String tableReviews = 'reviews';

class ReviewFields {
  static final List<String> values = [id, filmID, score, title, description];
  static final String id = '_id';
  static final String filmID = 'filmID';
  static final String score = 'score';
  static final String title = 'title';
  static final String description = 'description';
}

class Review {
  final int? id;
  final int filmID;
  final int score;
  final String title;
  final String description;

  const Review({
    this.id,
    required this.score,
    required this.filmID,
    required this.title,
    required this.description,
  });

  Review copy({
    int? id,
    int? filmID,
    int? score,
    String? title,
    String? description,
  }) =>
      Review(
        id: id ?? this.id,
        filmID: filmID ?? this.filmID,
        score: score ?? this.score,
        title: title ?? this.title,
        description: description ?? this.description,
      );

  static Review fromJson(Map<String, Object?> json) => Review(
        id: json[ReviewFields.id] as int?,
        filmID: json[ReviewFields.filmID] as int,
        score: json[ReviewFields.score] as int,
        title: json[ReviewFields.title] as String,
        description: json[ReviewFields.description] as String,
      );

  Map<String, Object?> toJson() => {
        ReviewFields.id: id,
        ReviewFields.filmID: filmID,
        ReviewFields.score: score,
        ReviewFields.title: title,
        ReviewFields.description: description,
      };
}
