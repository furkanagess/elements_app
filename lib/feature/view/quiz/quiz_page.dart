// ignore_for_file: library_private_types_in_public_api

import 'dart:convert';
import 'package:elements_app/feature/model/periodic_element.dart';
import 'package:elements_app/product/constants/api_types.dart';
import 'package:elements_app/product/constants/app_colors.dart';
import 'package:elements_app/product/extensions/context_extensions.dart';
import 'package:elements_app/product/widget/container/element_symbol_container.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:math';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<PeriodicElement> elements = []; // Element listesi
  String correctAnswer = ''; // Doğru cevap
  List<String> options = []; // Şık seçenekleri
  String questionSymbol = '';
  bool isCorrectAnswerSelected = false;
  int correctCount = 0; // Doğru cevap sayısı
  int wrongCount = 0; // Yanlış cevap sayısı
  bool isLoading = true;
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
      // Rastgele bir element seç
      Random random = Random();
      PeriodicElement randomElement = elements[random.nextInt(elements.length)];
      correctAnswer = randomElement.name.toString();

      // Şık seçenekleri oluştur
      options = [correctAnswer]; // Doğru cevabı ilk olarak ekleyin

      while (options.length < 4) {
        PeriodicElement randomOption =
            elements[random.nextInt(elements.length)];
        if (!options.contains(randomOption.name)) {
          options.add(randomOption.name.toString());
        }
      }

      // Şık seçeneklerini karıştırın
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
                Navigator.of(context).pop(); // Popup'ı kapat
                setState(() {
                  if (selectedOption == correctAnswer) {
                    correctCount++;
                    askQuestion(); // Yeni soru sor
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
      // Yeni örneğe geçiş: Örneğin, bir sonraki elementi seçerek devam edebilirsiniz.
      elements.shuffle(); // Elementleri karıştır
      PeriodicElement newElement = elements.first; // Yeni elementi seç
      correctAnswer = newElement.name.toString();

      // Şık seçeneklerini güncelle
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
      isCorrectAnswerSelected = false; // Doğru cevap sıfırla
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
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              checkAnswer(option);
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 0.5),
                boxShadow: const [
                  BoxShadow(
                    color: AppColors.shTurquoise,
                    offset: Offset(4, 4),
                    spreadRadius: 1,
                  ),
                ],
                borderRadius: BorderRadius.circular(10),
                color: AppColors.turquoise,
              ),
              height: context.dynamicHeight(0.15),
              width: context.dynamicWidth(0.30),
              child: Center(
                child: Text(
                  option,
                  style: context.textTheme.headlineSmall?.copyWith(
                      color: AppColors.background, fontWeight: FontWeight.bold),
                ),
              ),
            ),
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
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: context.dynamicHeight(0.05),
              width: context.dynamicWidth(0.1),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.glowGreen,
              ),
              child: const Icon(
                Icons.check,
                color: AppColors.background,
              ),
            ),
            SizedBox(
              width: context.dynamicWidth(0.03),
            ),
            Text(
              "$correctCount",
              style: context.textTheme.headlineSmall?.copyWith(
                color: AppColors.white,
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: context.dynamicHeight(0.05),
              width: context.dynamicWidth(0.1),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.powderRed,
              ),
              child: const Icon(
                Icons.close,
                color: AppColors.background,
              ),
            ),
            SizedBox(
              width: context.dynamicWidth(0.03),
            ),
            Text(
              "$wrongCount",
              style: context.textTheme.headlineSmall?.copyWith(
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
