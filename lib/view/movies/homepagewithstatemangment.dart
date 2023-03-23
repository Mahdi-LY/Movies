import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_movies/view/movies/cubit/movie_cubit.dart';
import 'package:task_movies/view/movies/cubit/movie_state.dart';

import '../drawer/drawer_moviepage.dart';
import 'widgets/list_movies.dart';

class HomePageMovies extends StatefulWidget {
  HomePageMovies({super.key});

  @override
  State<HomePageMovies> createState() => _HomePageMovies();
}

class _HomePageMovies extends State<HomePageMovies> {
  late MovieCubit bloc;
  @override
  void initState() {
    bloc = MovieCubit();
    super.initState();
    bloc.getMovies2();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [],
          title: Center(
            child: Text('Movies'),
          ),
        ),
        drawer: CustomDrawer(),
        body: BlocProvider(
          create: (context) => bloc,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Center(
              child: Column(
                children: [
                  //ButtonGetDataFromApi(),
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        MovieList(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class ButtonGetDataFromApi extends StatelessWidget {
  const ButtonGetDataFromApi({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieCubit, MovieState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
          child: ElevatedButton(
            child: Text('Click to Get Data From Api !'),
            onPressed: () {
              context.read<MovieCubit>().getMovies2();
            },
          ),
        );
      },
    );
  }
}

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
