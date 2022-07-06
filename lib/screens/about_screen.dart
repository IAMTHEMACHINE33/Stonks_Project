import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AboutGoogleMapScreen extends StatefulWidget {
  const AboutGoogleMapScreen({Key? key}) : super(key: key);

  @override
  State<AboutGoogleMapScreen> createState() => AboutGoogleMapScreenState();
}

class AboutGoogleMapScreenState extends State<AboutGoogleMapScreen> {
  GoogleMapController? mapController;
  Set<Marker> markers = {};
  LatLng myLocation = const LatLng(27.677870503625144, 85.3036534315802);

  @override
  void initState() {
    markers.add(Marker(
      markerId: MarkerId(myLocation.toString()),
      position: myLocation,
      infoWindow: const InfoWindow(
        title: "Location",
        snippet: 'loc',
      ),
      icon: BitmapDescriptor.defaultMarker,
    ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text("About Us"),
        centerTitle: true,
      ),
      body: GoogleMap(
        zoomGesturesEnabled: true,
        initialCameraPosition: CameraPosition(
          target: myLocation,
          zoom: 10,
        ),
        markers: markers,
        mapType: MapType.normal,
        onMapCreated: (controller) {
          setState(() {
            mapController = controller;
          });
        },
      ),
    ));
  }
}
