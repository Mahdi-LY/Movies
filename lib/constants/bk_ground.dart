import 'dart:ui';

import 'package:flutter/cupertino.dart';

import 'constants.dart';

class bk_ground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: screenWidth,
      height: screenHight,
      child: Stack(
        children: [
          Positioned(
            top: screenHight * 0.1,
            left: -88,
            child: Container(
              height: 166,
              width: 166,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Constants.kPinkColor,
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 200, sigmaY: 200),
                child: const SizedBox(
                  height: 166,
                  width: 166,
                ),
              ),
            ),
          ),
          Positioned(
            top: screenHight * 0.3,
            right: -100,
            child: Container(
              height: 200,
              width: 200,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Constants.kGreenColor,
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 200, sigmaY: 200),
                child: Container(
                  height: 200,
                  width: 200,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
