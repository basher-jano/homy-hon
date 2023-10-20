import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:homy_hon/core/utils/app_routers.dart';
import 'package:homy_hon/core/utils/textStyles.dart';
import 'package:homy_hon/featchers/office_details/presentation/manager/office_details_cubit/office_details_cubit.dart';
import 'package:homy_hon/featchers/office_details/presentation/manager/related_properties_cubit/related_properties_cubit.dart';
import '../../../../../constants.dart';
import '../../../../../constants.dart';
import '../../../../../core/widgets/custom_image_widget.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CustomOfficeItem extends StatelessWidget {
  const CustomOfficeItem({
    super.key,
    required this.name,
    required this.location,
    required this.image,
    required this.account_id,
    required this.id,
    required this.rating,
    required this.phone_number,
  });
  final int? account_id;
  final int? id;
  final String? name;
  final String? image;
  final String? location;
  final double rating;
  final int phone_number;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        // GoRouter.of(context).push(AppRouter.kOfficeDetailsView, extra: [id,account_id]);

        GoRouter.of(context).push(
          '/OfficeDetailsView',
          extra: {
            'id': id,
            'account_id': account_id,
          },
        );
        await BlocProvider.of<OfficeDetailsCubit>(context)
            .fetchOfficeDetails(account_id);
        await BlocProvider.of<RelatedPropertiesCubit>(context)
            .fetchRelatedProperties(id);
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
                    image: image.toString(),
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: 125),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 12),
                      Text(
                        name.toString(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: kBlack),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on_outlined,
                            size: 20,
                            color: kLightBlue,
                          ),
                          const SizedBox(width: 4),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.35,
                            child: Text(
                              location.toString(),
                              style: TextStyles.textStyle13G,
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(
                            Icons.phone,
                            size: 20,
                            color: kLightBlue,
                          ),
                          const SizedBox(width: 4),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.35,
                            child: Text(
                              phone_number.toString(),
                              style: TextStyles.textStyle13G,
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 8),
                      RatingBarIndicator(
                        rating: rating,
                        itemBuilder: (context, index) => const Icon(
                          Icons.star,
                          color: kLightBlue,
                        ),
                        itemCount: 5,
                        itemSize: 20.0,
                        direction: Axis.horizontal,
                      ),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
