abstract class IStorage {
  Future<void> write({required String key, required dynamic value});

  Future<T?> read<T>(String key);

  Future<void> writeObject<T>({
    required String key,
    required value,
    Map<String, dynamic> Function(T v)? encoder,
  });

  Future<T?> readObject<T>(String key, {T Function(String v)? decoder});
}
