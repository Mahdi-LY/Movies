import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_movies/view/movies/cubit/movie_cubit.dart';
import 'package:task_movies/view/movies/widgets/item_movies02.dart';
import 'package:task_movies/view/movies/widgets/list_movies02.dart';

import '../../components/search_filed_widget.dart';
import '../../constants/constants.dart';
import '../drawer/drawer_moviepage.dart';
import 'widgets/list_movies.dart';

class HomePageMovies02 extends StatefulWidget {
  const HomePageMovies02({super.key});

  @override
  State<HomePageMovies02> createState() => _HomePageMovies02();
}

class _HomePageMovies02 extends State<HomePageMovies02> {
  late MovieCubit bloc;
  @override
  void initState() {
    bloc = MovieCubit();
    super.initState();
    bloc.getMovies2();
  }

  @override
  Widget build(BuildContext context) {
    final screenHight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Constants.kBlackColor,
      appBar: AppBar(
        actions: [],
        title: const Center(
          child: Text('Movies'),
        ),
      ),
      drawer: const CustomDrawer(),
      extendBody: true,
      body: BlocProvider(
        create: (context) => bloc,
        child: SizedBox(
          height: screenHight,
          width: screenWidth,
          child: Stack(
            children: [
              Positioned(
                top: -100,
                left: -100,
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Constants.kGreenColor.withOpacity(0.5),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 200,
                      sigmaY: 200,
                    ),
                    child: Container(
                      height: 200,
                      width: 200,
                      color: Colors.transparent,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: screenHight * 0.4,
                right: -88,
                child: Container(
                  height: 166,
                  width: 166,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Constants.kPinkColor.withOpacity(0.5),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 200,
                      sigmaY: 200,
                    ),
                    child: Container(
                      height: 166,
                      width: 166,
                      color: Colors.transparent,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: -100,
                left: -100,
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Constants.kCyanColor.withOpacity(0.5),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 200,
                      sigmaY: 200,
                    ),
                    child: Container(
                      height: 200,
                      width: 200,
                      color: Colors.transparent,
                    ),
                  ),
                ),
              ),
              SafeArea(
                bottom: false,
                child: ListView(
                  primary: true,
                  children: [
                    SizedBox(
                      height: 24,
                    ),
                    Text(
                      'What would you\nlike to watch?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28,
                        color: Constants.kWhiteColor,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    SearchFieldWidget(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                    ),
                    SizedBox(
                      height: 39,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20.0),
                      child: Text(
                        'Popular movies',
                        style: TextStyle(
                          color: Constants.kWhiteColor,
                          fontSize: 17,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 37,
                    ),
                 //   MovieList02(),
                  ],
                ),
              ), /////////////////
            ],
          ),
        ),
      ),
    );
  }
}

// class ButtonGetDataFromApi extends StatelessWidget {
//   const ButtonGetDataFromApi({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<MovieCubit, MovieState>(
//       builder: (context, state) {
//         return Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
//           child: ElevatedButton(
//             child: const Text('Click to Get Data From Api !'),
//             onPressed: () {
//               context.read<MovieCubit>().getMovies2();
//             },
//           ),
//         );
//       },
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:task_movies/movies/widgets/list_product.dart';

// import 'cubit/Movie_cubit.dart';

// class HomePageMovies extends StatelessWidget {
//   const HomePageMovies({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => MovieCubit(),
//       child: Scaffold(
//           appBar: AppBar(
//             title: Text("Movies "),
//             actions: [],
//           ),
//           body: BlocProvider(
//             create: (context) => MovieCubit(),
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 8),
//               child: Center(
//                 child: Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: const [
//                         Text(
//                           'My Home Page',
//                           style: TextStyle(
//                               fontSize: 32,
//                               color: Colors.white,
//                               fontFamily: 'pacifico'),
//                         ),
//                       ],
//                     ),
//                     Flexible(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           MovieList(),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           )),
//     );
//   }
// }

// Widget textViewtwo(String text) {
//   return Text(
//     text,
//     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//   );
// }

// class TextView extends StatelessWidget {
//   const TextView({super.key, required this.text});
//   final String text;

//   @override
//   Widget build(BuildContext context) {
//     return Text(
//       text,
//       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//     );
//   }
// }
