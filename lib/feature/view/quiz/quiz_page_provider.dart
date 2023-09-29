// import 'package:elements_app/feature/provider/quiz_provider.dart';
// import 'package:elements_app/product/constants/app_colors.dart';
// import 'package:elements_app/product/extensions/context_extensions.dart';
// import 'package:elements_app/product/widget/container/element_symbol_container.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class PeriodicTableQuizScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//       backgroundColor: AppColors.background,
//       appBar: appBar(),
//       body: Padding(
//         padding: context.paddingNormal,
//         child: Consumer<ElementProvider>(
//           builder: (context, provider, _) {
//             return Column(
//               children: [
//                 Expanded(
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Row(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Container(
//                             height: context.dynamicHeight(0.05),
//                             width: context.dynamicWidth(0.1),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10),
//                               color: AppColors.glowGreen,
//                             ),
//                             child: const Icon(
//                               Icons.check,
//                               color: AppColors.background,
//                             ),
//                           ),
//                           SizedBox(
//                             width: context.dynamicWidth(0.03),
//                           ),
//                           Text(
//                             provider.correctCount.toString(),
//                             style: context.textTheme.headlineSmall?.copyWith(
//                               color: AppColors.white,
//                             ),
//                           ),
//                         ],
//                       ),
//                       Row(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Container(
//                             height: context.dynamicHeight(0.05),
//                             width: context.dynamicWidth(0.1),
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10),
//                               color: AppColors.powderRed,
//                             ),
//                             child: const Icon(
//                               Icons.close,
//                               color: AppColors.background,
//                             ),
//                           ),
//                           SizedBox(
//                             width: context.dynamicWidth(0.03),
//                           ),
//                           Text(
//                             provider.wrongCount.toString(),
//                             style: context.textTheme.headlineSmall?.copyWith(
//                               color: AppColors.white,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 spacer(context, 0.05),
//                 Expanded(
//                   flex: 2,
//                   child: ElementSymbolContainer(
//                     title: provider.questionSymbol,
//                     color: AppColors.purple,
//                     shadowColor: AppColors.shPurple,
//                   ),
//                 ),
//                 spacer(context, 0.05),
//                 Expanded(
//                   flex: 8,
//                   child: GridView.count(
//                     crossAxisCount: 2,
//                     children: provider.options.map((selectedOption) {
//                       return Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: InkWell(
//                           onTap: () {
//                             provider.checkAnswer(selectedOption, context);
//                           },
//                           child: Container(
//                             decoration: BoxDecoration(
//                               border: Border.all(width: 0.5),
//                               boxShadow: const [
//                                 BoxShadow(
//                                   color: AppColors.shTurquoise,
//                                   offset: Offset(4, 4),
//                                   spreadRadius: 1,
//                                 ),
//                               ],
//                               borderRadius: BorderRadius.circular(10),
//                               color: AppColors.turquoise,
//                             ),
//                             height: context.dynamicHeight(0.15),
//                             width: context.dynamicWidth(0.30),
//                             child: Center(
//                               child: Text(
//                                 selectedOption,
//                                 style: context.textTheme.headlineSmall
//                                     ?.copyWith(
//                                         color: AppColors.background,
//                                         fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ),
//                         ),
//                       );
//                     }).toList(),
//                   ),
//                 ),
//               ],
//             );
//           },
//         ),
//       ),
//       //floatingActionButton: fabButton(),
//     );

//     // return Scaffold(
//     //   appBar: AppBar(
//     //     title: Text('Periodik Tablo Quiz Uygulaması'),
//     //   ),
//     //   body: Center(
//     //     child: Column(
//     //       mainAxisAlignment: MainAxisAlignment.center,
//     //       children: [
//     //         Consumer<ElementProvider>(
//     //           builder: (context, elementProvider, _) {
//     //             if (elementProvider.isLoading) {
//     //               return CircularProgressIndicator();
//     //             } else {
//     //               return Column(
//     //                 children: [
//     //                   Row(
//     //                     mainAxisAlignment: MainAxisAlignment.center,
//     //                     children: [
//     //                       Text(
//     //                           'Doğru: ${elementProvider.correctCount}  Yanlış: ${elementProvider.wrongCount}'),
//     //                     ],
//     //                   ),
//     //                   SizedBox(height: 20.0),
//     //                   Text(
//     //                     'Element Sembolü: ${elementProvider.questionSymbol}',
//     //                     style: TextStyle(fontSize: 24.0),
//     //                   ),
//     //                   SizedBox(height: 20.0),
//     //                   GridView.count(
//     //                     crossAxisCount: 2,
//     //                     children: elementProvider.options.map((option) {
//     //                       return Padding(
//     //                         padding: const EdgeInsets.all(8.0),
//     //                         child: ElevatedButton(
//     //                           onPressed: () {
//     //                             elementProvider.checkAnswer(option);
//     //                           },
//     //                           child: Text(option),
//     //                         ),
//     //                       );
//     //                     }).toList(),
//     //                   ),
//     //                 ],
//     //               );
//     //             }
//     //           },
//     //         ),
//     //       ],
//     //     ),
//     //   ),
//     //   floatingActionButton: FloatingActionButton(
//     //     onPressed: () {
//     //       Provider.of<ElementProvider>(context, listen: false).askQuestion();
//     //     },
//     //     child: Icon(Icons.refresh),
//     //   ),
//     // );
//   }

//   FloatingActionButton fabButton(ElementProvider provider) {
//     return FloatingActionButton(
//       backgroundColor: AppColors.pink,
//       onPressed: provider.askQuestion,
//       child: const Icon(
//         Icons.refresh,
//         color: AppColors.background,
//       ),
//     );
//   }

//   SizedBox spacer(BuildContext context, double value) =>
//       SizedBox(height: context.dynamicHeight(value));

//   AppBar appBar() {
//     return AppBar(
//       backgroundColor: AppColors.background,
//       elevation: 0,
//     );
//   }

//   GridView optionAnswerGrid(BuildContext context, ElementProvider provider) {
//     return GridView.count(
//       crossAxisCount: 2,
//       children: provider.options.map((option) {
//         return Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: InkWell(
//             onTap: () {
//               provider.checkAnswer(option, context);
//             },
//             child: Container(
//               decoration: BoxDecoration(
//                 border: Border.all(width: 0.5),
//                 boxShadow: const [
//                   BoxShadow(
//                     color: AppColors.shTurquoise,
//                     offset: Offset(4, 4),
//                     spreadRadius: 1,
//                   ),
//                 ],
//                 borderRadius: BorderRadius.circular(10),
//                 color: AppColors.turquoise,
//               ),
//               height: context.dynamicHeight(0.15),
//               width: context.dynamicWidth(0.30),
//               child: Center(
//                 child: Text(
//                   option,
//                   style: context.textTheme.headlineSmall?.copyWith(
//                       color: AppColors.background, fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ),
//           ),
//         );
//       }).toList(),
//     );
//   }

//   ElementSymbolContainer symbolContainer(ElementProvider provider) {
//     return ElementSymbolContainer(
//       title: provider.questionSymbol,
//       color: AppColors.purple,
//       shadowColor: AppColors.shPurple,
//     );
//   }

//   Row wrongAndCorrectCounter(BuildContext context, ElementProvider provider) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Container(
//               height: context.dynamicHeight(0.05),
//               width: context.dynamicWidth(0.1),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 color: AppColors.glowGreen,
//               ),
//               child: const Icon(
//                 Icons.check,
//                 color: AppColors.background,
//               ),
//             ),
//             SizedBox(
//               width: context.dynamicWidth(0.03),
//             ),
//             Text(
//               "$provider.correctCount",
//               style: context.textTheme.headlineSmall?.copyWith(
//                 color: AppColors.white,
//               ),
//             ),
//           ],
//         ),
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Container(
//               height: context.dynamicHeight(0.05),
//               width: context.dynamicWidth(0.1),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 color: AppColors.powderRed,
//               ),
//               child: const Icon(
//                 Icons.close,
//                 color: AppColors.background,
//               ),
//             ),
//             SizedBox(
//               width: context.dynamicWidth(0.03),
//             ),
//             Text(
//               "$provider.wrongCount",
//               style: context.textTheme.headlineSmall?.copyWith(
//                 color: AppColors.white,
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
