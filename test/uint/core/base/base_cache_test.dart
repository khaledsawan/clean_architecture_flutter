import 'package:clean_architecture_flutter/core/base/base_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:clean_architecture_flutter/core/base/base_cache.dart';
import 'package:shared_preferences_platform_interface/shared_preferences_platform_interface.dart';
import '../../../shared_test.dart';

class MockUserModel extends BaseModel<MockUserModel> {
  // Implement abstract methods and properties for testing
  final String? email;
  final String? password;

  MockUserModel({this.email, this.password});

  @override
  List<Object?> get props => [email, password];

  @override
  MockUserModel fromJson(Map<String, dynamic> json) {
    return MockUserModel(
      email: json['email'] as String?,
      password: json['password'] as String?,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    Map<String, dynamic> data = {};
    data['email'] = this.email;
    data['password'] = this.password;
    return data;
  }
}

//class MockSharedPreferences extends Mock implements SharedPreferences {}

void main() {
  group('Memento Tests', () {
    TestWidgetsFlutterBinding.ensureInitialized();

    late FakeSharedPreferencesStore store;
    late SharedPreferences preferences;
    late Memento memento;

    const String testString = 'hello world';
    const bool testBool = true;
    const int testInt = 42;
    const double testDouble = 3.14159;
    const List<String> testList = <String>['foo', 'bar'];
    const Map<String, Object> testValues = <String, Object>{
      'flutter.String': testString,
      'flutter.bool': testBool,
      'flutter.int': testInt,
      'flutter.double': testDouble,
      'flutter.List': testList,
    };

    setUp(() async {
      store = FakeSharedPreferencesStore(testValues);
      SharedPreferencesStorePlatform.instance = store;
      preferences = await SharedPreferences.getInstance();
      memento = Memento(preferences);
      store.log.clear();
    });

    tearDown(() async {
      await preferences.clear();
    });

    test('Save and Retrieve String', () async {
      final key = 'test_key';
      final value = 'test_value';
      // Save a string
      final result = await memento.saveAString(value, key);
      ;
      expect(result, true);

      // Retrieve the saved string
      final retrievedValue = await memento.getAString(key);
      expect(retrievedValue, value);
    });

    test('Save and Retrieve Object', () async {
      final key = 'test_key';
      final model = MockUserModel();

      // Save an object
      final result = await memento.saveAThing(model, key);
      expect(result, true);

      // Retrieve the saved object
      final retrievedModel = await memento.getAThingFromCash(key, model: model);
      expect(retrievedModel, model);
    });

    test('Clear SharedPreferences', () async {
      final key = 'test_key';
      final value = 'test_value';

      // Save a string
      final saveResult = await memento.saveAString(value, key);
      expect(saveResult, true);

      // Clear SharedPreferences
      final clearResult = await memento.clear();
      expect(clearResult, true);

      // Verify that the value is cleared
      final retrievedValue = await memento.getAString(key);
      expect(retrievedValue, isNull);
    });
  });
}
