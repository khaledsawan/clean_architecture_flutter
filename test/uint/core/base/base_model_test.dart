import 'package:clean_architecture_flutter/core/base/base_model.dart';
import 'package:flutter_test/flutter_test.dart';

class TestModel implements BaseModel<TestModel> {
  final String name;

  TestModel({required this.name});

  @override
  TestModel fromJson(Map<String, dynamic> json) {
    return TestModel(name: json['name'] as String);
  }

  @override
  Map<String, dynamic> toJson() {
    return {'name': name};
  }

  @override
  List<Object?> get props => [name];

  @override
  bool get stringify => true;

  @override
  String toString() {
    return 'TestModel { name: $name }';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is TestModel && other.name == name;
  }

  @override
  int get hashCode => name.hashCode;
}

void main() {
  group('BaseModel Tests', () {
    test('fromJson and toJson', () {
      final model = TestModel(name: 'John');
      final json = model.toJson();
      final fromJsonModel = model.fromJson(json);
      expect(fromJsonModel, equals(model));
    });

    test('Equatable Props', () {
      final model1 = TestModel(name: 'John');
      final model2 = TestModel(name: 'John');
      final model3 = TestModel(name: 'Alice');

      expect(model1, equals(model2));
      expect(model1, isNot(equals(model3)));
    });
  });
}
