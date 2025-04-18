// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'firestore_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$firestoreRepositoryHash() =>
    r'95c1c445734f56d18e7408d875baf5988563dc72';

/// See also [firestoreRepository].
@ProviderFor(firestoreRepository)
final firestoreRepositoryProvider = Provider<FirestoreRepository>.internal(
  firestoreRepository,
  name: r'firestoreRepositoryProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$firestoreRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FirestoreRepositoryRef = ProviderRef<FirestoreRepository>;
String _$loadTasksHash() => r'af65463b6ac29fc496ede80f7002fba371dc1f67';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [loadTasks].
@ProviderFor(loadTasks)
const loadTasksProvider = LoadTasksFamily();

/// See also [loadTasks].
class LoadTasksFamily extends Family<AsyncValue<List<Task>>> {
  /// See also [loadTasks].
  const LoadTasksFamily();

  /// See also [loadTasks].
  LoadTasksProvider call(String userId) {
    return LoadTasksProvider(userId);
  }

  @override
  LoadTasksProvider getProviderOverride(covariant LoadTasksProvider provider) {
    return call(provider.userId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'loadTasksProvider';
}

/// See also [loadTasks].
class LoadTasksProvider extends AutoDisposeStreamProvider<List<Task>> {
  /// See also [loadTasks].
  LoadTasksProvider(String userId)
    : this._internal(
        (ref) => loadTasks(ref as LoadTasksRef, userId),
        from: loadTasksProvider,
        name: r'loadTasksProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$loadTasksHash,
        dependencies: LoadTasksFamily._dependencies,
        allTransitiveDependencies: LoadTasksFamily._allTransitiveDependencies,
        userId: userId,
      );

  LoadTasksProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
  }) : super.internal();

  final String userId;

  @override
  Override overrideWith(
    Stream<List<Task>> Function(LoadTasksRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LoadTasksProvider._internal(
        (ref) => create(ref as LoadTasksRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<List<Task>> createElement() {
    return _LoadTasksProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LoadTasksProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin LoadTasksRef on AutoDisposeStreamProviderRef<List<Task>> {
  /// The parameter `userId` of this provider.
  String get userId;
}

class _LoadTasksProviderElement
    extends AutoDisposeStreamProviderElement<List<Task>>
    with LoadTasksRef {
  _LoadTasksProviderElement(super.provider);

  @override
  String get userId => (origin as LoadTasksProvider).userId;
}

String _$loadCompleteTasksHash() => r'6a60b918eae3ff9c83bdb346fde236710cafb6d9';

/// See also [loadCompleteTasks].
@ProviderFor(loadCompleteTasks)
const loadCompleteTasksProvider = LoadCompleteTasksFamily();

/// See also [loadCompleteTasks].
class LoadCompleteTasksFamily extends Family<AsyncValue<List<Task>>> {
  /// See also [loadCompleteTasks].
  const LoadCompleteTasksFamily();

  /// See also [loadCompleteTasks].
  LoadCompleteTasksProvider call(String userId) {
    return LoadCompleteTasksProvider(userId);
  }

  @override
  LoadCompleteTasksProvider getProviderOverride(
    covariant LoadCompleteTasksProvider provider,
  ) {
    return call(provider.userId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'loadCompleteTasksProvider';
}

/// See also [loadCompleteTasks].
class LoadCompleteTasksProvider extends AutoDisposeStreamProvider<List<Task>> {
  /// See also [loadCompleteTasks].
  LoadCompleteTasksProvider(String userId)
    : this._internal(
        (ref) => loadCompleteTasks(ref as LoadCompleteTasksRef, userId),
        from: loadCompleteTasksProvider,
        name: r'loadCompleteTasksProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$loadCompleteTasksHash,
        dependencies: LoadCompleteTasksFamily._dependencies,
        allTransitiveDependencies:
            LoadCompleteTasksFamily._allTransitiveDependencies,
        userId: userId,
      );

  LoadCompleteTasksProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
  }) : super.internal();

  final String userId;

  @override
  Override overrideWith(
    Stream<List<Task>> Function(LoadCompleteTasksRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LoadCompleteTasksProvider._internal(
        (ref) => create(ref as LoadCompleteTasksRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<List<Task>> createElement() {
    return _LoadCompleteTasksProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LoadCompleteTasksProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin LoadCompleteTasksRef on AutoDisposeStreamProviderRef<List<Task>> {
  /// The parameter `userId` of this provider.
  String get userId;
}

class _LoadCompleteTasksProviderElement
    extends AutoDisposeStreamProviderElement<List<Task>>
    with LoadCompleteTasksRef {
  _LoadCompleteTasksProviderElement(super.provider);

  @override
  String get userId => (origin as LoadCompleteTasksProvider).userId;
}

String _$loadInCompleteTasksHash() =>
    r'55cd8fa2f072ec9f7ba0ffd777c53508e9d88ea2';

/// See also [loadInCompleteTasks].
@ProviderFor(loadInCompleteTasks)
const loadInCompleteTasksProvider = LoadInCompleteTasksFamily();

/// See also [loadInCompleteTasks].
class LoadInCompleteTasksFamily extends Family<AsyncValue<List<Task>>> {
  /// See also [loadInCompleteTasks].
  const LoadInCompleteTasksFamily();

  /// See also [loadInCompleteTasks].
  LoadInCompleteTasksProvider call(String userId) {
    return LoadInCompleteTasksProvider(userId);
  }

  @override
  LoadInCompleteTasksProvider getProviderOverride(
    covariant LoadInCompleteTasksProvider provider,
  ) {
    return call(provider.userId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'loadInCompleteTasksProvider';
}

/// See also [loadInCompleteTasks].
class LoadInCompleteTasksProvider
    extends AutoDisposeStreamProvider<List<Task>> {
  /// See also [loadInCompleteTasks].
  LoadInCompleteTasksProvider(String userId)
    : this._internal(
        (ref) => loadInCompleteTasks(ref as LoadInCompleteTasksRef, userId),
        from: loadInCompleteTasksProvider,
        name: r'loadInCompleteTasksProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$loadInCompleteTasksHash,
        dependencies: LoadInCompleteTasksFamily._dependencies,
        allTransitiveDependencies:
            LoadInCompleteTasksFamily._allTransitiveDependencies,
        userId: userId,
      );

  LoadInCompleteTasksProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
  }) : super.internal();

  final String userId;

  @override
  Override overrideWith(
    Stream<List<Task>> Function(LoadInCompleteTasksRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LoadInCompleteTasksProvider._internal(
        (ref) => create(ref as LoadInCompleteTasksRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<List<Task>> createElement() {
    return _LoadInCompleteTasksProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LoadInCompleteTasksProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin LoadInCompleteTasksRef on AutoDisposeStreamProviderRef<List<Task>> {
  /// The parameter `userId` of this provider.
  String get userId;
}

class _LoadInCompleteTasksProviderElement
    extends AutoDisposeStreamProviderElement<List<Task>>
    with LoadInCompleteTasksRef {
  _LoadInCompleteTasksProviderElement(super.provider);

  @override
  String get userId => (origin as LoadInCompleteTasksProvider).userId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
