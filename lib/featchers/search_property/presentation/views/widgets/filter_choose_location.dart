import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:homy_hon/bloc/add_property/addproperty_bloc.dart';
import 'package:homy_hon/constants.dart';
import 'package:homy_hon/core/utils/service_locator.dart';
import 'package:homy_hon/featchers/search_property/presentation/manager/filter_bloc/filter_bloc.dart';

class ChooseLocationScreen extends StatelessWidget {
  const ChooseLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChooseLocationScreenbody();
  }
}

class ChooseLocationScreenbody extends StatefulWidget {
  @override
  _ChooseLocationScreenbodyState createState() =>
      _ChooseLocationScreenbodyState();
}

class _ChooseLocationScreenbodyState extends State<ChooseLocationScreenbody> {
  GoogleMapController? _controller;
  LatLng _initialCameraPosition =
      LatLng(37.7749, -122.4194); // San Francisco coordinates
  LatLng _tappedLatLng = LatLng(0, 0); // Default value

  void _onMapCreated(GoogleMapController controller) {
    _controller = controller;
  }

  void _onMapTapped(LatLng latLng) {
    context.read<FilterBloc>().langtude = _tappedLatLng.longitude;
    context.read<FilterBloc>().latitude = _tappedLatLng.latitude;
    setState(() {
      _tappedLatLng = latLng;
    });
  }

  Set<Marker> marker(double x, double y) {
    return {
      Marker(
        markerId: const MarkerId("1"),
        infoWindow: const InfoWindow(title: "homeyhonn"),
        position: LatLng(x, y),
      ),
    };
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterBloc, FilterState>(
      builder: (context, state) {
        print(state);

        return Scaffold(
          appBar: AppBar(
            title: const Text('Map Screen'),
          ),
          body: Column(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(21),
                  child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(21)),
                    height: 134,
                    child: GoogleMap(
                      mapType: MapType.normal,
                      markers: marker(
                          _tappedLatLng.latitude, _tappedLatLng.longitude),
                      initialCameraPosition: CameraPosition(
                        target: _initialCameraPosition,
                        zoom: 12.4746,
                      ),
                      onMapCreated: _onMapCreated,
                      onTap: _onMapTapped,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(16),
                  color: kblue,
                  child: const Center(
                    child: Text(
                      'Complete',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
