// coverage:ignore-file
import 'package:dhakaniya_gam/app/utils/strings/strings.dart';
import 'package:dhakaniya_gam/data/data.dart';
import 'package:dhakaniya_gam/device/device_constants.dart';
import 'package:dhakaniya_gam/domain/repositories/domain_repository.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';

/// Repositories that communicate with the platform e.g. GPS
class DeviceRepository extends DomainRepository {
  /// initialize flutter secure storage
  final _flutterSecureStorage = const FlutterSecureStorage();

  /// initialize the hive box
  Future<void> init({bool isTest = false}) async {
    if (isTest) {
      Hive.init('HIVE_TEST');
      await Hive.openBox<dynamic>(StringConstants.appName);
    } else {
      await Hive.initFlutter();
      await Hive.openBox<dynamic>(
        StringConstants.appName,
      );
    }
  }

  /// Returns the box in which the data is stored.
  Box getBox() => Hive.box<dynamic>(StringConstants.appName);

  @override
  void clearData(dynamic key) {
    getBox().delete(key);
  }

  /// Delete the box
  @override
  void deleteBox() {
    Hive.box<dynamic>(StringConstants.appName).clear();
  }

  /// returns stored string value
  @override
  String getStringValue(String key) {
    var box = getBox();
    var defaultValue = '';
    if (key == DeviceConstants.localLang) {
      defaultValue = DataConstants.defaultLang;
    }
    String? value = box.get(key, defaultValue: defaultValue) as String;
    return value;
  }

  /// store the data
  @override
  void saveValue(dynamic key, dynamic value) {
    getBox().put(key, value);
  }

  /// return bool value
  @override
  bool getBoolValue(String key) =>
      getBox().get(key, defaultValue: false) as bool;

  /// Get data from secure storage
  @override
  Future<String> getSecuredValue(String key) async {
    try {
      var value = await _flutterSecureStorage.read(key: key);
      if (value == null || value.isEmpty) {
        value = '';
      }
      return value;
    } catch (error) {
      return '';
    }
  }

  /// Save data in secure storage
  @override
  void saveValueSecurely(String key, String value) {
    _flutterSecureStorage.write(key: key, value: value);
  }

  /// Delete data from secure storage
  @override
  void deleteSecuredValue(String key) {
    _flutterSecureStorage.delete(key: key);
  }

  /// Delete all data from secure storage
  @override
  void deleteAllSecuredValues() {
    _flutterSecureStorage.deleteAll();
  }

  /// API to get the IP of the user
  @override
  Future<String> getIp() {
    throw UnimplementedError();
  }
}
