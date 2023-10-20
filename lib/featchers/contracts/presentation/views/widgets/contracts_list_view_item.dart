import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:homy_hon/constants.dart';
import 'package:homy_hon/core/utils/app_routers.dart';
import 'package:homy_hon/core/utils/textStyles.dart';
import 'package:homy_hon/featchers/contracts/data/models/contracts_mode.dart';

class ContractsListViewItem extends StatelessWidget {
  const ContractsListViewItem({
    super.key,
    required this.index,
    required this.contracts,
  });
  final Contracts contracts;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 5,
        child: Container(
          // height: 110,
          decoration: BoxDecoration(
              color: kWhite, borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Text(
                  'Name : ${contracts.list[index].nameFirstParty}',
                  style: TextStyles.textStyle20,
                ),
                Text(
                  'Phone : ${contracts.list[index].phoneNumberFp}',
                  style: TextStyles.textStyle20,
                ),
                Text(
                  'Ratio : ${contracts.list[index].ratio}',
                  style: TextStyles.textStyle20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      contracts.list[index].acceptRefuse == null
                          ? 'pending'
                          : contracts.list[index].acceptRefuse == 1
                              ? 'Accepted '
                              : 'refused',
                      style: TextStyles.textStyle16.copyWith(
                        color: contracts.list[index].acceptRefuse == null
                            ? kOrange
                            : contracts.list[index].acceptRefuse == 1
                                ? kGreen
                                : kRed,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        GoRouter.of(context).push(
                          AppRouter.kPropertyDetailsView,
                          extra: [contracts.list[index].propertyId, false],
                        );
                      },
                      child: const Text(
                        'see property',
                        style: TextStyles.underlinedTextStyle,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
