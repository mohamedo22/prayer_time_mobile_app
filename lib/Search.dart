import 'package:first_api_app/HomePage.dart';
import 'package:first_api_app/PrayerService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController countryController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var providerObject = Provider.of<PrayerTimeService>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                width: 150,
                child: Image.asset("imgs/Betterimage.ai_1730185098668.jpeg")),
            Text(
              "Welcome..",
              style: TextStyle(
                  foreground: Paint()..color = Colors.white, fontSize: 30),
            ),
            SizedBox(
              height: 40,
            ),
            SizedBox(
              width: 250,
              height: 60,
              child: TextFormField(
                style: TextStyle(foreground: Paint()..color = Colors.white),
                controller: countryController,
                decoration: InputDecoration(
                    labelText: 'Enter the country',
                    border: OutlineInputBorder()),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 250,
              height: 60,
              child: TextFormField(
                style: TextStyle(foreground: Paint()..color = Colors.white),
                controller: dateController,
                decoration: InputDecoration(
                    labelText: 'Enter the Date', border: OutlineInputBorder()),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                providerObject.setCountry(countryController.text);
                providerObject.setDate(dateController.text);
                Navigator.push(context, MaterialPageRoute(builder: (context) => Homepage()));
              },
              child: Text("Submit"),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  foregroundColor: Colors.white,
                  fixedSize: Size(150, 40),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
            )
          ],
        ),
      ),
    );
  }
}
