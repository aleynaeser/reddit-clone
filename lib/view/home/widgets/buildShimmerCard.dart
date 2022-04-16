import 'package:flutter/material.dart';
import 'package:reddit_clone/view/home/widgets/shimmerCard.dart';

import '../../../core/utils/constants.dart';

Widget buildRedditShimmer() {
  return Builder(builder: (context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: ShimmerCard(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildShimmerTitle(),
            buildShimmerThumbnail(context),
            buildShimmerIcons()
          ],
        ),
      ),
    );
  });
}

Widget buildShimmerTitle() {
  return Padding(
    padding: const EdgeInsets.only(top: padding, left: padding, right: padding),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ShimmerCard(
              width: 100,
              height: 10,
            ),
            Row(
              children: [
                ShimmerCard(
                  width: 30,
                  height: 20,
                ),
                const SizedBox(
                  width: 8,
                ),
                ShimmerCard(
                  width: 10,
                  height: 40,
                ),
              ],
            ),
          ],
        ),
        ShimmerCard(
          width: 250,
          height: 30,
        ),
      ],
    ),
  );
}

Widget buildShimmerThumbnail(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(padding),
    child: ShimmerCard(
      width: MediaQuery.of(context).size.width,
      height: 50,
    ),
  );
}

Widget buildShimmerIcons() {
  return Padding(
    padding: const EdgeInsets.all(padding),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ShimmerCard(
              width: 20,
              height: 20,
            ),
            const SizedBox(
              width: 8,
            ),
            ShimmerCard(
              width: 20,
              height: 20,
            ),
          ],
        ),
        ShimmerCard(
          width: 20,
          height: 20,
        ),
        ShimmerCard(
          width: 20,
          height: 20,
        ),
        ShimmerCard(
          width: 20,
          height: 20,
        ),
      ],
    ),
  );
}
