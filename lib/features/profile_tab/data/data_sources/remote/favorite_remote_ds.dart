

abstract class FavoriteRemoteDs {
  Future<List<int>> getFavorite(String userId);
  Future<void> toggleFavorite(String userId, int movieId, bool isFavorite);

}
