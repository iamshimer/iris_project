import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skeletons/skeletons.dart';

import '../controllers/home_controller.dart';

class PageViewSkeleton extends GetView<HomeController> {
  const PageViewSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller.pageController,
      children: [
        Container(
          margin: const EdgeInsets.all(0),
          padding: const EdgeInsets.all(10),
          child: SkeletonLine(
            style: SkeletonLineStyle(
                height: 200,
                width: 350,
                borderRadius: BorderRadius.circular(8)),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(0),
          padding: const EdgeInsets.all(10),
          child: SkeletonLine(
            style: SkeletonLineStyle(
                height: 200,
                width: 350,
                borderRadius: BorderRadius.circular(8)),
          ),
        ),
      ],
    );
  }
}
