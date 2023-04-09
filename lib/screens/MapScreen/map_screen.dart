import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:flutterati_codeshastra/constants/colors.dart';
import 'package:flutterati_codeshastra/screens/Home/controller/home_controller.dart';
import 'package:flutterati_codeshastra/screens/MapScreen/locationlatlong.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

import '../../models/expense.dart';
import 'CustomMarkerCard.dart';




class MapScreen extends StatefulWidget {

  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

 class _MapScreenState extends State<MapScreen> {

  late LatLng mapLatLong;
  final _searchcontroller = TextEditingController();
  Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
  CustomInfoWindowController _customInfoWindowController = CustomInfoWindowController();

  Future<Map<String, double>> getLatLong(String locationName) async {
    final apiKey = 'AIzaSyDfk0h3OaNrAb5F17sZiA9dckWQzd9jCPc';
    final apiUrl =
        'https://maps.googleapis.com/maps/api/geocode/json?address=$locationName&key=$apiKey';

    final response = await http.get(Uri.parse(apiUrl));
    final responseBody = json.decode(response.body);

    if (responseBody['status'] == 'OK') {
      final location = responseBody['results'][0]['geometry']['location'];
      final lat = location['lat'];
      final lng = location['lng'];
      return {'lat': lat, 'lng': lng};
    } else {
      throw Exception('Failed to retrieve latitude and longitude');
    }
  }

  //intial positon
  static final CameraPosition _intialpositon = CameraPosition(
    target: LatLng(19.115755, 72.88141659999999),
    zoom: 13,
  );


  //markers


  List<Marker> _markers = [];
  HomeController homeController = Get.put(HomeController());

  loaddata() async {
    for(int i=0;i< ExpensesList.expenses.length;i++) {
      _markers.add(
        Marker(
            markerId: MarkerId("i",),
            icon: BitmapDescriptor.defaultMarker,
            position: LatLng(
                ExpensesList.expenses[i].lat, ExpensesList.expenses[i].lng),
            onTap: () {
              _customInfoWindowController.addInfoWindow!(
                MyCard(expense: ExpensesList.expenses[i],),
                LatLng(
                    ExpensesList.expenses[i].lat, ExpensesList.expenses[i].lng),
              );
            }

        ),
      );
    }
      setState(() {

      });
    //
    }

    // ExpensesList explistObj = ExpensesList();
    // List<Expense> list = await explistObj.giveExpenseList();
    // print(list[0].amount);
    // for (int i = 0; i < list.length; i++) {
    //   print(list[i].lat);
    //   _markers.add(
    //     Marker(
    //         markerId: MarkerId("i",),
    //         icon: BitmapDescriptor.defaultMarker,
    //         position: LatLng(list[i].lat, list[i].lat),
    //         onTap: () {
    //           _customInfoWindowController.addInfoWindow!(
    //             MyCard(expense: list[i],),
    //             LatLng(list[i].lat, list[i].lat),
    //           );
    //         }
    //
    //     ),
    //   );
    //   setState(() {
    //
    //   });
    // }

    @override
    void initState() {
      // TODO: implement initState
      loaddata();
    }


    @override
    Widget build(BuildContext context) {
      return Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [

            GoogleMap(
              onTap: (postions){
                _customInfoWindowController.hideInfoWindow!();
                setState(() {
                  
                });
              },
              initialCameraPosition: _intialpositon,
              markers: Set.of(_markers),
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
                _customInfoWindowController.googleMapController = controller;
              },
            ),
            CustomInfoWindow(
              controller: _customInfoWindowController,
              height: 100,
              width: 150,
              offset: 35,


            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              child:
              Container(
                // color: Colors.black,

                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: raisinBlack,

                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: TextField(
                      controller: _searchcontroller,
                      textAlignVertical: TextAlignVertical.center,
                      onSubmitted: (String value) async {
                        final latlongmap = await getLatLong(value);
                        GoogleMapController controller = await _controller
                            .future;
                        controller.animateCamera(CameraUpdate.newCameraPosition(
                            CameraPosition(
                              target: LatLng(latlongmap['lat']!.toDouble(),
                                  latlongmap['lng']!.toDouble()),
                              zoom: 14,
                            )
                        ));
                        setState(() {

                        });
                      },


                      decoration: InputDecoration(
                        counterStyle: TextStyle(fontSize: 50),
                        labelStyle: TextStyle(fontSize: 20),
                        labelText: "Search Location",

                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.add_location, size: 30,),
                        suffix: IconButton(
                          icon: Icon(Icons.clear), onPressed: () {
                          _searchcontroller.clear();
                        },
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                      ),
                    ),
                  )
              ),


            ),
          ],
        ),
      );
    }
  }


