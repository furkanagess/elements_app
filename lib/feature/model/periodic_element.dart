import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
part 'periodic_element.g.dart';

@JsonSerializable()
class PeriodicElement with EquatableMixin {
  int? number;
  String? enName;
  String? symbol;
  String? weight;
  String? enCategory;
  String? block;
  String? period;
  String? group;
  String? enDescription;
  String? enUsage;
  String? enSource;
  String? trName;
  String? trCategory;
  String? trDescription;
  String? trUsage;
  String? trSource;
  String? colors;
  String? shColor;

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
    int? number,
    String? enName,
    String? symbol,
    String? weight,
    String? enCategory,
    String? block,
    String? period,
    String? group,
    String? enDescription,
    String? enUsage,
    String? enSource,
    String? trName,
    String? trCategory,
    String? trDescription,
    String? trUsage,
    String? trSource,
    String? colors,
    String? shColor,
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
