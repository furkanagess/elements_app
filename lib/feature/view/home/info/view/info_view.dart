import 'package:elements_app/feature/model/info.dart';
import 'package:elements_app/feature/view/home/info/subInfo/elementType/view/element_type_view.dart';
import 'package:elements_app/feature/view/home/info/mixin/info_mixin.dart';
import 'package:elements_app/product/constants/api_types.dart';
import 'package:elements_app/product/constants/app_colors.dart';
import 'package:elements_app/product/extensions/context_extensions.dart';
import 'package:elements_app/product/widget/container/what_is_container.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';

class InfoView extends StatefulWidget {
  final String apiType;
  final String title;
  const InfoView({
    super.key,
    required this.apiType,
    required this.title,
  });

  @override
  State<InfoView> createState() => _InfoViewState();
}

class _InfoViewState extends State<InfoView> with InfoViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: quizFabButton(context),
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
          : Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ElementTypeView(
                          apiType: ApiTypes.elementTypes,
                          title: "Element Types",
                        ),
                      ),
                    );
                  },
                  child: Padding(
                    padding: context.paddingNormal,
                    child: Container(
                      height: context.dynamicHeight(0.075),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.shPink,
                            offset: const Offset(4, 4),
                            spreadRadius: 1,
                          ),
                        ],
                        color: AppColors.pink,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: context.paddingLowHorizontal,
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              "assets/svg/question-2.svg",
                              height: context.dynamicHeight(0.05),
                            ),
                            SizedBox(
                              width: context.dynamicWidth(0.03),
                            ),
                            Text(
                              "Element Types",
                              style: context.textTheme.headlineSmall?.copyWith(
                                color: AppColors.background,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.arrow_right_alt_outlined,
                              size: 40,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                FutureBuilder<List<Info>>(
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
              ],
            ),
    );
  }
}
