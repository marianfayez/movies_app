abstract class HistoryRemoteDs {
  Future<void> addToHistory(String userId, int movieId);

  Future<List<int>> getHistory(String userId);
}
