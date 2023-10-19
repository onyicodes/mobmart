import 'package:flutter/material.dart';
import 'package:number_paginator/number_paginator.dart';

class ReviewPaginationBuilder extends StatelessWidget {
  final void Function(int index) onPageChange;
  final int currentPageIndex;
  final int numberOfPages;
  const ReviewPaginationBuilder(
      {super.key,
      required this.currentPageIndex,
      required this.numberOfPages,
      required this.onPageChange});


  @override
  Widget build(BuildContext context) {
    return NumberPaginator(
      // by default, the paginator shows numbers as center content
      numberPages: 3,
      config: NumberPaginatorUIConfig(
          contentPadding: EdgeInsets.zero,
          buttonUnselectedForegroundColor:
              Theme.of(context).primaryTextTheme.bodyLarge!.color,
          buttonSelectedForegroundColor: Theme.of(context).primaryColor,
          buttonSelectedBackgroundColor: Theme.of(context).canvasColor),
      onPageChange: onPageChange,
    );
   
  }


  numberOfButtonsPerPage({required double screenSize}) {
    return (screenSize / 30).floor();
  }
}
