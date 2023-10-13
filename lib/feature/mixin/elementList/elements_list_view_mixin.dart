import 'package:elements_app/feature/model/periodic_element.dart';
import 'package:elements_app/feature/service/api_service.dart';
import 'package:elements_app/feature/view/elementsList/elements_list_view.dart';
import 'package:flutter/material.dart';

mixin ElementsListViewMixin on State<ElementsListView> {
  final ApiService _apiService = ApiService();
  late Future<List<PeriodicElement>> elementList;
  late bool isLoading;

  @override
  void initState() {
    isLoading = true;
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
    elementList = _apiService.fetchElements(widget.apiType);
    super.initState();
  }
}
