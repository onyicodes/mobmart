import 'package:flutter/material.dart';
import 'package:mobmart/app/features/home/data/model/reviews_model.dart';
import 'package:mobmart/core/general_widgets/button_widget.dart';

class ReviewCard extends StatelessWidget {
  final ReviewModel review;
  const ReviewCard({Key? key, required this.review}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme primaryTextTheme = Theme.of(context).primaryTextTheme;
    return Card(
        elevation: 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading:  CircleAvatar(radius: 20, backgroundImage: AssetImage(review.photo),),
              title: Text(
                review.name,
                style: primaryTextTheme.displaySmall,
              ),
              trailing: SizedBox(width: 90,child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Icon(Icons.star_rounded, color: Colors.amber.shade600,),
                Text(review.rating.toStringAsFixed(1)),
                Icon(Icons.more_horiz_rounded, color:Theme.of(context).iconTheme.color,)
              ],),),
              
            ),
            Align(
              alignment: Alignment.center,
              child: Wrap(
                runSpacing: 4,
                spacing: 4,
                children: [
                  ActionChip(
                    padding: EdgeInsets.zero,
                    labelPadding: const EdgeInsets.symmetric(horizontal: 6),
                    label: Text("product in good condition", style: primaryTextTheme.bodySmall!.copyWith(color:  Theme.of(context).primaryColorDark,  fontWeight: FontWeight.bold),),
                  backgroundColor: Theme.of(context).primaryColorLight,onPressed: (){},
                  side: BorderSide(color:Theme.of(context).primaryColor ,),
                  ),
            
                  ActionChip(
                    padding: EdgeInsets.zero,
                    labelPadding: const EdgeInsets.symmetric(horizontal: 6),
                    label: Text("very fast delivery", style: primaryTextTheme.bodySmall!.copyWith(color:  Theme.of(context).primaryColorDark, fontWeight: FontWeight.bold),),
                  backgroundColor: Theme.of(context).primaryColorLight,onPressed: (){},
                  side: BorderSide(color:Theme.of(context).primaryColor,  ),
                  ),
                  ActionChip(
                    padding: EdgeInsets.zero,
                    labelPadding: const EdgeInsets.symmetric(horizontal: 6),
                    label: Text("fast seller response", style: primaryTextTheme.bodySmall!.copyWith(color:  Theme.of(context).primaryColorDark,  fontWeight: FontWeight.bold),),
                  backgroundColor: Theme.of(context).primaryColorLight,
                  onPressed: (){},
                  side: BorderSide(color:Theme.of(context).primaryColor ,),
                  ),
               
              ],),
            ),
            Padding(
              padding: const EdgeInsets.only(left:16.0, top: 8, right: 8,),
              child: Text(
                review.message,
                style: primaryTextTheme.headlineMedium,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton.icon(onPressed: (){
            
                  }, icon: Icon(Icons.thumb_up_alt_rounded, color:Theme.of(context).primaryColorDark ,), label:Text("Helpful?", style: primaryTextTheme.headlineMedium!.copyWith(color: Theme.of(context).primaryColorDark),)),
            
                  Text(review.time)
                ],
              ),
            )
          ],
        ));
  }
}
