import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final watchlistProvider = StateNotifierProvider<WatchlistNotifier, List<int>>(
  (ref) => WatchlistNotifier(),
);

class WatchlistNotifier extends StateNotifier<List<int>> {
  WatchlistNotifier() : super([]) {
    _loadWatchlist();
  }

  void _loadWatchlist() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    state = prefs.getStringList('watchlist')?.map((id) => int.parse(id)).toList() ?? [];
  }

  void toggleWatchlist(int movieId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (state.contains(movieId)) {
      state = state.where((id) => id != movieId).toList();
    } else {
      state = [...state, movieId];
    }
    prefs.setStringList('watchlist', state.map((id) => id.toString()).toList());
  }

  bool isFavourite(int movieId) {
    return state.contains(movieId);
  }
}
