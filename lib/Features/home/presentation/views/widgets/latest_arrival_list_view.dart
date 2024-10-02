import 'package:flutter/material.dart';

import 'latest_arrival_item.dart';

class LatestArrivalListView extends StatelessWidget {
  const LatestArrivalListView({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) => const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: LatestArrivalItem(),
        ),
      ),
    );
  }
}
