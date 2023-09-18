import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
part 'table_element.g.dart';

@JsonSerializable()
class TableElement with EquatableMixin {
  int? number;
  String? name;
  String? symbol;
  String? weight;
  String? category;
  String? block;
  String? period;
  String? group;
  String? description;
  String? usage;
  String? source;
  int? colors;

  TableElement({
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
  });

  factory TableElement.fromJson(Map<String, dynamic> json) =>
      _$TableElementFromJson(json);

  Map<String, dynamic> toJson() => _$TableElementToJson(this);

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
        colors
      ];

  TableElement copyWith({
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
    int? colors,
  }) {
    return TableElement(
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
    );
  }
}
