import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
part 'info.g.dart';

@JsonSerializable()
class Info with EquatableMixin {
  String? enTitle;
  String? enDesc1;
  String? enDesc2;
  String? enDesc3;
  String? enDesc4;
  String? enDesc5;
  String? svg;
  String? trTitle;
  String? trDesc1;
  String? trDesc2;
  String? trDesc3;
  String? trDesc4;
  String? trDesc5;
  String? colors;
  String? shColor;

  Info({
    this.enTitle,
    this.enDesc1,
    this.enDesc2,
    this.enDesc3,
    this.enDesc4,
    this.enDesc5,
    this.svg,
    this.trTitle,
    this.trDesc1,
    this.trDesc2,
    this.trDesc3,
    this.trDesc4,
    this.trDesc5,
    this.colors,
    this.shColor,
  });

  factory Info.fromJson(Map<String, dynamic> json) => _$InfoFromJson(json);

  Map<String, dynamic> toJson() => _$InfoToJson(this);

  @override
  List<Object?> get props => [
        enTitle,
        enDesc1,
        enDesc2,
        enDesc3,
        enDesc4,
        enDesc5,
        svg,
        trTitle,
        trDesc1,
        trDesc2,
        trDesc3,
        trDesc4,
        trDesc5,
        colors,
        shColor
      ];

  Info copyWith({
    String? enTitle,
    String? enDesc1,
    String? enDesc2,
    String? enDesc3,
    String? enDesc4,
    String? enDesc5,
    String? svg,
    String? trTitle,
    String? trDesc1,
    String? trDesc2,
    String? trDesc3,
    String? trDesc4,
    String? trDesc5,
    String? colors,
    String? shColor,
  }) {
    return Info(
      enTitle: enTitle ?? this.enTitle,
      enDesc1: enDesc1 ?? this.enDesc1,
      enDesc2: enDesc2 ?? this.enDesc2,
      enDesc3: enDesc3 ?? this.enDesc3,
      enDesc4: enDesc4 ?? this.enDesc4,
      enDesc5: enDesc5 ?? this.enDesc5,
      svg: svg ?? this.svg,
      trTitle: trTitle ?? this.trTitle,
      trDesc1: trDesc1 ?? this.trDesc1,
      trDesc2: trDesc2 ?? this.trDesc2,
      trDesc3: trDesc3 ?? this.trDesc3,
      trDesc4: trDesc4 ?? this.trDesc4,
      trDesc5: trDesc5 ?? this.trDesc5,
      colors: colors ?? this.colors,
      shColor: shColor ?? this.shColor,
    );
  }
}
