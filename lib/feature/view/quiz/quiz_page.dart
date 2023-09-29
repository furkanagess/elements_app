// ignore_for_file: library_private_types_in_public_api

import 'dart:convert';
import 'package:elements_app/feature/model/periodic_element.dart';
import 'package:elements_app/product/constants/api_types.dart';
import 'package:elements_app/product/constants/app_colors.dart';
import 'package:elements_app/product/extensions/context_extensions.dart';
import 'package:elements_app/product/widget/container/element_group_container.dart';
import 'package:elements_app/product/widget/container/element_symbol_container.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:math';

class QuizPage extends StatefulWidget {
  const QuizPage({
    super.key,
  });

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
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
    super.initState();
    fetchAndAsk();
  }

  Future<void> fetchAndAsk() async {
    fetchElements();
    askQuestion();
  }

  Future<void> fetchElements() async {
    final response = await http.get(Uri.parse(ApiTypes.allElements));
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
    isLoading = false;
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
          title: Text(selectedOption == correctAnswer ? 'Doğru' : 'Yanlış'),
          content: Text(selectedOption == correctAnswer
              ? 'Cevap doğru!'
              : 'Cevap yanlış.'),
          actions: <Widget>[
            TextButton(
              child: Text(selectedOption == correctAnswer
                  ? "Sıradaki Soru"
                  : "Soruya Dön"),
              onPressed: () {
                Navigator.of(context).pop(); // close popup
                setState(() {
                  if (selectedOption == correctAnswer) {
                    correctCount++;
                    askQuestion(); // ask new question
                  } else {
                    wrongCount++;
                  }
                });
              },
            ),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      backgroundColor: AppColors.background,
      appBar: appBar(),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: context.paddingNormal,
              child: Column(
                children: [
                  Expanded(
                    child: wrongAndCorrectCounter(context),
                  ),
                  spacer(context, 0.05),
                  Expanded(
                    flex: 2,
                    child: symbolContainer(),
                  ),
                  spacer(context, 0.05),
                  Expanded(
                    flex: 8,
                    child: optionAnswerGrid(context),
                  ),
                ],
              ),
            ),
      floatingActionButton: fabButton(),
    );
  }

  FloatingActionButton fabButton() {
    return FloatingActionButton(
      backgroundColor: AppColors.pink,
      onPressed: askQuestion,
      child: const Icon(
        Icons.refresh,
        color: AppColors.background,
      ),
    );
  }

  SizedBox spacer(BuildContext context, double value) =>
      SizedBox(height: context.dynamicHeight(value));

  AppBar appBar() {
    return AppBar(
      backgroundColor: AppColors.background,
      elevation: 0,
    );
  }

  GridView optionAnswerGrid(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: options.map((option) {
        return Padding(
          padding: context.paddingLow,
          child: ElementGroupContainer(
            color: AppColors.turquoise,
            shadowColor: AppColors.shTurquoise,
            onTap: () {
              checkAnswer(option);
            },
            title: option,
          ),
        );
      }).toList(),
    );
  }

  ElementSymbolContainer symbolContainer() {
    return ElementSymbolContainer(
      title: questionSymbol,
      color: AppColors.purple,
      shadowColor: AppColors.shPurple,
    );
  }

  Row wrongAndCorrectCounter(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        answerCounter(
            context, "$correctCount", AppColors.glowGreen, Icons.check),
        answerCounter(context, "$wrongCount", AppColors.powderRed, Icons.close),
      ],
    );
  }

  Row answerCounter(
      BuildContext context, String text, Color color, IconData icon) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: context.dynamicHeight(0.05),
          width: context.dynamicWidth(0.1),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: color,
          ),
          child: Icon(
            icon,
            color: AppColors.background,
          ),
        ),
        SizedBox(
          width: context.dynamicWidth(0.03),
        ),
        Text(
          text,
          style: context.textTheme.headlineSmall?.copyWith(
            color: AppColors.white,
          ),
        ),
      ],
    );
  }
}
