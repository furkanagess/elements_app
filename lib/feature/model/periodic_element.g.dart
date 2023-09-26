// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'periodic_element.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PeriodicElement _$PeriodicElementFromJson(Map<String, dynamic> json) =>
    PeriodicElement(
      number: json['number'] as int?,
      name: json['name'] as String?,
      symbol: json['symbol'] as String?,
      weight: json['weight'] as String?,
      category: json['category'] as String?,
      block: json['block'] as String?,
      period: json['period'] as String?,
      group: json['group'] as String?,
      description: json['description'] as String?,
      usage: json['usage'] as String?,
      source: json['source'] as String?,
      colors: json['colors'] as String?,
      shColor: json['shColor'] as String?,
    );

Map<String, dynamic> _$PeriodicElementToJson(PeriodicElement instance) =>
    <String, dynamic>{
      'number': instance.number,
      'name': instance.name,
      'symbol': instance.symbol,
      'weight': instance.weight,
      'category': instance.category,
      'block': instance.block,
      'period': instance.period,
      'group': instance.group,
      'description': instance.description,
      'usage': instance.usage,
      'source': instance.source,
      'colors': instance.colors,
      'shColor': instance.shColor,
    };
