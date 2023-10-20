import 'package:flutter/material.dart';
import 'package:homy_hon/constants.dart';
import 'package:homy_hon/core/utils/textStyles.dart';
import 'package:homy_hon/core/widgets/custom_image_widget.dart';

class AdvertisementsListViewItem extends StatelessWidget {
  const AdvertisementsListViewItem({
    super.key,
    required this.imagehieght,
    required this.padding,
    required this.title,
    required this.image,
    this.link,
    this.description,
  });
  final double imagehieght;
  final double padding;
  final String? title;
  final String? image;
  final String? link;
  final String? description;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: Material(
        borderRadius: BorderRadius.circular(15),
        elevation: 5,
        color: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
              color: kWhite, borderRadius: BorderRadius.circular(15)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: Text(
                  title ?? "",
                  style: TextStyles.textStyle20
                      .copyWith(fontWeight: FontWeight.w900),
                ),
              ),
              Material(
               borderRadius: BorderRadius.circular(10),
                child: CustomImage(
                  image: image ?? "",
                  width: MediaQuery.of(context).size.width,
                  height: imagehieght+18,
                  radius: 0,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 200,
                      child: Text(
                        description ?? "",
                        style: TextStyles.NormalTextStyle.copyWith(fontSize: 16),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
