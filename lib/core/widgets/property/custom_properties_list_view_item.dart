import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homy_hon/core/utils/app_routers.dart';
import 'package:homy_hon/core/utils/textStyles.dart';

import '../../../constants.dart';
import '../custom_image_widget.dart';

class PropertyItem extends StatelessWidget {
  const PropertyItem({
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
  final int id;
  final String name;
  final String image;
  final String type;
  final String prise;
  final String status;
  final String location;
  final bool editable;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("id : " + id.toString());
        GoRouter.of(context)
            .push(AppRouter.kPropertyDetailsView, extra: [id, editable]);
      },
      child: Material(
          borderRadius: BorderRadius.circular(12),
          elevation: 5,
          color: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
                color: kWhite, borderRadius: BorderRadius.circular(12)),
            height: 125,
            width: MediaQuery.of(context).size.width * 0.9,
            child: Row(
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
                          Text(
                            type,
                            style: TextStyles.textStyle13G,
                          )
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
                          Text(
                            prise,
                            style: TextStyles.textStyle13G,
                          )
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
                          Text(
                            status,
                            style: TextStyles.textStyle13G,
                          )
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
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.33,
                            child: Text(
                              location,
                              style: TextStyles.textStyle13G,
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 4),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
