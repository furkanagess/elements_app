import 'package:flutter/material.dart';

@immutable
final class EnAppStrings {
  const EnAppStrings._();

  // General
  static const String appName = 'Elements ~ Learn & Quiz';
  static const String errorMsg = 'An error occured';
  static const String space = '';

  // All Elements
  static const String elements = 'Elements';
  static const String allElements = 'All Elements';

  // Element Detail
  static const String block = 'Block';
  static const String period = 'Period';
  static const String group = 'Group';
  static const String name = 'Name:';
  static const String number = 'Number:';
  static const String weight = 'Weight:';
  static const String description = 'Description';
  static const String usage = 'Usage';
  static const String source = 'Source';

  // Element Types
  static const String actinides = 'Actanides';
  static const String alkaline = 'Alkaline Metals';
  static const String earthAlkaline = 'Earth Alkaline Metals';
  static const String halogens = 'Halogens';
  static const String lanthanides = 'Lanthanides';
  static const String metalloids = 'Metalloids';
  static const String nobleGases = 'Noble Gases';
  static const String postTransition = 'Post Transition Metals';
  static const String reactiveNonmetal = 'Reactive Nonmetals';
  static const String transitionMetal = 'Transition Metals';
  static const String unknown = 'Unknowns';

  // Element Groups
  static const String elementGroups = 'Element Groups';
  static const String metalloidGroup = 'Metalloid Group';
  static const String metalGroups = 'Metal Groups';
  static const String nonMetalGroup = 'Nonmetal Groups';
  static const String halogenGroup = 'Halogen Group';

  // Home
  static const String what = 'What Is';
  static const String quiz = 'Quiz';
  static const String groups = 'Groups';

  // BottomSheet
  static const String feedback =
      'Please give us a feedback for developing the App';
  static const String sendFeedback = 'Send your feedback';

  // Quiz
  static const String nextQuestion = 'Next Question';
  static const String backToQuestion = 'Back to Question';

  // Info
  static const String elementTypes = 'Element Types';

  // Connection
  static const String connectionError =
      'Please check your internet connection!';

  // Rate
  static const String rateTitle = "Rate This App";
  static const String rateDescription =
      "Take a few seconds to rate our app. Your thoughts mean a lot to us.";

  // Help Popup
  static const String help1 =
      "The colors of the elements represent the group in which the element is located. Each color represents a different group.";
  static const String help2 =
      "You can access all elements by going to the elements page";
  static const String help3 =
      "You can get information about the periodic table and elements by going to the What is it page?";
  static const String help4 =
      "You can access the list of elements by group by going to the group page.";
  static const String help5 =
      "You can solve the quiz of those elements by clicking the button at the bottom of the pages where the elements are listed.";
}
