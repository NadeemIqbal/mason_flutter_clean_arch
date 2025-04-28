class DIContainer {
  static final DIContainer _instance = DIContainer._internal();
  factory DIContainer() => _instance;
  DIContainer._internal();

  final Map<Type, dynamic> _dependencies = {};

  void register<T>(T instance) {
    _dependencies[T] = instance;
  }

  T get<T>() {
    return _dependencies[T] as T;
  }
}
