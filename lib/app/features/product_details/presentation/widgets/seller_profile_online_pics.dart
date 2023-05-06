import 'package:flutter/material.dart';

class SellerProfileOnlinePics extends StatelessWidget {
  final String profilePics;
  final String storeName;
  final int lastActiveTime;
  const SellerProfileOnlinePics(
      {super.key,
      required this.profilePics,
      required this.lastActiveTime,
      required this.storeName});

  @override
  Widget build(BuildContext context) {
    TextTheme primaryTextTheme = Theme.of(context).primaryTextTheme;
    return Stack(
      children: [
        CircleAvatar(
          backgroundImage: AssetImage(profilePics),
          backgroundColor: Theme.of(context).shadowColor,
          radius: 40,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              storeName,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: primaryTextTheme.headlineSmall!
                  .copyWith(fontWeight: FontWeight.w900),
            ),
          ),
        ),
        Positioned(
            bottom: 5,
            right: 5,
            child: Container(
              height: 15,
              width: 15,
              decoration: BoxDecoration(
                color: lastIconColorFormatter(lastSeenInMin: lastActiveTime),
                  border:
                      Border.all(color: Theme.of(context).cardColor, width: 3),
                  borderRadius: const BorderRadius.all(Radius.circular(100))),
            ))
      ],
    );
  }

  lastIconColorFormatter({required int lastSeenInMin}) {
    if (lastSeenInMin < 2) {
      return Colors.green;
    } else if (lastSeenInMin < 30) {
      return Colors.grey.shade300;
    } else {
      return Colors.amber;
    }
  }
}
