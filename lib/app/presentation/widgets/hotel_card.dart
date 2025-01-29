import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/constants/colors.dart';

Widget hotelCard({
  required String name,
  required String price,
  required String location,
  required String rating,
}) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: const [
        BoxShadow(
          color: Color(0x0F000000),
          blurRadius: 4,
          spreadRadius: 1,
          offset: Offset(0, 0),
        ),
      ],
    ),
    child: Container(
      padding: const EdgeInsets.all(10),
      width: 382,
      height: 291,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: SizedBox(
        height: 267,
        width: 358,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: 358,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset(
                'assets/images/hotelimg.png',
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            // name and price
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    color: Color(0xff272727),
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
                RichText(
                  text: TextSpan(
                      text: '\$$price',
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        color: primaryColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                      children: const [
                        TextSpan(
                            text: '/night',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              color: secondaryColor,
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                            ))
                      ]),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),

            //location and rating
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //location row
                SizedBox(
                  width: 126,
                  height: 22,
                  child: Row(
                    spacing: 4,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 20,
                        width: 20,
                        child: SvgPicture.asset(
                          'assets/icons/location_filled.svg',
                          width: 20,
                          height: 20,
                          // color: primaryColor,
                        ),
                      ),
                      Text(
                        location,
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          color: secondaryColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),

                //rating row
                SizedBox(
                  width: 55,
                  height: 22,
                  child: Row(
                    spacing: 4,
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 20,
                        width: 20,
                        child: SvgPicture.asset(
                          'assets/icons/rating.svg',
                          width: 20,
                          height: 20,
                          // color: primaryColor,
                        ),
                      ),
                      Text(
                        rating,
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          color: secondaryColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    ),
  );
}
