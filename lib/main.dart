import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:homy_hon/bloc/add_property/addproperty_bloc.dart';
import 'package:homy_hon/constants.dart';
import 'package:homy_hon/core/utils/app_routers.dart';
import 'package:homy_hon/data/remote_date/api_handler/base_api_client.dart';
import 'package:homy_hon/featchers/Login/presentation/manager/Login_cubit/login_cubit.dart';
import 'package:homy_hon/featchers/Register/presentation/manager/otp_cubit/otp_cubit.dart';
import 'package:homy_hon/featchers/Subscription/data/repos/subscriptions_repo_impl.dart';
import 'package:homy_hon/featchers/Subscription/presentation/manager/subscription_bloc/subscriptions_bloc.dart';
import 'package:homy_hon/featchers/all_properties/presentation/manager/all_properties_cubit/all_properties_cubit.dart';
import 'package:homy_hon/featchers/contracts/data/repos/contracts_repo/contracts_repo_impl.dart';
import 'package:homy_hon/featchers/contracts/presentation/manager/add_contract/add_contract_bloc.dart';
import 'package:homy_hon/featchers/contracts/presentation/manager/contracts_bloc/contracts_bloc_bloc.dart';
import 'package:homy_hon/featchers/edit_profile/presentation/manager/edit_profil_office/edit_profil_office_cubit.dart';
import 'package:homy_hon/featchers/home_page/presentetion/manager/newest_advertisment_cubit/newest_advertisment_cubit.dart';
import 'package:homy_hon/featchers/home_page/presentetion/manager/types/types_cubit.dart';
import 'package:homy_hon/featchers/offices/data/repo/offices_repo_impl.dart';
import 'package:homy_hon/featchers/property_details/data/repos/comments_repo/comments_repo_impl.dart';
import 'package:homy_hon/featchers/property_details/data/repos/edit_property_repo/edit_property_repo_impl.dart';
import 'package:homy_hon/featchers/property_details/data/repos/property_details_repo/property_details_repo_impl.dart';
import 'package:homy_hon/featchers/property_details/presentation/manager/comments_bloc/comments_bloc.dart';
import 'package:homy_hon/featchers/property_details/presentation/manager/edit_info_bloc/edit_info_bloc.dart';
import 'package:homy_hon/featchers/property_details/presentation/manager/property_details_bloc/property_details_bloc.dart';
import 'package:homy_hon/featchers/search_property/data/repos/apply_filter_repo/apply_filter_repo_impl.dart';
import 'package:homy_hon/featchers/search_property/data/repos/get_all_properties_repo/get_all_properties_repo_impl.dart';
import 'package:homy_hon/featchers/search_property/data/repos/get_governorates_repo/get_governorates_repo_impl.dart';
import 'package:homy_hon/featchers/search_property/data/repos/get_offices_repo/get_offices_repo_impl.dart';
import 'package:homy_hon/featchers/search_property/presentation/manager/search_bloc/search_bloc.dart';
import 'package:homy_hon/featchers/wallet/presentation/manager/wallet_bloc/wallet_bloc.dart';
import 'package:homy_hon/featchers/wish_list/data/repos/wish_list_repo_impl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/utils/service_locator.dart';
import 'featchers/Login/data/repos/login_repo_impl.dart';
import 'featchers/advertisements/data/repo/advertisements_repo_impl.dart';
import 'featchers/advertisements/presentation/manager/advertisements_cubit/advertisements_cubit.dart';
import 'featchers/all_properties/data/repos/all_propertied_repo_impl.dart';
import 'featchers/drawer/data/repo/drawer_repo_impl.dart';
import 'featchers/drawer/presentation/manager/show_profile_cubit/show_profile_cubit.dart';
import 'featchers/edit_profile/data/repo/edit_profile_repo_impl.dart';

import 'featchers/edit_profile/presentation/manager/edit_profile_user_cubit/edit_profile_cubit.dart';
import 'featchers/my_properties/data/repos/my_properties_repo_impl.dart';
import 'featchers/Register/data/repos/register_repo_impl.dart';
import 'featchers/Register/presentation/manager/register_cubit/register_cubit.dart';
import 'featchers/home_page/data/repos/home_page_repo_impl.dart';
import 'featchers/home_page/presentetion/manager/newest_property_cubit/newest_property_cubit.dart';
import 'featchers/my_properties/presintation/manager/my_properties_cubit/my_properties_cubit.dart';
import 'featchers/office_details/data/repo/office_details_repo_impl.dart';
import 'featchers/office_details/presentation/manager/office_details_cubit/office_details_cubit.dart';
import 'featchers/office_details/presentation/manager/related_properties_cubit/related_properties_cubit.dart';
import 'featchers/offices/presentations/manager/offices_cubit/offices_cubit.dart';
import 'featchers/search_property/presentation/manager/filter_bloc/filter_bloc.dart';
import 'featchers/wallet/data/repos/wallet_repo_impl.dart';
import 'featchers/wish_list/presentation/manager/wish_list_bloc/wish_list_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';


    SharedPreferences? prefs ;
     


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUp();
prefs = await SharedPreferences.getInstance();
  BaseApiClient();
  runApp(const MyHome());
}

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit(LoginRepoImple())),
        BlocProvider(
            create: (context) => AllPropertiesCubit(AllPropertiesRepoImpl())),
        BlocProvider(
            create: (context) => MyPropertiesCubit(MyPropertiesRepoImpl())),
        BlocProvider(create: (context) => RegisterCubit(RegisterRepoImpl())),
        BlocProvider(create: (context) => OtpCubit(RegisterRepoImpl())),
        BlocProvider(
            create: (context) => NewestPropertyCubit(HomePageRepoImpl())),
        BlocProvider(
            create: (context) => NewestAdvertismentCubit(HomePageRepoImpl())),
        BlocProvider(create: (context) => TypesCubit(HomePageRepoImpl())),
        BlocProvider(
            create: (context) =>
                FilterBloc(ApplyFilterRepoImpl(), GetGovernoratesRepoImpl())
                  ..add(FilterInitialEvent())),
        BlocProvider(
            create: (context) =>
                SearchBloc(GetAllPropertiesReopImpl(), GetOfficesRepoImpl())),
        BlocProvider(
            create: (context) =>
                PropertyDetailsBloc(PropertyDetailsRepoImple())),
        BlocProvider(create: (context) => CommentsBloc(CommentsRepoImpl())),
        BlocProvider(
            create: (context) => SubscriptionsBloc(SubscriptionsRepoImpl())),
        BlocProvider(
            create: (context) =>
                getIt<AddpropertyBloc>()..add(GetGovernoratesEvent())),
        BlocProvider(
          create: (context) => WishListBloc(WishListRepoImpl()),
        ),
        BlocProvider(create: (context) => OfficesCubit(OfficesRepoImpl())),
        BlocProvider(
            create: (context) => OfficeDetailsCubit(OfficeDetailsRepoImpl())),
        BlocProvider(
            create: (context) =>
                RelatedPropertiesCubit(OfficeDetailsRepoImpl())),
        BlocProvider(create: (context) => ShowProfileCubit(DrawerRepoImpl())),
        BlocProvider(
            create: (context) => AdvertisementsCubit(AdvertisementsRepoImpl())),
        BlocProvider(
          create: (context) => EditInfoBloc(EditPropertyRepoImpl()),
        ),
        BlocProvider(create: (context) => ContractsBloc(ContractsRepoImpl()),),
        BlocProvider(create: (context) => AddContractBloc(MyPropertiesRepoImpl(),ContractsRepoImpl()),),
        BlocProvider(
          create: (context) => WalletBloc(WalletRepoImpl()),
        ),
              BlocProvider(
            create: (context) => EditProfileCubit(EditProfileRepoImpl())),
               BlocProvider(
            create: (context) => EditProfilOfficeCubit(EditProfileRepoImpl())),
      ],
      child: MaterialApp.router(
         builder: EasyLoading.init(),
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kWhite,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}
