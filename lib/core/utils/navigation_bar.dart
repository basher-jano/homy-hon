import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homy_hon/featchers/drawer/presentation/manager/show_profile_cubit/show_profile_cubit.dart';
import 'package:homy_hon/featchers/home_page/presentetion/manager/newest_advertisment_cubit/newest_advertisment_cubit.dart';
import 'package:homy_hon/featchers/home_page/presentetion/manager/newest_property_cubit/newest_property_cubit.dart';
import 'package:homy_hon/featchers/offices/presentations/manager/offices_cubit/offices_cubit.dart';

import '../../constants.dart';
import '../../featchers/Subscription/presentation/views/subscriptions_view.dart';
import '../../featchers/add_property/add_property_screen.dart';
import '../../featchers/advertisements/presentation/views/advertisements_view.dart';
import '../../featchers/home_page/presentetion/manager/types/types_cubit.dart';
import '../../featchers/home_page/presentetion/views/home_page_view.dart';
import '../../featchers/my_properties/presintation/manager/my_properties_cubit/my_properties_cubit.dart';
import '../../featchers/my_properties/presintation/views/my_properties_view.dart';
import '../../featchers/offices/presentations/views/offices_view.dart';
import '../../featchers/property_details/presentation/views/property_details_view.dart';
import '../../featchers/search_property/presentation/views/search_property_view.dart';

class CustomNavigationBar extends StatefulWidget {
  @override
  _CustomNavigationBarState createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  final List<Widget> _children = [
    HomePageVeiw(),
    SearchPropertyView(),
    AddPropertyScreen(),
    MyPropertiesView(),
    OfficesView(),
  ];

  late AnimationController _animationController;
  late Tween<Color> _colorTween;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<TypesCubit>(context).fetchPropertyTypes();
    BlocProvider.of<MyPropertiesCubit>(context).fetchMyProperties();
    BlocProvider.of<NewestPropertyCubit>(context).fetchNewestProperty();
    BlocProvider.of<NewestAdvertismentCubit>(context).fetchNewestAds();
    BlocProvider.of<OfficesCubit>(context).fetchOffices();
    BlocProvider.of<ShowProfileCubit>(context).showProfile();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _colorTween = Tween<Color>(begin: Colors.blue, end: Colors.green);
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    _animationController.forward(from: 0.0);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bottom Navigation Demo',
      home: Scaffold(
        body: _children[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          onTap: onTabTapped,
          currentIndex: _currentIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Add Property',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.location_city,
              ),
              label: 'My Properties',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.meeting_room),
              label: 'Office',
            ),
          ],
          selectedItemColor: kDarkBlue,
          unselectedItemColor: kLightBlue,
          backgroundColor: Colors.black,
          selectedIconTheme: IconThemeData(size: 24),
          unselectedIconTheme: IconThemeData(size: 20),
          selectedFontSize: 14,
          unselectedFontSize: 12,
        ),
      ),
    );
  }
}
