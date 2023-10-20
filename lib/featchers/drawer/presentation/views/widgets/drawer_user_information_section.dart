import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router/go_router.dart';
import 'package:homy_hon/core/config/user_information.dart';
import 'package:homy_hon/core/utils/app_routers.dart';
import 'package:homy_hon/core/widgets/custom_shimmer_widget.dart';
import 'package:homy_hon/featchers/drawer/presentation/manager/show_profile_cubit/show_profile_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../constants.dart';
import '../../../../../core/utils/textStyles.dart';
import '../../../../../core/widgets/custom_image_widget.dart';
import '../../../../../main.dart';

class DrawerUserInforamtionSection extends StatelessWidget {
  const DrawerUserInforamtionSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShowProfileCubit, ShowProfileState>(
      builder: (context, state) {
        if (state is ShowProfileSuccess) {
          return Container(
            color: kLightBlue2,
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                CustomImage(
                  image: state.profileModel.list?.image ??
                      'https://static.vecteezy.com/system/resources/previews/001/840/618/original/picture-profile-icon-male-icon-human-or-people-sign-and-symbol-free-vector.jpg',
                  width: MediaQuery.of(context).size.height * 0.2,
                  height: MediaQuery.of(context).size.height * 0.2,
                  radius: MediaQuery.of(context).size.height * 0.2,
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.005),
                Text(
                  "${state.profileModel.list?.account?.firstName}" +
                      " ${state.profileModel.list?.account?.lastName}",
                  style: TextStyles.textStyle18.copyWith(
                    color: kDarkBlue,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                Text(
                  state.profileModel.list?.account?.email ?? " ",
                  style: TextStyles.textStyle16,
                ),
                Row(
                  children: [
                    IconButton(
                       onPressed: () {
                          print("object");
                          print(prefs!.getString(kTypeUser));
                           if (prefs!.getString(kTypeUser) == 'user'){
                            GoRouter.of(context)
                                .push(AppRouter.kEditProfileUserView);
                          }else{
                             GoRouter.of(context)
                                .push(AppRouter.kEditProfileOfficeView);
                          }
                        },
                        icon: const Icon(
                          Icons.edit_note,
                          color: kDarkBlue,
                        )),
                  ],
                )
              ],
            ),
          );
        } else if (state is ShowProfileLoading) {
          return Container(
            color: kLightBlue2,
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                CustomShimmer(width: 200, height: 200, radius: 200),
                SizedBox(height: MediaQuery.of(context).size.height * 0.005),
                CustomShimmer(width: 100, height: 10, radius: 20),
                SizedBox(height: MediaQuery.of(context).size.height * 0.005),
                CustomShimmer(width: 25, height: 5, radius: 20),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          print("object");
                          print(prefs!.getString(kTypeUser));
                           if (prefs!.getString(kTypeUser) == 'user'){
                            
                          }else{
                            
                          }
                        },
                        icon: const Icon(
                          Icons.edit_note,
                          color: kDarkBlue,
                        )),
                  ],
                )
              ],
            ),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}
