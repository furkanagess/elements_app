// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Info _$InfoFromJson(Map<String, dynamic> json) => Info(
      title: json['title'] as String?,
      desc1: json['desc1'] as String?,
      desc2: json['desc2'] as String?,
      desc3: json['desc3'] as String?,
      desc4: json['desc4'] as String?,
      desc5: json['desc5'] as String?,
      svg: json['svg'] as String?,
      colors: json['colors'] as String?,
      shColor: json['shColor'] as String?,
    );

Map<String, dynamic> _$InfoToJson(Info instance) => <String, dynamic>{
      'title': instance.title,
      'desc1': instance.desc1,
      'desc2': instance.desc2,
      'desc3': instance.desc3,
      'desc4': instance.desc4,
      'desc5': instance.desc5,
      'svg': instance.svg,
      'colors': instance.colors,
      'shColor': instance.shColor,
    };
