import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BannerLoaderWidget extends StatelessWidget {
  const BannerLoaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Container(
            height: 400,
            width: MediaQuery.of(context).size.width,
            color: Colors.grey.shade100,
            child: Column(children: [
              Container(
            height:20,
            width: 200,
            color: Colors.grey.shade700,
          ),
            ],),
          ),
          const SizedBox(
            height: 2,
          ),
          
          
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(5, (index) => Column(
                children: [
                  Container(
                    height: 40,
                    width: 40,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
          
              borderRadius:const  BorderRadius.all(Radius.circular(8)),
              color: Theme.of(context).highlightColor),
                    
                  ),
                 const SizedBox(height:8),
                  Container(
                    height: 10,
                    width: 30,
                    color: Colors.grey.shade100,
                  ),
                ],
              )),),
          ),
          const SizedBox(
            height: 2,
          ),
        ],
      ),
    );
  }
}
