import 'dart:convert';
import 'dart:math';
import 'package:elements_app/feature/view/quiz/group/quiz_group_view.dart';
import 'package:elements_app/feature/view/quiz/quiz_home.dart';
import 'package:elements_app/product/constants/app_colors.dart';
import 'package:elements_app/product/constants/assets_constants.dart';
import 'package:elements_app/product/constants/stringConstants/tr_app_strings.dart';
import 'package:elements_app/product/extensions/context_extensions.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:elements_app/feature/model/periodic_element.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

mixin QuizGroupMixin on State<QuizGroupView> {
  List<PeriodicElement> elements = []; // Element list
  String correctAnswer = ''; // correct answer
  List<String> options = []; // options
  String questionNumber = ''; // question element symbol
  bool isCorrectAnswerSelected = false; // handle with correct answer
  int correctCount = 0; // correct answer count
  int wrongCount = 3; // wrong answer count
  bool isLoading = true; // check circuless progress bar
  int retryCount = 3;
  @override
  void initState() {
    isLoading = true;

    fetchAndAsk();
    super.initState();
  }

  Future<void> fetchAndAsk() async {
    fetchElements();
    askQuestion();
  }

  void askAndRetry() {
    askQuestion();
    retryCount--;
  }

  Future<void> fetchElements() async {
    final response = await http.get(Uri.parse(widget.apiType));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      for (var elementData in data) {
        PeriodicElement element = PeriodicElement(
          trCategory: elementData['trCategory'],
          trName: elementData['trName'],
        );
        elements.add(element);
      }
      // get random element
      Random random = Random();
      PeriodicElement randomElement = elements[random.nextInt(elements.length)];
      correctAnswer = randomElement.trName.toString();

      // build options
      options = [correctAnswer]; // add correct answer to options

      while (options.length < 4) {
        PeriodicElement randomOption =
            elements[random.nextInt(elements.length)];
        if (!options.contains(randomOption.trName)) {
          options.add(randomOption.trName.toString());
        }
      }

      // shuffle options
      options.shuffle();

      setState(() {}); // Widget'ı güncelleyin
    } else {
      throw Exception('Failed to load data');
    }
    isLoading = true;
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });

    askQuestion();
  }

  void askQuestion() {
    setState(() {
      elements.shuffle();
      PeriodicElement newElement = elements.first;
      questionNumber = newElement.trName.toString();
      correctAnswer = newElement.trCategory.toString();

      options.clear();
      options.add(correctAnswer);

      while (options.length < 4) {
        PeriodicElement randomOption =
            elements[Random().nextInt(elements.length)];
        if (!options.contains(randomOption.trCategory)) {
          options.add(randomOption.trCategory.toString());
        }
      }

      options.shuffle();
      isCorrectAnswerSelected = false;
    });
  }

  void checkAnswer(String selectedOption) {
    if (isCorrectAnswerSelected) return;

    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          actionsPadding: EdgeInsets.zero,
          backgroundColor: selectedOption == correctAnswer
              ? AppColors.glowGreen
              : AppColors.powderRed,
          title: Lottie.asset(
              selectedOption == correctAnswer
                  ? AssetConstants.instance.lottieCorrect
                  : wrongCount == 1
                      ? AssetConstants.instance.lottieNewHeart
                      : AssetConstants.instance.lottieWrong,
              repeat: true,
              height: context.dynamicHeight(0.3)),
          actions: <Widget>[
            Center(
              child: Column(
                children: [
                  selectedOption == correctAnswer
                      ? Column(
                          children: [
                            Container(
                              width: context.width,
                              height: context.dynamicHeight(0.06),
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(149, 255, 255, 255),
                              ),
                              child: Center(
                                child: Text(
                                  selectedOption == correctAnswer
                                      ? questionNumber
                                      : TrAppStrings.space,
                                  style:
                                      context.textTheme.headlineSmall?.copyWith(
                                    color: AppColors.background,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            SvgPicture.asset(
                              AssetConstants.instance.svgEqual,
                              height: context.dynamicHeight(0.05),
                              colorFilter: const ColorFilter.mode(
                                AppColors.background,
                                BlendMode.srcIn,
                              ),
                            ),
                            Container(
                              width: context.width,
                              height: context.dynamicHeight(0.06),
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(149, 255, 255, 255),
                              ),
                              child: Center(
                                child: Text(
                                  selectedOption == correctAnswer
                                      ? correctAnswer
                                      : TrAppStrings.space,
                                  style:
                                      context.textTheme.headlineSmall?.copyWith(
                                    color: AppColors.background,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      : Container(
                          width: context.width,
                          height: context.dynamicHeight(0.06),
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(149, 255, 255, 255),
                          ),
                          child: Center(
                            child: Text(
                              wrongCount == 1
                                  ? "Kaybettin !"
                                  : "${wrongCount - 1} ❤ Kaldı!",
                              style: context.textTheme.headlineSmall?.copyWith(
                                color: AppColors.background,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                  SizedBox(
                    height: context.dynamicHeight(0.05),
                  ),
                  InkWell(
                    onTap: () {
                      setState(
                        () {
                          if (selectedOption == correctAnswer) {
                            correctCount++;
                            askQuestion(); // ask new question
                          } else {
                            wrongCount--;
                          }
                        },
                      );
                      if (wrongCount <= 0) {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const QuizHomeView(),
                            ),
                            (route) => false);
                      } else {
                        Navigator.of(context).pop(); // close popup
                      }
                    },
                    child: Padding(
                      padding: context.paddingLow,
                      child: Container(
                        width: context.dynamicWidth(0.4),
                        height: context.dynamicHeight(0.05),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.background,
                        ),
                        child: Center(
                          child: Text(
                            selectedOption == correctAnswer
                                ? "Sıradaki soru"
                                : wrongCount == 1
                                    ? "Tekrar dene"
                                    : "Soruya dön",
                            style: context.textTheme.bodyLarge?.copyWith(
                              color: selectedOption == correctAnswer
                                  ? AppColors.white
                                  : AppColors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: context.dynamicHeight(0.04),
                  )
                ],
              ),
            )
          ],
        );
      },
    );
  }

  void moveToNextExample() {
    setState(() {
      // Move into new example =>
      elements.shuffle(); // Shuffle elements
      PeriodicElement newElement = elements.first; // pick a new element
      correctAnswer = newElement.trName.toString();

      // update şık options
      options.clear();
      options.add(correctAnswer);

      while (options.length < 4) {
        PeriodicElement randomOption =
            elements[Random().nextInt(elements.length)];
        if (!options.contains(randomOption.trName)) {
          options.add(randomOption.trName.toString());
        }
      }

      options.shuffle();
      isCorrectAnswerSelected = false; // reset correct answer
    });
  }
}
