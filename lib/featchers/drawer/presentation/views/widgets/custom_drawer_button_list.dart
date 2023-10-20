import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:homy_hon/core/config/user_information.dart';
import 'package:homy_hon/core/utils/app_routers.dart';
import 'package:homy_hon/core/utils/user.dart';
import 'package:http/http.dart';
import 'package:homy_hon/core/utils/app_router.dart';
import 'package:homy_hon/constants.dart';
import 'package:homy_hon/core/config/user_information.dart';
import 'package:homy_hon/featchers/Login/presentation/manager/Login_cubit/login_cubit.dart';
import 'package:homy_hon/featchers/landing_page/presentation/views/landing_view.dart';
import 'package:homy_hon/featchers/my_subsicribe/view/my_sub_view.dart';
import 'package:homy_hon/featchers/my_subsicribe/view/sub_history_list_view.dart';
import 'package:homy_hon/featchers/notfication/show_all_notfication.dart';
import 'package:homy_hon/main.dart';

import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../core/utils/app_routers.dart';
import '../../../../../core/utils/app_routers.dart';
import 'custom_drawer_button.dart';

class CustomDrawerButtonList extends StatelessWidget {
   CustomDrawerButtonList({
    super.key,
  });
      
  @override
  Widget build(BuildContext context) {
    
    return Expanded(
        child: ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        prefs!.getString('type_user') == 'user'
            ? CustomDrawerButton(
                icon: Icons.subscriptions_outlined,
                onTab: () {
                  GoRouter.of(context).push(AppRouter.kSubscriptionsView);
                },
                title: 'Subscription',
              )
            : Container(),
        CustomDrawerButton(
          icon: Icons.favorite_outline,
          onTab: () {
            GoRouter.of(context).push(AppRouter.kWishListView);
          },
          title: 'Wish List',
        ),
       prefs!.get('type_user') == 'office'
            ? CustomDrawerButton(
                icon: Icons.handshake_outlined,
                onTab: () {
                  GoRouter.of(context).push(AppRouter.kContractsView);
                },
                title: 'Contracts',
              )
            : Container(),
        CustomDrawerButton(
          icon: Icons.notifications_none_sharp,
          onTab: () {
            AppNavigation.navigateTo(
                context: context, destination: ShowAllNotficatonView());
          },
          title: 'Notifcation',
        ),
        prefs!.get('type_user') == 'user'
            ? CustomDrawerButton(
                icon: Icons.wallet_outlined,
                onTab: () {
                  GoRouter.of(context).push(AppRouter.kWalletView);
                },
                title: 'My wallet',
              )
            : Container(),
        CustomDrawerButton(
          icon: Icons.translate_outlined,
          onTab: () {},
          title: 'Language',
        ),
        CustomDrawerButton(
          icon: Icons.dark_mode_outlined,
          onTab: () {},
          title: 'Theme',
        ),
       
        CustomDrawerButton(
          icon: Icons.privacy_tip_outlined,
          onTab: () {},
          title: 'Privacy policy',
        ),
        CustomDrawerButton(
          icon: Icons.error_outline,
          onTab: () {},
          title: 'About us',
        ),
        prefs!.get('type_user') == 'user'
            ? CustomDrawerButton(
                icon: Icons.history,
                onTab: () {
                  GoRouter.of(context).push(AppRouter.kHistory);
                },
                title: 'History Sub',
              )
            : Container(),
        prefs!.get('type_user') == 'user'
            ? CustomDrawerButton(
                icon: Icons.history,
                onTab: () {
                  GoRouter.of(context).push(AppRouter.kSubDetails);
                },
                title: 'Sub Details',
              )
            : Container(),
        CustomDrawerButton(
        
          icon: Icons.logout_outlined,
          onTab: () async {
            // await BlocProvider.of<LoginCubit>(context).logout();
            Future.delayed(const Duration(seconds: 2), () async {
              
              DefaultCacheManager().emptyCache();

              // var token = myBox!.get(kToken);

              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.clear();
              var token = prefs.get('token');
              print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
              print("${token}");
              print("<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<");

            });

            GoRouter.of(context).pushReplacement(AppRouter.kLandingView);
          },
          title: 'Logout',
        ),
      ],
    ));
  }
}
