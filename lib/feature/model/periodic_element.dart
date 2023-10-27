import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
part 'periodic_element.g.dart';

@immutable
@JsonSerializable()
final class PeriodicElement with EquatableMixin {
  final int? number;
  final String? enName;
  final String? symbol;
  final String? weight;
  final String? enCategory;
  final String? block;
  final String? period;
  final String? group;
  final String? enDescription;
  final String? enUsage;
  final String? enSource;
  final String? trName;
  final String? trCategory;
  final String? trDescription;
  final String? trUsage;
  final String? trSource;
  final String? colors;
  final String? shColor;

  PeriodicElement({
    this.number,
    this.enName,
    this.symbol,
    this.weight,
    this.enCategory,
    this.block,
    this.period,
    this.group,
    this.enDescription,
    this.enUsage,
    this.enSource,
    this.trName,
    this.trCategory,
    this.trDescription,
    this.trUsage,
    this.trSource,
    this.colors,
    this.shColor,
  });

  factory PeriodicElement.fromJson(Map<String, dynamic> json) =>
      _$PeriodicElementFromJson(json);

  Map<String, dynamic> toJson() => _$PeriodicElementToJson(this);

  @override
  List<Object?> get props => [
        number,
        enName,
        symbol,
        weight,
        enCategory,
        block,
        period,
        group,
        enDescription,
        enUsage,
        enSource,
        trName,
        trCategory,
        trDescription,
        trUsage,
        trSource,
        colors,
        shColor
      ];

  PeriodicElement copyWith({
    final int? number,
    final String? enName,
    final String? symbol,
    final String? weight,
    final String? enCategory,
    final String? block,
    final String? period,
    final String? group,
    final String? enDescription,
    final String? enUsage,
    final String? enSource,
    final String? trName,
    final String? trCategory,
    final String? trDescription,
    final String? trUsage,
    final String? trSource,
    final String? colors,
    final String? shColor,
  }) {
    return PeriodicElement(
      number: number ?? this.number,
      enName: enName ?? this.enName,
      symbol: symbol ?? this.symbol,
      weight: weight ?? this.weight,
      enCategory: enCategory ?? this.enCategory,
      block: block ?? this.block,
      period: period ?? this.period,
      group: group ?? this.group,
      enDescription: enDescription ?? this.enDescription,
      enUsage: enUsage ?? this.enUsage,
      enSource: enSource ?? this.enSource,
      trName: trName ?? this.trName,
      trCategory: trCategory ?? this.trCategory,
      trDescription: trDescription ?? this.trDescription,
      trUsage: trUsage ?? this.trUsage,
      trSource: trSource ?? this.trSource,
      colors: colors ?? this.colors,
      shColor: shColor ?? this.shColor,
    );
  }
}
