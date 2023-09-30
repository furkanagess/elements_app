// ignore_for_file: library_private_types_in_public_api

import 'package:elements_app/feature/model/periodic_element.dart';
import 'package:elements_app/feature/view/elements/mixin/all_elements_mixin.dart';
import 'package:elements_app/feature/view/quiz/view/quiz_view.dart';
import 'package:elements_app/product/constants/app_colors.dart';
import 'package:elements_app/product/extensions/context_extensions.dart';
import 'package:elements_app/product/widget/container/element_container.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ElementsListView extends StatefulWidget {
  final String apiType;
  final String title;
  const ElementsListView({
    super.key,
    required this.apiType,
    required this.title,
  });

  @override
  _ElementsListViewState createState() => _ElementsListViewState();
}

class _ElementsListViewState extends State<ElementsListView>
    with AllElementsMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: quizFabButton(context),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: isLoading
          ? Center(
              child: Lottie.asset(
                'assets/lottie/loading_chemistry.json',
                fit: BoxFit.cover,
                reverse: true,
                repeat: true,
                height: context.dynamicHeight(0.1),
              ),
            )
          : FutureBuilder<List<PeriodicElement>>(
              future: elementList,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: Lottie.asset(
                      'assets/lottie/loading_chemistry.json',
                      fit: BoxFit.cover,
                      reverse: true,
                      repeat: true,
                      height: context.dynamicHeight(0.1),
                    ),
                  );
                } else {
                  final elements = snapshot.data;
                  return ListView.builder(
                    itemCount: elements!.length,
                    itemBuilder: (context, index) {
                      final element = elements[index];
                      return ElementContainer(element: element);
                    },
                  );
                }
              },
            ),
    );
  }

  FloatingActionButton quizFabButton(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(
        Icons.quiz_outlined,
        color: AppColors.background,
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => QuizView(
              apiType: widget.apiType,
              title: widget.title,
            ),
          ),
        );
      },
    );
  }
}
