import 'dart:io';

import 'package:flutter/material.dart';

BigInt parseBigInt(dynamic e) => BigInt.tryParse(e?.toString() ?? '0') ?? BigInt.from(-1);

BigInt? parseBigIntN(dynamic e) => e == null ? null : parseBigInt(e);

int parseInt(dynamic e) => e is int ? e : int.tryParse(e?.toString() ?? '-1') ?? -1;

int? parseIntN(dynamic e) => e == null ? null : parseInt(e);

double parseDouble(dynamic e) => e is double ? e : double.tryParse(e?.toString() ?? '-1') ?? -1;

double? parseDoubleN(dynamic e) => e == null ? null : parseDouble(e);

num parseNum(dynamic e) => e is num ? e : num.tryParse((e?.toString() ?? '-1').replaceAll(',', '')) ?? -1;

num? parseNumN(dynamic e) => e == null ? null : parseNum(e);

bool parseBool(dynamic e) {
  if (e is bool) {
    return e;
  } else if (e is num) {
    return e == 1;
  } else if (e is String) {
    return e.toLowerCase() == 'true' || e == '1' || (num.tryParse(e) ?? -1) > 0;
  }
  return false;
}

bool? parseBoolN(dynamic e) => e == null ? null : parseBool(e);

String parseString(dynamic e) => e?.toString() ?? '';

String? parseStringN(dynamic e) => e == null ? null : e?.toString() ?? '';

List<T> parseList<T>(dynamic e, T Function(dynamic e) builder) {
  if (e is List || e is Iterable) {
    return e.map(builder).toList();
  }
  return [];
}

List<T>? parseListNullable<T>(dynamic data, T Function(dynamic) fromMap) {
  if (data == null) return null;
  if (data is! List) throw ArgumentError('Expected a List, but got ${data.runtimeType}');
  return data.map<T>((e) => fromMap(e)).toList();
}

List<T>? parseListN<T>(dynamic e, T Function(dynamic e) builder) => e == null ? null : parseList(e, builder);

Set<T> parseSet<T>(dynamic e, T Function(dynamic e) builder) => parseList(e, builder).toSet();

Set<T>? parseSetN<T>(dynamic e, T Function(dynamic e) builder) => parseListN(e, builder)?.toSet();

Iterable<T> parseIterable<T>(dynamic e, T Function(dynamic e) builder) => parseList(e, builder);

Iterable<T>? parseIterableN<T>(dynamic e, T Function(dynamic e) builder) => parseListN(e, builder);

Map<S, T> parseMap<S, T>(dynamic e, MapEntry<S, T> Function(dynamic k, dynamic v) builder) =>
    e is Map ? e.map(builder) : {};

Map<S, T>? parseMapN<S, T>(dynamic e, MapEntry<S, T> Function(dynamic k, dynamic v) builder) =>
    e == null ? null : parseMap(e, builder);

DateTime parseDateTime(dynamic e) {
  if (e is String) {
    try {
      return DateTime.parse(e);
    } catch (_) {
      try {
        return HttpDate.parse(e);
      } catch (_) {}
    }
  }
  return DateTime(1970);
}

DateTime? parseDateTimeN(dynamic e) => e == null ? null : parseDateTime(e);

DateTime parseDate(dynamic e) => DateUtils.dateOnly(parseDateTime(e));

DateTime? parseDateN(dynamic e) => e == null ? null : DateUtils.dateOnly(parseDateTime(e));

Duration parseDuration(dynamic e) {
  double? result;
  final dur = parseString(e).replaceAllMapped(RegExp(r'(\d)[,_](\d)'), (match) => '${match[1]}${match[2]}');

  RegExp(r'(-?(?:\d+\.?\d*|\d*\.?\d+)(?:e[-+]?\d+)?)\s*(\p{L}*)', unicode: true).allMatches(dur).forEach((match) {
    final units = switch (match[2]?.toLowerCase().replaceAll('s', '')) {
      'nanosecond' || 'ns' => 1 / 1000000,
      'microsecond' || 'µs' || 'us' => 1 / 1000,
      'millisecond' || 'ms' => 1,
      'second' || 'sec' || 's' => 1000,
      'minute' || 'min' || 'm' => 60000,
      'hour' || 'hr' || 'h' => 3600000,
      'day' || 'd' => 86400000,
      'week' || 'wk' || 'w' => 604800000,
      'month' || 'b' => 365.25 / 12 * 86400000,
      'year' || 'yr' || 'y' => 365.25 * 86400000,
      _ => null,
    };
    if (units != null) result = (result ?? 0) + double.parse(match[1]!).abs() * units;
  });
  return Duration(microseconds: (result != null ? result! * (dur.startsWith('-') ? -1 : 1) * 1000 : 0).floor());
}

Duration? parseDurationN(dynamic e) => e == null ? null : parseDuration(e);

Uri parseUri(dynamic e) => Uri.tryParse(e?.toString() ?? '') ?? Uri.parse('');

Uri? parseUriN(dynamic e) => e == null ? null : parseUri(e);

T parseEnum<T extends Enum>(Map<T, dynamic> enumValues, Object? source, {T? unknownValue}) {
  if (source == null) {
    throw ArgumentError('Value must be provided. Supported values: ${enumValues.values.join(',')}');
  }
  final res = enumValues.entries.where((e) => e.value == source).firstOrNull?.key;
  if (res != null) return res;

  if (unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: ${enumValues.values.join(',')}');
  }
  return unknownValue;
}

T? parseEnumN<T extends Enum>(Map<T, dynamic> enumValues, Object? source) {
  return enumValues.entries.where((e) => e.value == source).firstOrNull?.key;
}
