import 'dart:convert';
import 'dart:math';
import 'package:elements_app/product/constants/app_colors.dart';
import 'package:elements_app/product/extensions/context_extensions.dart';
import 'package:http/http.dart' as http;
import 'package:elements_app/feature/model/periodic_element.dart';
import 'package:elements_app/feature/view/home/quiz/view/quiz_view.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

mixin QuizMixin on State<QuizView> {
  List<PeriodicElement> elements = []; // Element list
  String correctAnswer = ''; // correct answer
  List<String> options = []; // options
  String questionSymbol = ''; // question element symbol
  bool isCorrectAnswerSelected = false; // handle with correct answer
  int correctCount = 0; // correct answer count
  int wrongCount = 0; // wrong answer count
  bool isLoading = true; // check circuless progress bar
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

  Future<void> fetchElements() async {
    final response = await http.get(Uri.parse(widget.apiType));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      for (var elementData in data) {
        PeriodicElement element = PeriodicElement(
          symbol: elementData['symbol'],
          name: elementData['name'],
        );
        elements.add(element);
      }
      // get random element
      Random random = Random();
      PeriodicElement randomElement = elements[random.nextInt(elements.length)];
      correctAnswer = randomElement.name.toString();

      // build options
      options = [correctAnswer]; // add correct answer to options

      while (options.length < 4) {
        PeriodicElement randomOption =
            elements[random.nextInt(elements.length)];
        if (!options.contains(randomOption.name)) {
          options.add(randomOption.name.toString());
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
      questionSymbol = newElement.symbol.toString();
      correctAnswer = newElement.name.toString();

      options.clear();
      options.add(correctAnswer);

      while (options.length < 4) {
        PeriodicElement randomOption =
            elements[Random().nextInt(elements.length)];
        if (!options.contains(randomOption.name)) {
          options.add(randomOption.name.toString());
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
          backgroundColor: selectedOption == correctAnswer
              ? AppColors.glowGreen
              : AppColors.powderRed,
          title: Lottie.asset(
              selectedOption == correctAnswer
                  ? "assets/lottie/correct.json"
                  : "assets/lottie/wrong.json",
              repeat: true,
              height: context.dynamicHeight(0.3)),
          actions: <Widget>[
            Center(
              child: InkWell(
                onTap: () {
                  Navigator.of(context).pop(); // close popup
                  setState(
                    () {
                      if (selectedOption == correctAnswer) {
                        correctCount++;
                        askQuestion(); // ask new question
                      } else {
                        wrongCount++;
                      }
                    },
                  );
                },
                child: Container(
                  width: context.dynamicWidth(0.4),
                  height: context.dynamicHeight(0.05),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.darkBlue,
                  ),
                  child: Center(
                    child: Text(
                      selectedOption == correctAnswer
                          ? "Next Question"
                          : "Back to Question",
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
      correctAnswer = newElement.name.toString();

      // update şık options
      options.clear();
      options.add(correctAnswer);

      while (options.length < 4) {
        PeriodicElement randomOption =
            elements[Random().nextInt(elements.length)];
        if (!options.contains(randomOption.name)) {
          options.add(randomOption.name.toString());
        }
      }

      options.shuffle();
      isCorrectAnswerSelected = false; // reset correct answer
    });
  }
}
