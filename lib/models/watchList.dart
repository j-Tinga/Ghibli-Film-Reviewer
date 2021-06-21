final String tableWatchList = 'watchList';

class WatchListFields {
  static final List<String> values = [id, filmID, isWatched];
  static final String id = '_id';
  static final String filmID = 'filmID'; //for getting film data from API
  static final String isWatched =
      'isWatched'; //for knowing whether the user has watched the film in their watchlist (kapoy implement, sa future nlng gamiton)
}

class WatchList {
  final int? id;
  final int filmID;
  final bool isWatched;

  const WatchList({
    this.id,
    required this.isWatched,
    required this.filmID,
  });

  WatchList copy({
    int? id,
    int? filmID,
    bool? isWatched,
  }) =>
      WatchList(
        id: id ?? this.id,
        filmID: filmID ?? this.filmID,
        isWatched: isWatched ?? this.isWatched,
      );

  static WatchList fromJson(Map<String, Object?> json) => WatchList(
        id: json[WatchListFields.id] as int?,
        filmID: json[WatchListFields.filmID] as int,
        isWatched: json[WatchListFields.isWatched] == 1,
      );

  Map<String, Object?> toJson() => {
        WatchListFields.id: id,
        WatchListFields.filmID: filmID,
        WatchListFields.isWatched: isWatched ? 1 : 0,
      };
}
