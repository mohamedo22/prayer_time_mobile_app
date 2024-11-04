import 'package:dio/dio.dart';
import 'package:first_api_app/timeModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PrayerTimeService with ChangeNotifier {
  String? country = "egypt";
  String? date="3-11-2024";
  final Dio _dio = Dio();
  var data ;
  setCountry(String country_) {
    country = country_;
    notifyListeners();
  }
  fetching() async{
    var response = await _dio.get(
        "https://api.aladhan.com/v1/timingsByAddress/${date}?address=$country,UAE&method=8");
    data = response.data;
    notifyListeners();
  }
  setDate(String date_) {
    date = date_;
    notifyListeners();
  }
  getNextPray() {
    DateTime now = DateTime.now();
    String today = "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}";

    Duration mindiffrentTime = Duration.zero;
    String? nextPrayer;

    data["data"]["timings"].forEach((key, value) {
      DateTime prayerTime = DateTime.parse("$today ${value}:00");
      Duration diffrentTime = prayerTime.difference(now);

      if (diffrentTime.isNegative) {
        // If the prayer time has already passed today, consider it for the next day
        prayerTime = prayerTime.add(Duration(days: 1));
        diffrentTime = prayerTime.difference(now);
      }

      if (mindiffrentTime == Duration.zero || diffrentTime < mindiffrentTime) {
        mindiffrentTime = diffrentTime;
        nextPrayer = key;
      }
    });

      return "$nextPrayer\n${mindiffrentTime.inHours} hours and ${mindiffrentTime.inMinutes % 60} minutes";
  }
}
