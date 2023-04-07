import 'package:flutter/material.dart';
import '../../../constants/constants.dart';
import '../data/model/movies_modelc_ontroller.dart';

class MovieItem02 extends StatelessWidget {
  final Data movie;
  final int movielingth;
  final int index;
 // final String mask;

  const MovieItem02({
    super.key,
    required this.movie,
    required this.movielingth,
    required this.index,
    //required this.mask,
  });

  @override
  Widget build(BuildContext context) {

    print("_____________MovieItem_______________");
    return SafeArea(
      bottom: false,
      child: ListView(
        primary: true,
        children: [
          SizedBox(
            height: 160,
            child: Container(
              margin: EdgeInsets.only(
                left: index == 0 ? 20 : 0,
              ),
              height: 160,
              width: 142,
              child: Image.network(
                movie.img.toString(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget backgroudImage() {
  return ShaderMask(
    shaderCallback: (bounds) => LinearGradient(
      colors: [Colors.transparent, Color(0xFFFF0000)],
      begin: Alignment.center,
      end: Alignment.center,
    ).createShader(bounds),
    blendMode: BlendMode.darken,
    child: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Constants.kMaskLastIndex),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
        ),
      ),
    ),
  );
}
