import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../models/expense.dart';


class latlong {
  static List<LatLng> latlnglist = [
    LatLng( 19.101754 ,72.825660),
  LatLng( 19.102282, 72.826082),
  LatLng( 19.103634,  72.824304),
LatLng( 19.991042, 73.797906),

  ];
  static LatLng jw_marriot1 = LatLng( 19.101754 ,72.825660);
  static LatLng jw_marriot2 = LatLng( 19.102282, 72.826082);
  static LatLng juhu_beach = LatLng( 19.103634,  72.824304);
  static LatLng nashik = LatLng( 19.991042, 73.797906);



}

class ExpensesList{
  List<Expense> expenses = [
    Expense(time: DateTime(2023), amount: 320, category: 'Food', lat: 19.102282, lng:72.826082 ),
    Expense(time: DateTime(2022), amount: 1080, category: 'Shopping', lat: 19.103634, lng: 72.824304 ),
    Expense(time: DateTime(2023), amount: 320, category: 'Food', lat:19.991042, lng:73.797906 ),
  ];

}

