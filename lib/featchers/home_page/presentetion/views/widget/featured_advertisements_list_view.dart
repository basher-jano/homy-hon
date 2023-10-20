import 'package:flutter/material.dart';

import '../../../../advertisements/presentation/views/widgets/advertisements_list_view_item.dart';

class FeaturedAdvertisementsListView extends StatelessWidget {
  const FeaturedAdvertisementsListView({super.key, required this.ads});
  final List<dynamic> ads;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: ads.length,
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(
              height: 80,
              width: 250,
              child: Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: AdvertisementsListViewItem(
                  imagehieght: 120,
                  padding: 8,
                  image: ads[index].image,
                  title: ads[index].companyName,
                  description: ads[index].description??'',
                ),
              ));
        });
  }
}
