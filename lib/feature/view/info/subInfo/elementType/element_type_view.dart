import 'package:elements_app/feature/model/info.dart';
import 'package:elements_app/feature/mixin/elementType/element_type_mixin.dart';

import 'package:elements_app/product/widget/loadingBar/loading_bar.dart';
import 'package:elements_app/product/widget/container/what_is_container.dart';
import 'package:elements_app/product/widget/scaffold/app_scaffold.dart';
import 'package:flutter/material.dart';

class ElementTypeView extends StatefulWidget {
  final String apiType;
  final String title;
  const ElementTypeView({
    super.key,
    required this.apiType,
    required this.title,
  });

  @override
  State<ElementTypeView> createState() => _ElementTypeViewState();
}

class _ElementTypeViewState extends State<ElementTypeView>
    with ElementTypeMixin {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              title: Text(widget.title),
            ),
          ],
          body: isLoading
              ? const LoadingBar()
              : FutureBuilder<List<Info>>(
                  future: infoList,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const LoadingBar();
                    } else {
                      final infos = snapshot.data;
                      return ListView.builder(
                        itemCount: infos!.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final info = infos[index];
                          return WhatIsContainer(info: info);
                        },
                      );
                    }
                  },
                ),
        ),
      ),
    );
  }
}
