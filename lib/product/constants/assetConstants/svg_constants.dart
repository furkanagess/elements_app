class SVGConstants {
  SVGConstants._init();
  static SVGConstants? _instace;

  static SVGConstants get instance => _instace ??= SVGConstants._init();

  String toSVG(String name) => "assets/svg/$name.svg";

  String get elementGroup => toSVG("element_group");
  String get elementSvg => toSVG("element-svg");
  String get gameTwo => toSVG("game_2");
  String get gameThree => toSVG("game-3");
  String get game => toSVG("game");
  String get questionTwo => toSVG("question-2");
  String get question => toSVG("question");
  String get questionThree => toSVG("question-3");
  String get refresh => toSVG("refresh");
  String get star => toSVG("star");
  String get starTwo => toSVG("star-2");
  String get warning => toSVG("warning");
}
