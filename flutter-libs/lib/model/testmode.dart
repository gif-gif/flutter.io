import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';

part 'testmode.g.dart';

abstract class Testmode implements Built<Testmode, TestmodeBuilder> {
  String get id;

  String get token;

  String? get name;

  BuiltList<String> get tags;

  Testmode._();
  factory Testmode([updates(TestmodeBuilder b)]) = _$Testmode;
}
