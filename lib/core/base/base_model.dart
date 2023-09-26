// an abstract class to force the user to add the fromJson and to json function
// we can do better but it is what it is at the moment
import 'package:equatable/equatable.dart';

abstract class BaseModel<T> extends Equatable {
  T fromJson(Map<String, dynamic> json);
  Map<String, dynamic> toJson();
}
