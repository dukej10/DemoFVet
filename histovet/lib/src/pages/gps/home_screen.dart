import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:provider/provider.dart';

import '../../blocs/application_bloc.dart';
import '../../models/place.dart';
import 'package:flutter/scheduler.dart';

import '../Home/home_page.dart';

class HomeScreen extends StatefulWidget {
  static String id = "gps_page";

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Completer<GoogleMapController> _mapController = Completer();

  late StreamSubscription locationSubscription;
  late StreamSubscription boundsSubscription;
  final _locationController = TextEditingController();

  @override
  void initState() {
    final applicationBloc =
        Provider.of<ApplicationBloc>(context, listen: false);

    //Listen for selected Location
    locationSubscription =
        applicationBloc.selectedLocation!.stream.listen((place) {
      if (place != null) {
        _locationController.text = place.name!;
        _goToPlace(place);
      } else
        _locationController.text = "";
    });

    applicationBloc.bounds!.stream.listen((bounds) async {
      final GoogleMapController controller = await _mapController.future;
      controller.animateCamera(CameraUpdate.newLatLngBounds(bounds, 50));
    });
    super.initState();
  }

  /*
  @override
  void dispose() {
    final applicationBloc =
        Provider.of<ApplicationBloc>(context, listen: false);

    applicationBloc.dispose();
    _locationController.dispose();
    locationSubscription.cancel();
    boundsSubscription.cancel();
    super.dispose();
  }
  */

  @override
  Widget build(BuildContext context) {
    final applicationBloc = Provider.of<ApplicationBloc>(context);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("GPS"),
          
        ),
        body: (applicationBloc.currentLocation == null)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView(
                children: [
                  /*Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _locationController,
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(
                        hintText: 'Search by City',
                        suffixIcon: Icon(Icons.search),
                      ),
                      onChanged: (value) => applicationBloc.searchPlaces(value),
                      onTap: () => applicationBloc.clearSelectedLocation(),
                    ),
                  ),*/

                  Stack(
                    children: [
                      Container(
                        height: 500.0,
                        child: GoogleMap(
                          mapType: MapType.normal,
                          myLocationEnabled: true,
                          initialCameraPosition: CameraPosition(
                            target: LatLng(
                                applicationBloc.currentLocation!.latitude,
                                applicationBloc.currentLocation!.longitude),
                            zoom: 14,
                          ),
                          onMapCreated: (GoogleMapController controller) {
                            _mapController.complete(controller);
                          },
                          markers: Set<Marker>.of(applicationBloc.markers),
                        ),
                      ),
                      if (applicationBloc.searchResults != null &&
                          applicationBloc.searchResults!.length != 0)
                        Container(
                            height: 500.0,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(.6),
                                backgroundBlendMode: BlendMode.darken)),
                      if (applicationBloc.searchResults != null)
                        Container(
                          height: 500.0,
                          child: ListView.builder(
                              itemCount: applicationBloc.searchResults!.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(
                                    applicationBloc
                                        .searchResults![index].description,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onTap: () {
                                    applicationBloc.setSelectedLocation(
                                        applicationBloc
                                            .searchResults![index].placeId);
                                  },
                                );
                              }),
                        ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Encuentra la veterinaria más cercana',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 8.0,
                      children: [
                        FilterChip(
                            label: Text('BUSCAR'),
                            onSelected: (val) => applicationBloc
                                .togglePlaceType('pet_store', val),
                            selected: applicationBloc.placeType == 'pet_store',
                            selectedColor: Colors.blue),
                      ],
                    ),
                  )
                ],
              ));
  }

  Future<void> _goToPlace(Place place) async {
    final GoogleMapController controller = await _mapController.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
            target: LatLng(
                place.geometry!.location.lat, place.geometry!.location.lng),
            zoom: 14.0),
      ),
    );
  }
}
