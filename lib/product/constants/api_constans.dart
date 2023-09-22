import 'package:flutter/material.dart';

@immutable
class ApiConstants {
  const ApiConstants._();
  // Base
  static const String baseUrl =
      'https://raw.githubusercontent.com/furkanagess/periodic_table_data_set/master/';
  // Default
  static const String defaultElements = '${baseUrl}default.json';

  // Element Types
  static const String allElements = '${baseUrl}all_elements.json';
  static const String actinides = '${baseUrl}actinides.json';
  static const String alkaliMetal = '${baseUrl}alkali_metal.json';
  static const String alkalineEarthMetal =
      '${baseUrl}alkaline_earth_metal.json';

  static const String lanthanides = '${baseUrl}lanthanides.json';
  static const String metalloid = '${baseUrl}metalloid.json';
  static const String nobleGases = '${baseUrl}noble_gases.json';
  static const String postTransition = '${baseUrl}post_transition_metal.json';
  static const String reactiveNonmetal = '${baseUrl}reactive_nonmetal.json';
  static const String transitionMetal = '${baseUrl}transition_metal.json';
}
