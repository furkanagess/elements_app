import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
part 'info.g.dart';

@JsonSerializable()
final class Info with EquatableMixin {
  String? title;
  String? desc1;
  String? desc2;
  String? desc3;
  String? desc4;
  String? desc5;
  String? svg;
  String? colors;
  String? shColor;

  Info({
    this.title,
    this.desc1,
    this.desc2,
    this.desc3,
    this.desc4,
    this.desc5,
    this.svg,
    this.colors,
    this.shColor,
  });

  factory Info.fromJson(Map<String, dynamic> json) => _$InfoFromJson(json);

  Map<String, dynamic> toJson() => _$InfoToJson(this);

  @override
  List<Object?> get props =>
      [title, desc1, desc2, desc3, desc4, desc5, svg, colors, shColor];

  Info copyWith({
    String? title,
    String? desc1,
    String? desc2,
    String? desc3,
    String? desc4,
    String? desc5,
    String? svg,
    String? colors,
    String? shColor,
  }) {
    return Info(
      title: title ?? this.title,
      desc1: desc1 ?? this.desc1,
      desc2: desc2 ?? this.desc2,
      desc3: desc3 ?? this.desc3,
      desc4: desc4 ?? this.desc4,
      desc5: desc5 ?? this.desc5,
      svg: svg ?? this.svg,
      colors: colors ?? this.colors,
      shColor: shColor ?? this.shColor,
    );
  }
}
