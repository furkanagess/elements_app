import 'package:elements_app/feature/model/info.dart';
import 'package:elements_app/feature/service/api_service.dart';
import 'package:elements_app/feature/view/info/subInfo/elementType/element_type_view.dart';
import 'package:flutter/material.dart';

mixin ElementTypeMixin on State<ElementTypeView> {
  final ApiService _apiService = ApiService();
  late Future<List<Info>> infoList;
  late bool isLoading;

  @override
  void initState() {
    isLoading = true;
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
    infoList = _apiService.fetchInfo(widget.apiType);
    super.initState();
  }
}
