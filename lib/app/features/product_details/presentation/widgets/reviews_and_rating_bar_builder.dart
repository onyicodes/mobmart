import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mobmart_app/app/features/home/data/model/store_rating_model.dart';
import 'package:mobmart_app/app/features/product_details/presentation/widgets/rating_percentage_builder.dart';
import 'package:mobmart_app/core/constants/general_constants.dart';
import 'package:mobmart_app/core/general_widgets/custom_list_space.dart';
import 'package:mobmart_app/core/util/total_reviews_formatter.dart';

class ReviewsAndRatingsBuilder extends StatelessWidget {
  final StoreRatingModel storeRatingModel;
  const ReviewsAndRatingsBuilder({super.key, required this.storeRatingModel});

  @override
  Widget build(BuildContext context) {
    TextTheme primaryTextTheme = Theme.of(context).primaryTextTheme;
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Reviews & Ratings ",
            style: primaryTextTheme.displaySmall,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: storeRatingModel.rating.toString(),
                            style: primaryTextTheme.displayLarge!.copyWith(
                                fontFamily: "Open Sans", fontSize: 40)),
                        WidgetSpan(
                          child: Transform.translate(
                            offset: const Offset(2, -4),
                            child: Text(
                              "/ ${5.toStringAsFixed(1)}",
                              //superscript is usually smaller in size
                              textScaleFactor: 0.7,
                              style: primaryTextTheme.bodyLarge,
                            ),
                          ),
                        )
                      ]),
                    ),
                    CustomListSpacing(
                        spacingValue: ListSpacingValue.spacingV24.value),
                    RatingBar(
                        initialRating: 3.5,
                        allowHalfRating: true,
                        ignoreGestures: true,
                        itemSize: 20,
                        unratedColor: Colors.grey,
                        ratingWidget: RatingWidget(
                            full: const Icon(
                              Icons.star_rounded,
                              color: Colors.amber,
                            ),
                            half: const Icon(
                              Icons.star_half_rounded,
                              color: Colors.amber,
                            ),
                            empty: const Icon(
                              Icons.star_half_rounded,
                              color: Colors.grey,
                            )),
                        onRatingUpdate: (val) {}),
                    CustomListSpacing(
                        spacingValue: ListSpacingValue.spacingV32.value),
                    Text(
                      "${totalReviewsFormatter(rating: storeRatingModel.total)} Reviews",
                      style: primaryTextTheme.headlineMedium!
                          .copyWith(color: Theme.of(context).hintColor),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RatingPercentageBuilder(
                        ratingValue: 5,
                        totalRating: storeRatingModel.total,
                        totalRatingGiven: storeRatingModel.fiveStarRating),
                    RatingPercentageBuilder(
                        ratingValue: 4,
                        totalRating: storeRatingModel.total,
                        totalRatingGiven: storeRatingModel.fourStarRating),
                    RatingPercentageBuilder(
                        ratingValue: 3,
                        totalRating: storeRatingModel.total,
                        totalRatingGiven: storeRatingModel.threeStarRating),
                    RatingPercentageBuilder(
                        ratingValue: 2,
                        totalRating: storeRatingModel.total,
                        totalRatingGiven: storeRatingModel.twoStarRating),
                    RatingPercentageBuilder(
                        ratingValue: 1,
                        totalRating: storeRatingModel.total,
                        totalRatingGiven: storeRatingModel.oneStarRating),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
