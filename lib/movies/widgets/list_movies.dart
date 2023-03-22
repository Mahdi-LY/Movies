import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_movies/movies/core/resourc.dart';
import 'package:task_movies/movies/cubit/movie_cubit.dart';

import 'package:task_movies/movies/cubit/movie_state.dart';
import 'package:task_movies/movies/data/model/movie_model.dart';
import 'package:task_movies/movies/data/model/movies_modelc_ontroller.dart';
import 'package:task_movies/movies/widgets/item_movies.dart';
import 'package:task_movies/movies/widgets/loading_center.dart';

class MovieList extends StatelessWidget {
  MovieList({super.key});
  MoviesModelController? store;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieCubit, MovieState>(
      builder: (context, state) {
        //context.read<MovieCubit>().getMovies();
        if (state.status == Status.loading) {
          return RefreshProgressIndicator();
        }

        if (state.status == Status.success) {
          store = (state.resorce as Success<MoviesModelController>).date;
          return Expanded(
            child: ListView.builder(
              itemCount: store!.data!.length,
              itemBuilder: (context, index) {
                return MovieItem(
                  movie: store!.data![index],
                );
              },
            ),
          );
        }

        return LoadingCenter(); //return LoadingCenter();
      },
    );
  }
}








// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:task_movies/movies/core/resourc.dart';
// import 'package:task_movies/movies/cubit/movie_cubit.dart';
// import 'package:task_movies/movies/cubit/movie_state.dart';
// import 'package:task_movies/movies/data/model/movie_model.dart';
// import 'package:task_movies/movies/data/model/movies_modelc_ontroller.dart';
// import 'package:task_movies/movies/widgets/item.dart';
// import 'package:task_movies/movies/widgets/loading_center.dart';

// class MovieList extends StatelessWidget {
//   MovieList({
//     super.key,
//   });
//   MoviesModelController? list;
//   @override

//   Widget build(BuildContext context) {
//     // context.read<PrudactCubit>().getProudact();
//     print("ssssssssssssssssProductList!!! ssssssssssssssssssss");
//     return BlocListener<MovieCubit, MovieState>(
//       listener: (context, state) {
//         // TODO: implement listener
//       },
//       child: BlocBuilder<MovieCubit, MovieState>(
//         builder: (context, state) {
//           print("sssssssssssssssssssBlocBuilder!!!!!sssssssssssssssss");
//           if (state.resorce is Success<MoviesModelController>) {
//             list = (state.resorce as Success<MoviesModelController>).date;
//           }
//           if (state.resorce is Loading<Data>) {
//             return Center(child: LoadingCenter());
//           }
//           return ListView.builder(
//             itemCount: list!.data!.length,
//             itemBuilder: (context, index) {
//               return MovieItem(
//                 movie: list!.data![index],
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
