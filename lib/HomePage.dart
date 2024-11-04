import 'package:first_api_app/PrayerService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PrayerTimeService>(
      builder: (context, providerObject, child)
      {
        providerObject.fetching();
        return Scaffold(
            body: Stack(
              children: [
                Image.asset(
                  "imgs/backGround.jpeg",
                  height: 400,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(60),
                  child: Container(
                      decoration: BoxDecoration(boxShadow: [
                        BoxShadow(
                            color: Colors.black54, blurRadius: 10, spreadRadius: 30)
                      ], borderRadius: BorderRadius.circular(50)),
                      child: Text(
                        providerObject.getNextPray(),
                        style: TextStyle(
                            foreground: Paint()..color = Colors.white, fontSize: 30),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 5 , right: 5 , top: 300),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            padding: EdgeInsets.all(15),
                            itemBuilder: (context, index) {
                              String key = providerObject.data["data"]["timings"]
                                  .keys.elementAt(index);
                              String value = providerObject
                                  .data["data"]["timings"][key];
                              return Container(
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Colors.black87,
                                  
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  
                                  child: Row(

                                    children: [
                                      Text(key , style: TextStyle(foreground: Paint()..color=Colors.white),),
                                      Expanded(child: SizedBox()),
                                      Text(value, style: TextStyle(foreground: Paint()..color=Colors.white),)
                                    ],
                                  ),
                                )
                                ,
                              );
                            },itemCount: 11,),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ));
      },
    );
  }
}
