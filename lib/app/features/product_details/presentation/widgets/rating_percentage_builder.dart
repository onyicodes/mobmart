import 'package:flutter/material.dart';
import 'package:mobmart/core/util/total_reviews_formatter.dart';

class RatingPercentageBuilder extends StatelessWidget {
  final int ratingValue;
  final int totalRating;
  final int totalRatingGiven;
  const RatingPercentageBuilder(
      {super.key,
      required this.ratingValue,
      required this.totalRating,
      required this.totalRatingGiven});

  @override
  Widget build(BuildContext context) {
    TextTheme primaryTextTheme = Theme.of(context).primaryTextTheme;
    return Row(
      children: [
     const   Icon(
          Icons.star_rounded,
          color: Colors.amber,
        ),
        Text(
          ratingValue.toString(),
          style: primaryTextTheme.headlineMedium,
        ),
       const SizedBox(width: 8,),
        Stack(
          children: [
            Container(
              height: 8,
              width: 140,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                color: Theme.of(context).highlightColor,
              ),
            ),
            Container(
              height: 8,
              width: 140 * (totalRatingGiven / totalRating ),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                color: Theme.of(context).primaryColor,
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            totalReviewsFormatter(rating: totalRatingGiven),
            style: primaryTextTheme.headlineMedium,
          ),
        ),
      ],
    );
  }

  
}
