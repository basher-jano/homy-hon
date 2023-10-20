import 'package:flutter/material.dart';

import 'advertisements_list_view_item.dart';

class AdvertisementsListView extends StatelessWidget {
  const AdvertisementsListView({super.key, required this.ads});
  final List<dynamic> ads;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: ads.length,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: AdvertisementsListViewItem(
            imagehieght: 300,
            padding: 20,
            image: ads[index].image,
            title: ads[index].companyName,
            description:ads[index].description),
      ),
    );
  }
}
