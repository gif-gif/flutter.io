// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'testmode.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$Testmode extends Testmode {
  @override
  final String id;
  @override
  final String token;
  @override
  final String? name;
  @override
  final BuiltList<String> tags;

  factory _$Testmode([void Function(TestmodeBuilder)? updates]) =>
      (new TestmodeBuilder()..update(updates))._build();

  _$Testmode._(
      {required this.id, required this.token, this.name, required this.tags})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(id, r'Testmode', 'id');
    BuiltValueNullFieldError.checkNotNull(token, r'Testmode', 'token');
    BuiltValueNullFieldError.checkNotNull(tags, r'Testmode', 'tags');
  }

  @override
  Testmode rebuild(void Function(TestmodeBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TestmodeBuilder toBuilder() => new TestmodeBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Testmode &&
        id == other.id &&
        token == other.token &&
        name == other.name &&
        tags == other.tags;
  }

  @override
  int get hashCode {
    var _$hash = 0;
    _$hash = $jc(_$hash, id.hashCode);
    _$hash = $jc(_$hash, token.hashCode);
    _$hash = $jc(_$hash, name.hashCode);
    _$hash = $jc(_$hash, tags.hashCode);
    _$hash = $jf(_$hash);
    return _$hash;
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'Testmode')
          ..add('id', id)
          ..add('token', token)
          ..add('name', name)
          ..add('tags', tags))
        .toString();
  }
}

class TestmodeBuilder implements Builder<Testmode, TestmodeBuilder> {
  _$Testmode? _$v;

  String? _id;
  String? get id => _$this._id;
  set id(String? id) => _$this._id = id;

  String? _token;
  String? get token => _$this._token;
  set token(String? token) => _$this._token = token;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  ListBuilder<String>? _tags;
  ListBuilder<String> get tags => _$this._tags ??= new ListBuilder<String>();
  set tags(ListBuilder<String>? tags) => _$this._tags = tags;

  TestmodeBuilder();

  TestmodeBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _token = $v.token;
      _name = $v.name;
      _tags = $v.tags.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(Testmode other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$Testmode;
  }

  @override
  void update(void Function(TestmodeBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  Testmode build() => _build();

  _$Testmode _build() {
    _$Testmode _$result;
    try {
      _$result = _$v ??
          new _$Testmode._(
              id: BuiltValueNullFieldError.checkNotNull(id, r'Testmode', 'id'),
              token: BuiltValueNullFieldError.checkNotNull(
                  token, r'Testmode', 'token'),
              name: name,
              tags: tags.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'tags';
        tags.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'Testmode', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: deprecated_member_use_from_same_package,type=lint
