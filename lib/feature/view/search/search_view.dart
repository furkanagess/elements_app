import 'dart:convert';

import 'package:elements_app/feature/model/periodic_element.dart';
import 'package:elements_app/feature/provider/localization_provider.dart';
import 'package:elements_app/feature/view/quiz/symbol/quiz_symbol_view.dart';
import 'package:elements_app/product/constants/api_types.dart';
import 'package:elements_app/product/constants/app_colors.dart';
import 'package:elements_app/product/constants/assets_constants.dart';
import 'package:elements_app/product/constants/stringConstants/en_app_strings.dart';
import 'package:elements_app/product/constants/stringConstants/tr_app_strings.dart';
import 'package:elements_app/product/extensions/context_extensions.dart';
import 'package:elements_app/product/widget/container/element_container.dart';
import 'package:elements_app/product/widget/loadingBar/loading_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart' as http;

import 'package:provider/provider.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController searchController = TextEditingController();
  late List<PeriodicElement> elements;
  late List<PeriodicElement> filteredElements;
  late bool isLoading;
  @override
  void initState() {
    super.initState();
    elements = [];
    filteredElements = [];
    isLoading = true;
    Future.delayed(const Duration(milliseconds: 1500), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  Future<List<PeriodicElement>> loadElements() async {
    if (elements.isEmpty) {
      final response = await http.get(Uri.parse(ApiTypes.allElements));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        elements =
            data.map((element) => PeriodicElement.fromJson(element)).toList();
        filteredElements = List.from(elements);
        return elements;
      } else {
        throw Exception('Failed to load elements');
      }
    } else {
      return elements;
    }
  }

  void filterElements(String query, bool isTr) {
    query = query.toLowerCase();
    setState(() {
      filteredElements = elements
          .where(
            (element) =>
                (isTr ? element.trName! : element.enName!)
                    .toLowerCase()
                    .contains(query) ||
                element.number.toString().contains(query),
          )
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isTr = Provider.of<LocalizationProvider>(context).isTr;
    return Scaffold(
        floatingActionButton: quizFabButton(context),
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                title: TextField(
                  controller: searchController,
                  onChanged: (value) {
                    filterElements(value, isTr);
                  },
                  decoration: InputDecoration(
                    labelText: isTr
                        ? TrAppStrings.searchLabel
                        : EnAppStrings.searchLabel,
                  ),
                ),
              ),
            ];
          },
          body: isLoading
              ? const LoadingBar()
              : Column(
                  children: [
                    Expanded(
                      child: FutureBuilder(
                        future: loadElements(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: LoadingBar(),
                            );
                          } else if (filteredElements.isEmpty) {
                            return Center(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                LottieBuilder.asset(
                                  AssetConstants.instance.lottieSearch,
                                  height: context.dynamicHeight(0.2),
                                ),
                                SizedBox(
                                  height: context.dynamicHeight(0.02),
                                ),
                                Text(
                                  isTr
                                      ? TrAppStrings.searchResult
                                      : EnAppStrings.searchResult,
                                  style: context.textTheme.headlineSmall,
                                )
                              ],
                            ));
                          } else {
                            return ListView.builder(
                              itemCount: filteredElements.length,
                              itemBuilder: (context, index) {
                                return ElementContainer(
                                  element: filteredElements[index],
                                );
                              },
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
        ));
  }

  FloatingActionButton quizFabButton(BuildContext context) {
    return FloatingActionButton(
      splashColor: AppColors.glowGreen,
      child: SvgPicture.asset(
        AssetConstants.instance.svgGameThree,
        colorFilter:
            const ColorFilter.mode(AppColors.background, BlendMode.srcIn),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const QuizSymbolView(
              apiType: ApiTypes.allElements,
              title: TrAppStrings.allElements,
            ),
          ),
        );
      },
    );
  }
}
