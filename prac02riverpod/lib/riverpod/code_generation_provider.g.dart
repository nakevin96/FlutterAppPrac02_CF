// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'code_generation_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$gStringStateHash() => r'7dc8216277684f3e64bf54f9db4268109b96b6a6';

/// See also [gStringState].
@ProviderFor(gStringState)
final gStringStateProvider = AutoDisposeProvider<String>.internal(
  gStringState,
  name: r'gStringStateProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$gStringStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GStringStateRef = AutoDisposeProviderRef<String>;
String _$gIntStateHash() => r'9cf3d6ab58256cfe919b5ee34e57049b108fbed5';

/// See also [gIntState].
@ProviderFor(gIntState)
final gIntStateProvider = AutoDisposeProvider<int>.internal(
  gIntState,
  name: r'gIntStateProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$gIntStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GIntStateRef = AutoDisposeProviderRef<int>;
String _$gIntFutureStateHash() => r'5f07974863f4c16f5f337214d60b078511a8ff4c';

/// See also [gIntFutureState].
@ProviderFor(gIntFutureState)
final gIntFutureStateProvider = AutoDisposeFutureProvider<int>.internal(
  gIntFutureState,
  name: r'gIntFutureStateProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$gIntFutureStateHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GIntFutureStateRef = AutoDisposeFutureProviderRef<int>;
String _$gIntFutureState2Hash() => r'cb3064c54c676babcc818c40b8d75ea411c49162';

/// See also [gIntFutureState2].
@ProviderFor(gIntFutureState2)
final gIntFutureState2Provider = FutureProvider<int>.internal(
  gIntFutureState2,
  name: r'gIntFutureState2Provider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$gIntFutureState2Hash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef GIntFutureState2Ref = FutureProviderRef<int>;
String _$gFamilyStateMultiflyHash() =>
    r'5a71b01483169f75b2cf53953274214a8d02d5c2';

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

typedef GFamilyStateMultiflyRef = AutoDisposeProviderRef<int>;

/// See also [gFamilyStateMultifly].
@ProviderFor(gFamilyStateMultifly)
const gFamilyStateMultiflyProvider = GFamilyStateMultiflyFamily();

/// See also [gFamilyStateMultifly].
class GFamilyStateMultiflyFamily extends Family<int> {
  /// See also [gFamilyStateMultifly].
  const GFamilyStateMultiflyFamily();

  /// See also [gFamilyStateMultifly].
  GFamilyStateMultiflyProvider call({
    required int number1,
    required int number2,
  }) {
    return GFamilyStateMultiflyProvider(
      number1: number1,
      number2: number2,
    );
  }

  @override
  GFamilyStateMultiflyProvider getProviderOverride(
    covariant GFamilyStateMultiflyProvider provider,
  ) {
    return call(
      number1: provider.number1,
      number2: provider.number2,
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
  String? get name => r'gFamilyStateMultiflyProvider';
}

/// See also [gFamilyStateMultifly].
class GFamilyStateMultiflyProvider extends AutoDisposeProvider<int> {
  /// See also [gFamilyStateMultifly].
  GFamilyStateMultiflyProvider({
    required this.number1,
    required this.number2,
  }) : super.internal(
          (ref) => gFamilyStateMultifly(
            ref,
            number1: number1,
            number2: number2,
          ),
          from: gFamilyStateMultiflyProvider,
          name: r'gFamilyStateMultiflyProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$gFamilyStateMultiflyHash,
          dependencies: GFamilyStateMultiflyFamily._dependencies,
          allTransitiveDependencies:
              GFamilyStateMultiflyFamily._allTransitiveDependencies,
        );

  final int number1;
  final int number2;

  @override
  bool operator ==(Object other) {
    return other is GFamilyStateMultiflyProvider &&
        other.number1 == number1 &&
        other.number2 == number2;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, number1.hashCode);
    hash = _SystemHash.combine(hash, number2.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$gStateNotifierHash() => r'f5d3562260bad49518ffe5b82e60b7cc1b8655f2';

/// See also [GStateNotifier].
@ProviderFor(GStateNotifier)
final gStateNotifierProvider =
    AutoDisposeNotifierProvider<GStateNotifier, int>.internal(
  GStateNotifier.new,
  name: r'gStateNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$gStateNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$GStateNotifier = AutoDisposeNotifier<int>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
