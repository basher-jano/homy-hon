import 'package:go_router/go_router.dart';
import 'package:homy_hon/featchers/Register/presentation/views/register_view.dart';
import 'package:homy_hon/featchers/Splash/presentation/views/splash_view.dart';
import 'package:homy_hon/featchers/add_property/add_property_screen.dart';
import 'package:homy_hon/featchers/User_Type/Presentations/views/user_type_view.dart';
import 'package:homy_hon/featchers/contracts/presentation/views/add_contract_view.dart';
import 'package:homy_hon/featchers/contracts/presentation/views/contracts_view.dart';
import 'package:homy_hon/featchers/home_page/presentetion/views/home_page_view.dart';
import 'package:homy_hon/featchers/landing_page/presentation/views/landing_view.dart';
import 'package:homy_hon/featchers/notfication/show_all_notfication.dart';
import 'package:homy_hon/featchers/property_details/data/models/property_details_model.dart';
import 'package:homy_hon/featchers/property_details/presentation/views/widgets/edit_property_widgets/edit_images_screen.dart';
import 'package:homy_hon/featchers/property_details/presentation/views/widgets/edit_property_widgets/edit_info_screen.dart';
import 'package:homy_hon/featchers/search_property/data/models/properties_model.dart';
import 'package:homy_hon/featchers/search_property/presentation/views/filter_property_result.dart';
import 'package:homy_hon/featchers/search_property/presentation/views/search_property_view.dart';
import 'package:homy_hon/featchers/wallet/presentation/views/Wallet_view.dart';

import '../../featchers/Register/presentation/views/OTP_view.dart';
import '../../featchers/Register/presentation/views/verfication_code_view.dart';
import '../../featchers/Subscription/presentation/views/subscriptions_view.dart';
import '../../featchers/Login/presentation/views/login_view.dart';
import '../../featchers/advertisements/presentation/views/advertisements_view.dart';
import '../../featchers/all_properties/presentation/views/all_properties_view.dart';
import '../../featchers/edit_profile/presentation/views/edit_profile_office_view.dart';
import '../../featchers/edit_profile/presentation/views/edit_profile_user_view.dart';
import '../../featchers/my_properties/presintation/views/my_properties_view.dart';
import '../../featchers/my_subsicribe/view/my_sub_view.dart';
import '../../featchers/my_subsicribe/view/sub_history_list_view.dart';
import '../../featchers/office_details/presentation/views/office_datails_view.dart';
import '../../featchers/offices/presentations/views/offices_view.dart';
import '../../featchers/search_property/presentation/views/filter_property_view.dart';
import '../../featchers/property_details/presentation/views/property_comments_view.dart';
import '../../featchers/property_details/presentation/views/property_details_view.dart';
import '../../featchers/type_Properties/presintation/views/type_Properties_view.dart';
import '../../featchers/wish_list/presentation/views/wish_list_view.dart';
import 'navigation_bar.dart';

abstract class AppRouter {
  static const kSplashView = '/splashView';
  static const kTypePropertiesView = '/TypePropertiesView';
  static const kUserTypeView = '/UserTypeView';
  static const kLandingView = '/LandingView';
  static const kSearchPropertyView = '/searchPropertyView';
  static const kFilterPropertyView = '/filterPropertyView';
  static const kFilterPropertyResult = '/filterPropertyResult';
  static const kPropertyDetailsView = '/PropertyDetailsView';
  static const kPropertyComments = '/PropertyComments';
  static const kAdvertisementsView = '/AdvertisementsView';
  static const kHomePageVeiw = '/HomePageVeiw';
  static const kLoginView = '/LoginView';
  static const kRegisterView = '/RegisterView';
  static const kSubscriptionsView = '/SubscriptionsView';
  static const kOtpView = '/otpView';
  static const kVerficationCode = '/VerficationCode';
  static const kAddProperty = '/AddProperty';
  static const kNavigationBar = '/NavBar';
  static const kPropertiesView = '/PropertiesView';
  static const kAllPropertiesView = '/AllPropertiesView';
  static const kOfficesView = '/OfficesView';
  static const kOfficeDetailsView = '/OfficeDetailsView';
  static const kEditProfileUserView= '/EditProfileUserView';
  static const kEditProfileOfficeView = '/EditProfileOfficeView';
  static const kWishListView = '/wishListView';
  static const kEditPropertyImages = '/editPropertyImages';
  static const kContractsView = '/contractsView';
  static const kAddContractView = '/addContractView';
  static const kWalletView = '/walletView';

  static const kEditInfo = '/editInfo';
  static const knotficationview = '/ShowAllNotficatonView';
  static const kHistory = '/History';
  static const kSubDetails = "/SubDetails";

  static final router = GoRouter(
    initialLocation: kSplashView,
    routes: [
      GoRoute(
        path: '/EditProfileOfficeView',
        builder: (context, state) => EditProfileOfficeView(),
      ),
      GoRoute(
        path: '/EditProfileUserView',
        builder: (context, state) => EditProfileUserView(),
      ),
      GoRoute(
        path: '/OfficeDetailsView',
        builder: (context, state) {
          final extraData = state.extra as Map<String, dynamic>;
          final id = extraData['id'] as int?;
          final account_id = extraData['account_id'] as int?;

          return OfficeDetailsView(
            id: id,
            account_id: account_id,
          );
        },
      ),
      GoRoute(
        path: '/OfficesView',
        builder: (context, state) => OfficesView(),
      ),
      GoRoute(
        path: '/AllPropertiesView',
        builder: (context, state) => AllPropertiesView(),
      ),
      GoRoute(
        path: '/ShowAllNotficatonView',
        builder: (context, state) => ShowAllNotficatonView(),
      ),
      GoRoute(
        path: '/PropertiesView',
        builder: (context, state) => MyPropertiesView(),
      ),
      GoRoute(
        path: '/TypePropertiesView',
        builder: (context, state) => TypePropertiesView(),
      ),
      GoRoute(
        path: '/NavBar',
        builder: (context, state) => CustomNavigationBar(),
      ),
      GoRoute(
        path: '/SplashView',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: '/History',
        builder: (context, state) => const HistorySubScreen(),
      ),
      GoRoute(
        path: '/SubDetails',
        builder: (context, state) => const MySubDetails(),
      ),
      GoRoute(
        path: kUserTypeView,
        builder: (context, state) => const UserTypeView(),
      ),
      GoRoute(
        path: kLoginView,
        builder: (context, state) => LoginView(),
      ),
      GoRoute(
        path: kLandingView,
        builder: (context, state) => const LandingView(),
      ),
      GoRoute(
        path: kSearchPropertyView,
        builder: (context, state) => SearchPropertyView(),
      ),
      GoRoute(
        path: kHomePageVeiw,
        builder: (context, state) =>  HomePageVeiw(),
      ),
      GoRoute(
        path: kFilterPropertyView,
        builder: (context, state) => FilterPropertyView(),
      ),
      GoRoute(
        path: kFilterPropertyResult,
        builder: (context, state) =>
            FilterPropertyResult(properties: state.extra as Properties),
      ),
      GoRoute(
        path: kPropertyDetailsView,
        builder: (context, state) => PropetyDetailsView(
          extra: state.extra as List<Object>,
        ),
      ),
      GoRoute(
        path: kPropertyComments,
        builder: (context, state) =>
            PropertyCommentsView(propertyId: state.extra as int),
      ),
      GoRoute(
        path: kAdvertisementsView,
        builder: (context, state) => const AdvertisementsView(),
      ),
      GoRoute(
        path: kSubscriptionsView,
        builder: (context, state) => const SubscriptionsView(),
      ),
      GoRoute(
        path: kRegisterView,
        builder: (context, state) => RegisterView(),
      ),
      GoRoute(
        path: kOtpView,
        builder: (context, state) => OtpView(),
      ),
      GoRoute(
        path: kVerficationCode,
        builder: (context, state) => const VerficationCodeView(),
      ),
      GoRoute(
        path: kWishListView,
        builder: (context, state) => const WishListView(),
      ),
      GoRoute(
        path: kEditInfo,
        builder: (context, state) =>
            EditInfoScreen(extra: state.extra as List<Object>),
      ),
      GoRoute(
        path: kEditPropertyImages,
        builder: (context, state) =>
            EditImagesScreen(property: state.extra as Property),
      ),
      GoRoute(
        path: kContractsView,
        builder: (context, state) => const ContractsView(),
      ),
      GoRoute(
        path: kAddContractView,
        builder: (context, state) => const AddContractView(),
      ),
      GoRoute(
        path: kWalletView,
        builder: (context, state) => const WalletView(),
      ),
    ],
  );
}
