import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import 'subpages/search.dart';
import 'subpages/location-settings.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Completer<GoogleMapController> _googleMapController = Completer();
  CameraPosition? _cameraPosition;
  Location? _location;
  LocationData? _currentLocation;

  @override
  void initState() {
    _init();
    super.initState();
  }

  _init() async {
    _location = Location();
    _cameraPosition = CameraPosition(
        target: LatLng(
            0, 0), // this is just the example lat and lng for initializing
        zoom: 16);
    _initLocation();
  }

  //function to listen when we move position
  _initLocation() {
    //use this to go to current location instead
    _location?.getLocation().then((location) {
      _currentLocation = location;
    });
    _location?.onLocationChanged.listen((newLocation) {
      _currentLocation = newLocation;
      moveToPosition(LatLng(
          _currentLocation?.latitude ?? 0, _currentLocation?.longitude ?? 0));
    });
  }

  moveToPosition(LatLng latLng) async {
    GoogleMapController mapController = await _googleMapController.future;
    mapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: latLng, zoom: 16)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: <Widget>[
            // Background content
            Positioned.fill(
              child: Container(
                color: Colors.blueGrey, // Background color
                child: Center(
                    child: _buildBody()
                ),
              ),
            ),


            // Three CircleAvatars stacked above the background
            Positioned(
              top: 20.0,
              left: 20.0,
              child: CircleAvatar(
                radius: 20.0,
                backgroundColor: Colors.black.withOpacity(0.3),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NewPage('Profile Page')),
                    );
                  },
                  child: Icon(Icons.person, color: Colors.white),
                ),
              ),),
            Positioned(
              top: 20.0,
              left: 70.0,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NewPage('Search Page')),
                  );
                },
                child: CircleAvatar(
                  radius: 20.0,
                  backgroundColor: Colors.black.withOpacity(0.3),
                  child: Icon(Icons.search, color: Colors.white),
                ),
              ),),
            Positioned(
              top: 20.0,
              right: 20.0,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NewPage('Settings Page')),
                  );
                },
                child: CircleAvatar(
                  radius: 20.0,
                  backgroundColor: Colors.black.withOpacity(0.3),
                  child: Icon(Icons.settings, color: Colors.white),
                ),
              ),),
            Positioned(
                top: 70.0,
                right: 18.0,
                child: Container(
                    decoration: BoxDecoration(
                      // color: Colors.pink,
                      color: Colors.black.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(22),
                      // border: Border.all(
                      //   color: Colors.black,
                      //   width: 2,
                      // )
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(2),
                          child: Positioned(
                              top: 70.0,
                              left: 20.0,
                              child: CircleAvatar(
                                radius: 20.0,
                                backgroundColor: Colors.black54,
                                child: ClipOval(
                                    child: Icon(Icons.map)
                                ),
                              )
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(2),
                          child: Positioned(
                              top: 70.0,
                              left: 20.0,
                              child: CircleAvatar(
                                radius: 20.0,
                                backgroundColor: Colors.black54,
                                child: ClipOval(
                                    child: Icon(Icons.read_more)
                                ),
                              )
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(2),
                          child: Positioned(
                              top: 70.0,
                              left: 20.0,
                              child: CircleAvatar(
                                radius: 20.0,
                                backgroundColor: Colors.black54,
                                child: ClipOval(
                                    child: Icon(Icons.space_bar)
                                ),
                              )
                          ),
                        ),

                        // Positioned(
                        //   top: 110.0,
                        //   left: 20.0,
                        //   child: CircleAvatar(
                        //     radius: 20.0,
                        //     backgroundColor: Colors.red,
                        //     child: Icon(Icons.person, color: Colors.white),
                        //   ),
                        // ),
                        // Positioned(
                        //   top: 140.0,
                        //   left: 20.0,
                        //   child: CircleAvatar(
                        //     radius: 20.0,
                        //     backgroundColor: Colors.red,
                        //     child: Icon(Icons.person, color: Colors.white),
                        //   ),
                        // ),
                      ],
                    )
                ))
          ],)
    );
  }

  Widget _buildBody() {
    return _getMap();
  }

  Widget _getMarker() {
    return Container(
      width: 40,
      height: 40,
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
                color: Colors.grey,
                offset: Offset(0, 3),
                spreadRadius: 4,
                blurRadius: 6)
          ]),
      child: ClipOval(child: Image.asset("assets/images/me1.jpeg")),
    );
  }

  Widget _getMarker2() {
    return Container(
      width: 40,
      height: 40,
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
                color: Colors.grey,
                offset: Offset(0, 3),
                spreadRadius: 4,
                blurRadius: 6)
          ]),
      child: ClipOval(child: Image.asset("assets/images/me2.jpeg")),
    );
  }

  Widget _getMarker3() {
    return Container(
      width: 40,
      height: 40,
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
                color: Colors.grey,
                offset: Offset(0, 3),
                spreadRadius: 4,
                blurRadius: 6)
          ]),
      child: ClipOval(child: Image.asset("assets/images/me3.jpeg")),
    );
  }

  Widget _getMarker4() {
    return Container(
      width: 40,
      height: 40,
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
                color: Colors.grey,
                offset: Offset(0, 3),
                spreadRadius: 4,
                blurRadius: 6)
          ]),
      child: ClipOval(child: Image.asset("assets/images/cat.jpg")),
    );
  }

  Widget _getMarker5() {
    return Container(
      width: 40,
      height: 40,
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
                color: Colors.grey,
                offset: Offset(0, 3),
                spreadRadius: 4,
                blurRadius: 6)
          ]),
      child: ClipOval(child: Image.asset("assets/images/me4.jpeg")),
    );
  }

  Widget _getMap() {
    return Stack(
      children: [
        GoogleMap(
          initialCameraPosition: _cameraPosition!,
          mapType: MapType.normal,
          onMapCreated: (GoogleMapController controller) {
            // now we need a variable to get the controller of google map
            if (!_googleMapController.isCompleted) {
              _googleMapController.complete(controller);
            }
          },
        ),
        Positioned.fill(
            child: Align(alignment: Alignment.center, child: _getMarker())),
        Positioned.fill(
            child:
            Align(alignment: Alignment(0.2, -0.6), child: _getMarker2())),
        Positioned.fill(
            child:
            Align(alignment: Alignment(-0.7, -0.5), child: _getMarker3())),
        Positioned.fill(
            child: Align(alignment: Alignment(0.4, 0.2), child: _getMarker4())),
        Positioned.fill(
            child:
            Align(alignment: Alignment(-0.7, 0.2), child: _getMarker5())),
        Positioned.fill(
            child: Align(alignment: Alignment(0.4, 0.0), child: _getMarker5())),
      ],
    );
  }
}


class NewPage extends StatelessWidget {
  final String userName;

  NewPage(this.userName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(
        child: Text(
          'Welcome to $userName\'s page!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}