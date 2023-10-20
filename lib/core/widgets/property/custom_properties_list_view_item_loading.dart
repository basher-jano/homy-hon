import 'package:flutter/material.dart';
import 'package:homy_hon/core/widgets/custom_shimmer_widget.dart';

import '../../../constants.dart';

class PropertyItemLoading extends StatelessWidget {
  const PropertyItemLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Material(
          borderRadius: BorderRadius.circular(15),
          elevation: 5,
          color: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
                color: kWhite, borderRadius: BorderRadius.circular(15)),
            height: 125,
            width: MediaQuery.of(context).size.width * 0.9,
            child: Row(
              children: [
                CustomShimmer(
                  height: 125,
                  width: MediaQuery.of(context).size.width * 0.4,
                  radius: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 6),
                      CustomShimmer(
                        height: 10,
                        width: MediaQuery.of(context).size.width * 0.3,
                        radius: 15,
                      ),
                      const SizedBox(height: 9),
                      Row(
                        children: const [
                          CustomShimmer(
                            height: 15,
                            width: 15,
                            radius: 7,
                          ),
                          SizedBox(width: 4),
                          CustomShimmer(
                            height: 15,
                            width: 50,
                            radius: 7,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: const [
                          CustomShimmer(
                            height: 15,
                            width: 15,
                            radius: 7,
                          ),
                          SizedBox(width: 4),
                          CustomShimmer(
                            height: 15,
                            width: 50,
                            radius: 7,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: const [
                          CustomShimmer(
                            height: 15,
                            width: 15,
                            radius: 7,
                          ),
                          SizedBox(width: 4),
                          CustomShimmer(
                            height: 15,
                            width: 50,
                            radius: 7,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: const [
                          CustomShimmer(
                            height: 15,
                            width: 15,
                            radius: 7,
                          ),
                          SizedBox(width: 4),
                          CustomShimmer(
                            height: 15,
                            width: 50,
                            radius: 7,
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
    );
  }
}
