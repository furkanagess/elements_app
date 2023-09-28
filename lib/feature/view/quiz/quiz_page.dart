import 'dart:convert';
import 'package:elements_app/feature/model/periodic_element.dart';
import 'package:elements_app/feature/view/home/home_view.dart';
import 'package:elements_app/product/constants/api_types.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:math';

class PeriodicTableQuizApp extends StatefulWidget {
  @override
  _PeriodicTableQuizAppState createState() => _PeriodicTableQuizAppState();
}

class _PeriodicTableQuizAppState extends State<PeriodicTableQuizApp> {
  List<PeriodicElement> elements = []; // Element listesi
  String correctAnswer = ''; // Doğru cevap
  List<String> options = []; // Şık seçenekleri
  String questionSymbol = '';
  bool isCorrectAnswerSelected = false;
  int correctCount = 0; // Doğru cevap sayısı
  int wrongCount = 0; // Yanlış cevap sayısı
  @override
  void initState() {
    super.initState();
    fetchElements();
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
  }

  void checkAnswer(String selectedOption) {
    if (isCorrectAnswerSelected) return;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor:
              selectedOption == correctAnswer ? Colors.green : Colors.red,
          title: Text(selectedOption == correctAnswer ? 'Doğru' : 'Yanlış'),
          content: Text(selectedOption == correctAnswer
              ? 'Cevap doğru!'
              : 'Cevap yanlış.'),
          actions: <Widget>[
            TextButton(
              child: Text(
                  selectedOption == correctAnswer ? "Sıradaki" : "Soruya Dön"),
              onPressed: () {
                Navigator.of(context).pop(); // Popup'ı kapat
                setState(() {
                  if (selectedOption == correctAnswer) {
                    correctCount++;
                    moveToNextExample();
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
      appBar: AppBar(
        title: Text('Periodik Tablo Quiz Uygulaması'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Doğru: $correctCount  Yanlış: $wrongCount'),
            ],
          ),
          Text(
            'Element Sembolü: $correctAnswer',
            style: TextStyle(fontSize: 24.0),
          ),
          SizedBox(height: 20.0),
          Column(
            children: options.map((option) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    checkAnswer(option);
                  },
                  child: Text(option),
                ),
              );
            }).toList(),
          ),
          isCorrectAnswerSelected
              ? ElevatedButton(
                  onPressed: moveToNextExample,
                  child: Text('Sonraki Sayfaya Geç'),
                )
              : Container(), // Butonu sadece doğru cevap işaretlendiğinde göster
        ],
      ),
    );
  }
}
