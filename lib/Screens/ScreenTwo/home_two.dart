import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:weather_app_project/Controller/home_controller.dart';
import 'package:weather_app_project/Screens/detail_screen.dart';
import 'package:weather_app_project/Screens/res/home_container.dart';
import 'package:weather_app_project/Weather/islamabad_weather.dart';
import 'package:weather_app_project/Weather/weather_model.dart';

class HomeScreenTwo extends StatefulWidget {
  const HomeScreenTwo({super.key});

  @override
  State<HomeScreenTwo> createState() => _HomeScreenTwoState();
}

class _HomeScreenTwoState extends State<HomeScreenTwo> {
  HomeXController homeXController = Get.put(HomeXController());
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/images.jpeg'),fit: BoxFit.cover),
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 20),
                child: Container(
                  // height: 40,
                  width: double.infinity,
                  child: TextFormField(
                    controller: homeXController.searchController.value,
                    decoration: InputDecoration(
                        suffixIcon: Icon(CupertinoIcons.search),
                        contentPadding: EdgeInsets.all(10),
                        hintText: 'Search City',
                        hintStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        filled: true,
                        fillColor: CupertinoColors.systemGrey4
                    ),
                    onChanged: (value) {
                      setState(() {

                      });
                    },
                  ),
                ),
              ),
              FutureBuilder(
                  future: homeXController.getWeather(),
                  builder: (context, snapshot) {
                if(snapshot.hasData) {
                  return ListTile(
                    onTap: () {
                      print('object');
                    },
                    title: Text(snapshot.data!.temp.toString()),
                  );
                }else{
                  return Center(child: CircularProgressIndicator(),);
                }
              })
            ],
          ),
        ),
      ),
    );
  }
}
