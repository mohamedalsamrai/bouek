import 'package:bouek/app/presentation/di/locator_di.dart';
import 'package:bouek/app/presentation/widgets/customAppBar.dart';
import 'package:bouek/app/utils/constants/colors.dart';
import 'package:bouek/domain/repositories/hotel_repository.dart';
import 'package:bouek/domain/usecases/get_hotel_by_hotel_id_usecase.dart';
import 'package:flutter/material.dart';
import '../widgets/hotel_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: RichText(
              textAlign: TextAlign.center,
              text: const TextSpan(
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Color(0xffaeaeb4),
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                  text: 'London\n',
                  children: [
                    TextSpan(
                        text: 'Haymarket',
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            color: Color(0xff1e1e1e),
                            fontWeight: FontWeight.w600,
                            fontSize: 18))
                  ])),
          leadingIcon: 'location',
          trailingIcon: 'notifications',
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Nearby',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: primaryColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 10),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        hotelCard(
                          name: 'LA Gaffe London',
                          price: '200',
                          location: '4 rue de Valois',
                          rating: '4.50',
                          image:
                              'https://stayatthei.com/wp-content/uploads/2023/03/IMG_1351-scaled-e1686322966702.jpeg',
                        ),
                        const SizedBox(height: 20), // Space between each card
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
