final String tableWatchList = 'watchList';

class WatchListFields {
  static final List<String> values = [id, filmIndex, isWatched];
  static final String id = '_id';
  static final String filmIndex = 'filmIndex'; //for getting film data from API
  static final String isWatched =
      'isWatched'; //for knowing whether the user has watched the film in their watchlist (kapoy implement, sa future nlng gamiton)
}

class WatchList {
  final int? id;
  final int filmIndex;
  final bool isWatched;

  const WatchList({
    this.id,
    required this.isWatched,
    required this.filmIndex,
  });

  WatchList copy({
    int? id,
    int? filmIndex,
    bool? isWatched,
  }) =>
      WatchList(
        id: id ?? this.id,
        filmIndex: filmIndex ?? this.filmIndex,
        isWatched: isWatched ?? this.isWatched,
      );

  static WatchList fromJson(Map<String, Object?> json) => WatchList(
        id: json[WatchListFields.id] as int?,
        filmIndex: json[WatchListFields.filmIndex] as int,
        isWatched: json[WatchListFields.isWatched] == 1,
      );

  Map<String, Object?> toJson() => {
        WatchListFields.id: id,
        WatchListFields.filmIndex: filmIndex,
        WatchListFields.isWatched: isWatched ? 1 : 0,
      };
}
