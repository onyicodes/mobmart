import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProductShimmerLoadingCard extends StatelessWidget {
  const ProductShimmerLoadingCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height:150,
              width: 200,
              color: Colors.grey.shade100,
            ),
            const SizedBox(
              height: 2,
            ),
            Container(
              height: 12,
              width: 120,
              color: Colors.grey.shade100,
            ),
            const SizedBox(
              height: 2,
            ),
            Container(
              height: 10,
              width: 80,
              color: Colors.grey.shade100,
            ),
            const SizedBox(
              height: 2,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.star_rounded,
                        color: Colors.yellow,
                      ),
                      Container(
                        height: 10,
                        width: 80,
                        color: Colors.grey.shade100,
                      ),
                     
                    ],
                  ),
                  Container(
                    height: 10,
                    width: 40,
                    color: Colors.grey.shade100,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 2,
            ),
          ],
        ),
      ),
    );
  }
}
