import 'package:elements_app/feature/model/info.dart';
import 'package:elements_app/feature/view/home/info/subInfo/elementType/mixin/element_type_mixin.dart';
import 'package:elements_app/product/extensions/context_extensions.dart';
import 'package:elements_app/product/widget/container/what_is_container.dart';
import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

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
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            title: Text(widget.title),
          ),
        ],
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
            : FutureBuilder<List<Info>>(
                future: infoList,
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
    );
  }
}
