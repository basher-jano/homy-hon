import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:homy_hon/bloc/add_property/addproperty_bloc.dart';
import 'package:homy_hon/constants.dart';
import 'package:homy_hon/core/utils/service_locator.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MapScreenbody();
  }
}

class MapScreenbody extends StatefulWidget {
  @override
  _MapScreenbodyState createState() => _MapScreenbodyState();
}

class _MapScreenbodyState extends State<MapScreenbody> {
  GoogleMapController? _controller;
  LatLng _initialCameraPosition =
      LatLng(37.7749, -122.4194); // San Francisco coordinates
  LatLng _tappedLatLng = LatLng(0, 0); // Default value

  void _onMapCreated(GoogleMapController controller) {
    _controller = controller;
  }

  void _onMapTapped(LatLng latLng) {
    context.read<AddpropertyBloc>().addPropertyPrams.langtude =
        latLng.longitude;
    context.read<AddpropertyBloc>().addPropertyPrams.latitude = latLng.latitude;
    context.read<AddpropertyBloc>().addShopPrams.langtude = latLng.longitude;
    context.read<AddpropertyBloc>().addShopPrams.latitude = latLng.latitude;
    context.read<AddpropertyBloc>().addFarmPrams.langtude = latLng.longitude;
    context.read<AddpropertyBloc>().addFarmPrams.latitude = latLng.latitude;
    setState(() {
      _tappedLatLng = latLng;
    });
    print(context.read<AddpropertyBloc>().addPropertyPrams.latitude);
  }

  Set<Marker> marker(double x, double y) {
    return {
      Marker(
        markerId: MarkerId("1"),
        infoWindow: InfoWindow(title: "homeyhonn"),
        position: LatLng(x, y),
      ),
    };
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddpropertyBloc, AddpropertyState>(
      builder: (context, state) {
        print(state);

        return Scaffold(
          appBar: AppBar( 
            title: Text('Map Screen'),
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
                  padding: EdgeInsets.all(16),
                  color: kblue,
                  child: Center(
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
