import 'dart:async';
import 'package:delivery_app/ui/core/self_color.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  @override
  void initState() {
    _getCurrentLocation();
    super.initState();
  }

  late GoogleMapController mapController;

  late final Position _currentPosition;

  String _currentAddress = '';
 final TextEditingController _startAddressController = TextEditingController();
  Set<Marker> markers = {};

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: SizedBox(
        height: height,
        width: width,
        child: Scaffold(
          body: Stack(
            children: [
              GoogleMap(
                initialCameraPosition: CameraPosition(
                  target: LatLng(0.0,0.0),
                  zoom: 15,
                ),
                myLocationEnabled: true,
                myLocationButtonEnabled: false,
                mapType: MapType.normal,
                zoomGesturesEnabled: true,
                zoomControlsEnabled: false,
                onMapCreated: (GoogleMapController controller) {
                  mapController = controller;
                },
              ),
              Center(
                child: SizedBox(
                  height: 200,
                  width: 200,
                  child: TextField(
                    controller: _startAddressController,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ZoomButton(
                      iconData: Icons.add,
                      onPressed: () {
                        mapController.animateCamera(CameraUpdate.zoomIn());
                      },
                    ),
                    SizedBox(height: 10),
                    ZoomButton(
                      iconData: Icons.remove,
                      onPressed: () {
                        mapController.animateCamera(CameraUpdate.zoomOut());
                      },
                    ),
                    ElevatedButton(
                        onPressed: () {
                          _getAddress();
                        },
                        child: Text('Click'))
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20, bottom: 30),
                  child: _myLocationButton(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _myLocationButton() {
    return GestureDetector(
      onTap: _myLocationAnimateCamera,
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40), color: Colors.blue),
        child: const Icon(
          Icons.my_location,
          color: SelfColors.white,
        ),
      ),
    );
  }

  void _getCurrentLocation() async {
    await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    ).then((Position position) {
      setState(() {
        _currentPosition = position;
        mapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(position.latitude, position.longitude),
              zoom: 18,
            ),
          ),
        );
      });
    }).catchError((e) {
      print(e);
    });
  }

  void _myLocationAnimateCamera() {
    mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
            target:
                LatLng(_currentPosition.latitude, _currentPosition.longitude),
            zoom: 18),
      ),
    );
  }

  _getAddress() async {
    List<Placemark> p = await placemarkFromCoordinates(
        _currentPosition.latitude, _currentPosition.longitude);
    Placemark placeMark = p[0];
    setState(() {
      _currentAddress =
          "${placeMark.street}, ${placeMark.locality}, ${placeMark.country}";
      _startAddressController.text = _currentAddress;
    });
  }
}

class ZoomButton extends StatelessWidget {
  ZoomButton({
    required this.iconData,
    required this.onPressed,
  });
  final VoidCallback onPressed;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40), color: Colors.blue),
        child: Icon(
          iconData,
          color: SelfColors.white,
        ),
      ),
    );
  }
}
