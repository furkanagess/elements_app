// import 'dart:convert';
// import 'dart:math';

// import 'package:elements_app/feature/model/periodic_element.dart';
// import 'package:elements_app/product/constants/api_types.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class ElementProvider extends ChangeNotifier {
//   List<PeriodicElement> elements = [];
//   String questionSymbol = '';
//   String correctAnswer = '';
//   List<String> options = [];
//   bool isCorrectAnswerSelected = false;
//   int correctCount = 0;
//   int wrongCount = 0;
//   bool isLoading = true;

//   ElementProvider() {
//     fetchElements();
//   }

//   Future<void> fetchElements() async {
//     final response = await http.get(Uri.parse(ApiTypes.allElements));
//     if (response.statusCode == 200) {
//       final List<dynamic> responseData = json.decode(response.body);
//       elements = responseData
//           .map((element) =>
//               PeriodicElement(symbol: element['symbol'], name: element['name']))
//           .toList();
//       isLoading = false;
//       askQuestion(); // Yükleme tamamlandıktan sonra ilk soruyu göster
//       notifyListeners();
//     } else {
//       throw Exception('Failed to load elements');
//     }
//   }

//   void askQuestion() {
//     elements.shuffle();
//     PeriodicElement newElement = elements.first;
//     questionSymbol = newElement.symbol.toString();
//     correctAnswer = newElement.name.toString();

//     options.clear();
//     options.add(correctAnswer);

//     while (options.length < 4) {
//       PeriodicElement randomOption =
//           elements[Random().nextInt(elements.length)];
//       if (!options.contains(randomOption.name)) {
//         options.add(randomOption.name.toString());
//       }
//     }

//     options.shuffle();
//     isCorrectAnswerSelected = false;
//     notifyListeners();
//   }

//   void checkAnswer(String selectedOption) {
//     if (isCorrectAnswerSelected) return;

//     isCorrectAnswerSelected = true;

//     if (selectedOption == correctAnswer) {
//       correctCount++;
//       showAnswerDialog('Doğru', 'Cevap doğru!');
//     } else {
//       wrongCount++;
//       showAnswerDialog('Yanlış', 'Cevap yanlış.');
//     }

//     notifyListeners();
//   }

//   void checkAnswer(String selectedOption, BuildContext context) {
//     if (isCorrectAnswerSelected) return;

//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text(isCorrectAnswerSelected ? 'Doğru' : 'Yanlış'),
//           content:
//               Text(isCorrectAnswerSelected ? 'Cevap doğru!' : 'Cevap yanlış.'),
//           actions: <Widget>[
//             TextButton(
//               child: Text('Tamam'),
//               onPressed: () {
//                 Navigator.of(context).pop(); // Popup'ı kapat

//                 if (isCorrectAnswerSelected) {
//                   correctCount++;
//                 } else {
//                   wrongCount++;
//                 }
//                 askQuestion(); // Yeni soru sor
//                 notifyListeners();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void showAnswerDialog(String title, String content, BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text(title),
//           content: Text(content),
//           actions: <Widget>[
//             TextButton(
//               child: Text('Tamam'),
//               onPressed: () {
//                 Navigator.of(context).pop(); // Popup'ı kapat

//                 if (isCorrectAnswerSelected) {
//                   correctCount++;
//                 } else {
//                   wrongCount++;
//                 }
//                 askQuestion(); // Yeni soru sor
//                 notifyListeners();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   void moveToNextExample() {
//     elements.shuffle();
//     PeriodicElement newElement = elements.first;
//     correctAnswer = newElement.name.toString();

//     options.clear();
//     options.add(correctAnswer);

//     while (options.length < 4) {
//       PeriodicElement randomOption =
//           elements[Random().nextInt(elements.length)];
//       if (!options.contains(randomOption.name)) {
//         options.add(randomOption.name.toString());
//       }
//     }

//     options.shuffle();
//     isCorrectAnswerSelected = false;

//     notifyListeners();
//   }
// }
