// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storage_permission_request.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$storagePermissionHash() => r'4b3c39da4af32e6126139b64fc58b1cf04d9b45c';

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

/// See also [storagePermission].
@ProviderFor(storagePermission)
const storagePermissionProvider = StoragePermissionFamily();

/// See also [storagePermission].
class StoragePermissionFamily extends Family<AsyncValue<bool>> {
  /// See also [storagePermission].
  const StoragePermissionFamily();

  /// See also [storagePermission].
  StoragePermissionProvider call(
    Permission permission,
  ) {
    return StoragePermissionProvider(
      permission,
    );
  }

  @override
  StoragePermissionProvider getProviderOverride(
    covariant StoragePermissionProvider provider,
  ) {
    return call(
      provider.permission,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'storagePermissionProvider';
}

/// See also [storagePermission].
class StoragePermissionProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [storagePermission].
  StoragePermissionProvider(
    Permission permission,
  ) : this._internal(
          (ref) => storagePermission(
            ref as StoragePermissionRef,
            permission,
          ),
          from: storagePermissionProvider,
          name: r'storagePermissionProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$storagePermissionHash,
          dependencies: StoragePermissionFamily._dependencies,
          allTransitiveDependencies:
              StoragePermissionFamily._allTransitiveDependencies,
          permission: permission,
        );

  StoragePermissionProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.permission,
  }) : super.internal();

  final Permission permission;

  @override
  Override overrideWith(
    FutureOr<bool> Function(StoragePermissionRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: StoragePermissionProvider._internal(
        (ref) => create(ref as StoragePermissionRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        permission: permission,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _StoragePermissionProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is StoragePermissionProvider && other.permission == permission;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, permission.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin StoragePermissionRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `permission` of this provider.
  Permission get permission;
}

class _StoragePermissionProviderElement
    extends AutoDisposeFutureProviderElement<bool> with StoragePermissionRef {
  _StoragePermissionProviderElement(super.provider);

  @override
  Permission get permission => (origin as StoragePermissionProvider).permission;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
