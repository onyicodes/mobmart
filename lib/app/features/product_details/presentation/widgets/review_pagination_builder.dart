import 'package:flutter/material.dart';
import 'package:number_paginator/number_paginator.dart';

class ReviewPaginationBuilder extends StatelessWidget {
  final void Function(int index) onPageChange;
  final int currentPageIndex;
  final int numberOfPages;
  ReviewPaginationBuilder(
      {super.key,
      required this.currentPageIndex,
      required this.numberOfPages,
      required this.onPageChange});

  late int numberOfButtonsToDisplay;
  late int from;
  late int to;

//   List _range(int from, int to) => List.generate(to - from + 1, (i) => i + from);
// print(_range(3, 6)); // prints [3, 4, 5, 6]

  @override
  Widget build(BuildContext context) {
    TextTheme primaryTextTheme = Theme.of(context).primaryTextTheme;
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
    // Row(
    //   children: [
    //     InkWell(
    //       onTap: onTapBack,
    //       child: Container(
    //         height: 35,
    //         width: 35,
    //         decoration: BoxDecoration(
    //             borderRadius: BorderRadius.all(Radius.circular(50)),
    //             color: Theme.of(context).shadowColor),
    //         child: Center(
    //             child: Icon(
    //           Icons.arrow_back_ios_new_rounded,
    //           color: Theme.of(context).iconTheme.color,
    //           size: 20,
    //         )),
    //       ),
    //     ),
    //     Container(
    //       width: MediaQuery.of(context).size.width * 0.6,
    //       child: Row(
    //         children: List<Widget>.generate(numberOfPages, (value) {
    //           value++;
    //           if (value < numbeOfPages - 1) {
    //             return TextButton(
    //               child: Text(value.toString(),
    //                   style: currentPageIndex == value
    //                       ? primaryTextTheme.bodyMedium!
    //                           .copyWith(color: Theme.of(context).primaryColor)
    //                       : primaryTextTheme.bodyMedium),
    //               onPressed: () {},
    //             );
    //           } else {
    //             return TextButton(
    //               child: Text('...',
    //                   style: currentPageIndex == value
    //                       ? primaryTextTheme.bodyMedium!
    //                           .copyWith(color: Theme.of(context).primaryColor)
    //                       : primaryTextTheme.bodyMedium),
    //               onPressed: () {},
    //             );
    //           }
    //         }),
    //       ),
    //     ),
    //     InkWell(
    //       onTap: onTapForward,
    //       child: Container(
    //         height: 35,
    //         width: 35,
    //         decoration: BoxDecoration(
    //             borderRadius: BorderRadius.all(Radius.circular(50)),
    //             color: Theme.of(context).shadowColor),
    //         child: Center(
    //             child: Icon(
    //           Icons.arrow_forward_ios_rounded,
    //           color: Theme.of(context).iconTheme.color,
    //           size: 20,
    //         )),
    //       ),
    //     )
    //   ],
    // );
  }

  // startingFrom({required int currentPageIndex , required int numberOfWidgetsToDisplay, required int numberOfPages}) {
  //   if(currentPageIndex < numberOfWidgetsToDisplay)
  //   return (screenSize / 30).floor();
  // }

  numberOfButtonsPerPage({required double screenSize}) {
    return (screenSize / 30).floor();
  }
}
