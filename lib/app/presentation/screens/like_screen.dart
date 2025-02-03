import 'package:bouek/app/presentation/di/locator_di.dart';
import 'package:bouek/domain/repositories/hotel_repository.dart';
import 'package:bouek/domain/repositories/offer_repository.dart';
import 'package:bouek/domain/repositories/sentiments_repository.dart';
import 'package:bouek/domain/usecases/get_hotel_by_hotel_id_usecase.dart';
import 'package:bouek/domain/usecases/get_offers_by_hotel_id_usecase.dart';
import 'package:bouek/domain/usecases/get_sentiments.dart';
import 'package:flutter/material.dart';

class LikeScreen extends StatelessWidget {
  const LikeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future:
              GetHotelByHotelIdUsecase(s1<HotelRepository>()).call("MCLONGHM"),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text("${snapshot.data}");
            }
            if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}
