import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class AnnounceReplace extends StatelessWidget {
  const AnnounceReplace({super.key});

  @override
  Widget build(BuildContext context) {
    var container = Container(
      padding: const EdgeInsets.all(3),
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(
        Radius.circular(12),
      )),
      height: 113,
      child: SkeletonLine(
        style: SkeletonLineStyle(
            height: 200, width: 350, borderRadius: BorderRadius.circular(8)),
      ),
    );
    return ListView(
      children: [
        container,
        container,
        container,
        container,
        container,
      ],
    );
  }
}
