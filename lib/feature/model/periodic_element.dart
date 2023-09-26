import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
part 'periodic_element.g.dart';

@immutable
@JsonSerializable()
final class PeriodicElement with EquatableMixin {
  final int? number;
  final String? name;
  final String? symbol;
  final String? weight;
  final String? category;
  final String? block;
  final String? period;
  final String? group;
  final String? description;
  final String? usage;
  final String? source;
  final String? colors;
  final String? shColor;

  PeriodicElement({
    this.number,
    this.name,
    this.symbol,
    this.weight,
    this.category,
    this.block,
    this.period,
    this.group,
    this.description,
    this.usage,
    this.source,
    this.colors,
    this.shColor,
  });

  factory PeriodicElement.fromJson(Map<String, dynamic> json) =>
      _$PeriodicElementFromJson(json);

  Map<String, dynamic> toJson() => _$PeriodicElementToJson(this);

  @override
  List<Object?> get props => [
        number,
        name,
        symbol,
        weight,
        category,
        block,
        period,
        group,
        description,
        usage,
        source,
        colors,
        shColor,
      ];

  PeriodicElement copyWith({
    int? number,
    String? name,
    String? symbol,
    String? weight,
    String? category,
    String? block,
    String? period,
    String? group,
    String? description,
    String? usage,
    String? source,
    String? colors,
    String? shColor,
  }) {
    return PeriodicElement(
      number: number ?? this.number,
      name: name ?? this.name,
      symbol: symbol ?? this.symbol,
      weight: weight ?? this.weight,
      category: category ?? this.category,
      block: block ?? this.block,
      period: period ?? this.period,
      group: group ?? this.group,
      description: description ?? this.description,
      usage: usage ?? this.usage,
      source: source ?? this.source,
      colors: colors ?? this.colors,
      shColor: shColor ?? this.shColor,
    );
  }
}
