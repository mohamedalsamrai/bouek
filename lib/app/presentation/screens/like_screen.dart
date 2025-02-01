import 'package:bouek/app/presentation/di/locator_di.dart';
import 'package:bouek/domain/repositories/sentiments_repository.dart';
import 'package:bouek/domain/usecases/get_sentiments.dart';
import 'package:flutter/material.dart';

class LikeScreen extends StatelessWidget {
  const LikeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: GetSentiments(s1<SentimentsRepository>()).get('ADNYCCTB'),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text("${snapshot.data!.catering}");
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
