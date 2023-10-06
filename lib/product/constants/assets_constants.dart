class AssetConstants {
  AssetConstants._init();
  static AssetConstants? _instace;

  static AssetConstants get instance => _instace ??= AssetConstants._init();

  String toSVG(String name) => "assets/svg/$name.svg";

  String get svgElementGroup => toSVG("element_group");
  String get svgElement => toSVG("element-svg");
  String get svgGameTwo => toSVG("game_2");
  String get svgGameThree => toSVG("game-3");
  String get svgGame => toSVG("game");
  String get svgQuestionTwo => toSVG("question-2");
  String get svgQuestion => toSVG("question");
  String get svgQuestionThree => toSVG("question-3");
  String get svgRefresh => toSVG("refresh");
  String get svgStar => toSVG("star");
  String get svgStarTwo => toSVG("star-2");
  String get svgWarning => toSVG("warning");

  // Lottie
  String toLottie(String name) => "assets/lottie/$name.json";
  String get lottieCorrectTwo => toSVG("correct_2");
  String get lottieCorrect => toSVG("correct");
  String get lottieLoadingChem => toSVG("loading_chem");
  String get lottieLoadingChemistry => toSVG("loading_chemistry");
  String get lottieLoading => toSVG("loading");
  String get lottieWrong => toSVG("wrong");
}
