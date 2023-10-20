import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homy_hon/constants.dart';
import 'package:homy_hon/core/utils/app_routers.dart';
import 'package:homy_hon/core/widgets/custom_image_widget.dart';

import '../../../../property_details/presentation/views/widgets/details_widgets/custom_like_button.dart';

class NewestPropertyListViewItem extends StatelessWidget {
  const NewestPropertyListViewItem({
    super.key,
    required this.name,
    required this.prise,
    required this.status,
    required this.location,
    required this.image,
    required this.type,
    required this.id,
    required this.editable,
  });
  final String name;
  final String image;
  final String type;
  final String prise;
  final String status;
  final String location;
  final int id;
  final bool editable;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        GoRouter.of(context)
            .push(AppRouter.kPropertyDetailsView, extra: [id, editable]);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Material(
            borderRadius: BorderRadius.circular(10),
            elevation: 3,
            color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                  color: kWhite, borderRadius: BorderRadius.circular(10)),
              height: MediaQuery.of(context).size.height / 3.3,
              width: MediaQuery.of(context).size.width * 0.405,
              child: Column(
                children: [
                  CustomImage(
                      image: image,
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: 125),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 6),
                        Text(
                          name,
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(color: kBlack),
                        ),
                        const SizedBox(height: 9),
                        Row(
                          children: [
                            const Icon(
                              Icons.house_outlined,
                              size: 20,
                              color: kLightBlue,
                            ),
                            const SizedBox(width: 4),
                            Flexible(
                              child: RichText(
                                overflow: TextOverflow.ellipsis,
                                strutStyle: StrutStyle(fontSize: 15.0),
                                text: TextSpan(
                                    style: TextStyle(color: kGrey), text: name),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 2),
                        Row(
                          children: [
                            const Icon(
                              Icons.sell_outlined,
                              size: 20,
                              color: kLightBlue,
                            ),
                            const SizedBox(width: 4),
                            Flexible(
                              child: RichText(
                                overflow: TextOverflow.ellipsis,
                                strutStyle: StrutStyle(fontSize: 15.0),
                                text: TextSpan(
                                    style: TextStyle(color: kGrey),
                                    text: prise),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 2),
                        Row(
                          children: [
                            const Icon(
                              Icons.help_outline,
                              size: 20,
                              color: kLightBlue,
                            ),
                            const SizedBox(width: 4),
                            Flexible(
                              child: RichText(
                                overflow: TextOverflow.ellipsis,
                                strutStyle: StrutStyle(fontSize: 15.0),
                                text: TextSpan(
                                    style: TextStyle(color: kGrey),
                                    text: status),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 2),
                        Row(
                          children: [
                            const Icon(
                              Icons.location_on_outlined,
                              size: 20,
                              color: kLightBlue,
                            ),
                            const SizedBox(width: 4),
                            //   Text(
                            //     location,
                            //      maxLines: 1,
                            //      softWrap: true,
                            // overflow: TextOverflow.ellipsis,
                            //     style: const TextStyle(color: kGrey),
                            //   ),

                            Flexible(
                              child: RichText(
                                overflow: TextOverflow.ellipsis,
                                strutStyle: StrutStyle(fontSize: 15.0),
                                text: TextSpan(
                                    style: TextStyle(color: kGrey),
                                    text: location),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                      ],
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
