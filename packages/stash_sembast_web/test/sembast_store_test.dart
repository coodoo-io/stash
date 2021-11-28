import 'package:stash_sembast/stash_sembast.dart';
import 'package:stash_sembast_web/stash_sembast_web.dart';
import 'package:stash_test/stash_test.dart';

class VaultStoreContext extends VaultTestContext<SembastVaultStore> {
  VaultStoreContext(ValueGenerator generator,
      {dynamic Function(Map<String, dynamic>)? fromEncodable})
      : super(generator, fromEncodable: generator.fromEncodable);

  @override
  Future<SembastVaultStore> newStore() {
    return Future.value(newSembastWebVaultStore(fromEncodable: fromEncodable));
  }
}

class CacheStoreContext extends CacheTestContext<SembastCacheStore> {
  CacheStoreContext(ValueGenerator generator,
      {dynamic Function(Map<String, dynamic>)? fromEncodable})
      : super(generator, fromEncodable: generator.fromEncodable);

  @override
  Future<SembastCacheStore> newStore() {
    return Future.value(newSembastWebCacheStore(fromEncodable: fromEncodable));
  }
}

void main() async {
  //testStore((generator) => VaultStoreContext(generator),
  //    types: jsonStoreTypeTests);
  //testStore((generator) => CacheStoreContext(generator),
  //    types: jsonStoreTypeTests);
  //testVault((generator) => VaultStoreContext(generator),
  //    types: jsonStoreTypeTests);
  //testCache((generator) => CacheStoreContext(generator),
  //    types: jsonStoreTypeTests);
  testCache((generator) => CacheStoreContext(generator),
      types: {TypeTest.bool: TypeTest.bool.generator},
      tests: {CacheTest.lruEviction});
}
