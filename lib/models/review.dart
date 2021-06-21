final String tableReviews = 'reviews';

class ReviewFields {
  static final List<String> values = [id, filmIndex, score, title, description];
  static final String id = '_id';
  static final String filmIndex = 'filmIndex'; //for getting film data from API
  static final String score = 'score';
  static final String title = 'title';
  static final String description = 'description';
}

class Review {
  final int? id;
  final int filmIndex;
  final int score;
  final String title;
  final String description;

  const Review({
    this.id,
    required this.score,
    required this.filmIndex,
    required this.title,
    required this.description,
  });

  Review copy({
    int? id,
    int? filmIndex,
    int? score,
    String? title,
    String? description,
  }) =>
      Review(
        id: id ?? this.id,
        filmIndex: filmIndex ?? this.filmIndex,
        score: score ?? this.score,
        title: title ?? this.title,
        description: description ?? this.description,
      );

  static Review fromJson(Map<String, Object?> json) => Review(
        id: json[ReviewFields.id] as int?,
        filmIndex: json[ReviewFields.filmIndex] as int,
        score: json[ReviewFields.score] as int,
        title: json[ReviewFields.title] as String,
        description: json[ReviewFields.description] as String,
      );

  Map<String, Object?> toJson() => {
        ReviewFields.id: id,
        ReviewFields.filmIndex: filmIndex,
        ReviewFields.score: score,
        ReviewFields.title: title,
        ReviewFields.description: description,
      };
}
