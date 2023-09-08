// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:weather_app_project/Screens/info_screen.dart';
// import 'package:weather_app_project/Screens/res/hourly_box.dart';
// import 'package:weather_app_project/Weather/islamabad_weather.dart';
//
// import '../Weather/detailed_hourly_model.dart';
//
// class DetailScreen extends StatefulWidget {
//   const DetailScreen({super.key});
//
//   @override
//   State<DetailScreen> createState() => _DetailScreenState();
// }
//
// class _DetailScreenState extends State<DetailScreen> {
//   LondonForecast df = LondonForecast();
//   IslamabadUpdate isb = IslamabadUpdate();
//   HourlyF hourlyForecasts = HourlyF();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//             image: DecorationImage(image: AssetImage('assets/bg.jpg'),fit: BoxFit.cover)
//         ),
//         child: FutureBuilder(
//           future: isb.getHourly('islamabad'),
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               return InfoScreen(
//                   title: snapshot.data!.name.toString(),
//                   // temp: '${snapshot.data!.temp!.toStringAsFixed(0)}°',
//                   description: snapshot.data!.description.toString(),
//                   feelLike: '${snapshot.data!.feel!.toStringAsFixed(0)}°C',
//                   humidity: '${snapshot.data!.humidity.toString()}%',
//                   wind: '${snapshot.data!.wind.toString()}m/s'
//               );
//             } else {
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }
// }
//
// //
// //
// //       child: FutureBuilder(
// //           future: isb.getHourly(),
// //           builder: (context, snapshot) {
// //         if(snapshot.hasData) {
// //           return
// //         }else{
// //           return const Center(child: CircularProgressIndicator());
// //         }
// //       }),
// //     );
// //   }
// // }
//
// // FutureBuilder(
// // future: HourlyF().getHourly(),
// // builder: (context, snapshot) {
// // if(snapshot.hasData) {
// // List<Hourly> list = snapshot.data!.toList();
// // return ListView.builder(
// // itemCount: list.length,
// // itemBuilder: (context, index) {
// // return Container(
// // height: 150,
// // child: ListView.builder(
// // itemCount: list.length,
// // itemBuilder: (context, snapshot) {
// // return HourlyBox(degree: list[index].temp.toString(), dateTime: list[index].dt );
// // }),
// // );
// // });
// // }else{
// // return const Center(child: CircularProgressIndicator());
// // }
// // })
//
// // InfoScreen(date: DateTime.now(), temp: snapshot.data!.temp.toString(), title: snapshot.data!.name.toString(),
// //     description: snapshot.data!.description.toString(), feelLike: snapshot.data!.feel.toString(),
// //     humidity: snapshot.data!.humidity.toString(), wind: snapshot.data!.wind.toString()
