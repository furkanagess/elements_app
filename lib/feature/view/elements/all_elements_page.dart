// ignore_for_file: library_private_types_in_public_api

import 'package:elements_app/feature/model/periodic_element.dart';
import 'package:elements_app/product/constants/api_types.dart';
import 'package:elements_app/product/constants/app_colors.dart';
import 'package:elements_app/feature/service/api_service.dart';
import 'package:elements_app/product/constants/app_strings.dart';
import 'package:elements_app/product/widget/container/element_container.dart';
import 'package:flutter/material.dart';

class AllElementsPage extends StatefulWidget {
  const AllElementsPage({super.key});

  @override
  _AllElementsPageState createState() => _AllElementsPageState();
}

class _AllElementsPageState extends State<AllElementsPage> {
  final ApiService _apiService = ApiService();
  late Future<List<PeriodicElement>> _elementList;

  @override
  void initState() {
    super.initState();
    _elementList = _apiService.fetchElements(ApiTypes.allElements);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.background,
        title: const Text(AppStrings.allElements),
      ),
      body: FutureBuilder<List<PeriodicElement>>(
        future: _elementList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text(AppStrings.errorMsg));
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
}
