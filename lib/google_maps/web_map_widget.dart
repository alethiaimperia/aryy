// ignore: avoid_web_libraries_in_flutter
import 'dart:html';
import 'dart:ui' as ui;
import './map_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_maps/google_maps.dart';

// This file will contain the google map shown on web

MapWidget getMapWidget() => WebMap();

class WebMap extends StatefulWidget implements MapWidget {
  WebMap({Key? key}) : super(key: key);

  @override
  State<WebMap> createState() => WebMapState();
}

class WebMapState extends State<WebMap> {
  @override
  Widget build(BuildContext context) {
    final String htmlId = "map";

    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(htmlId, (int viewId) {
      final mapOptions = MapOptions()
        ..zoom = 15.0
        ..center = LatLng(35.7560423, 139.7803552);

      final elem = DivElement()..id = htmlId;
      final map = GMap(elem, mapOptions);

      map.onCenterChanged.listen((event) {});
      map.onDragstart.listen((event) {});
      map.onDragend.listen((event) {});

      Marker(MarkerOptions()
        ..position = map.center
        ..map = map);

      return elem;
    });
    return HtmlElementView(viewType: htmlId);
  }
}


// FlutterFlowGoogleMap(
//   controller: googleMapsController,
//   onCameraIdle: (latLng) => googleMapsCenter = latLng,
//   initialLocation: googleMapsCenter ??=
//       LatLng(16.7516, 93.103),
//   markerColor: GoogleMarkerColor.violet,
//   mapType: MapType.normal,
//   style: GoogleMapStyle.standard,
//   initialZoom: 14,
//   allowInteraction: true,
//   allowZoom: true,
//   showZoomControls: true,
//   showLocation: true,
//   showCompass: false,
//   showMapToolbar: false,
//   showTraffic: false,
//   centerMapOnMarkerTap: true,
// ),