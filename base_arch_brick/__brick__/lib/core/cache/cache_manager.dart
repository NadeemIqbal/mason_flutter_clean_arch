abstract class CacheManager {
  Future<void> save(String key, dynamic value);
  Future<dynamic> get(String key);
  Future<void> delete(String key);
  Future<void> clear();
}
