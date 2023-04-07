import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_movies/view/movies/widgets/item_movies.dart';
import '../../../components/masked_image.dart';
import '../../../constants/constants.dart';
import '../core/resourc.dart';
import '../cubit/movie_cubit.dart';
import '../cubit/movie_state.dart';
import '../data/model/movie_model.dart';
import 'item_movies02.dart';
import 'loading_center.dart';

class MovieList02 extends StatelessWidget {
  MovieList02({super.key});
  MoviesModelController? responce;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieCubit, MovieState>(
      builder: (context, state) {
        //context.read<MovieCubit>().getMovies();
        if (state.status == Status.loading) {
          return const LoadingCenter();
        }

        if (state.status == Status.success) {
          responce = (state.resorce as Success<MoviesModelController>).date;
          return Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: responce!.data!.length,
              itemBuilder: ((context, index) {
                // String mask;
                // if (index == 0) {
                //   mask = Constants.kMaskFirstIndex;
                // } else if (index == responce!.data!.length - 1) {
                //   mask = Constants.kMaskLastIndex;
                // } else {
                //   mask = Constants.kMaskCenter;
                // }
                MovieItem02(
                  movie: responce!.data![index],
                  movielingth: responce!.data!.length,
                  index: index,
                 // mask: mask,
                );
              }),
            ),
          );
        }
        if (state.status == Status.error) {
          responce = (state.resorce as Error<MoviesModelController>).message
              as MoviesModelController?;
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "${responce?.data.toString()}",
                style: const TextStyle(
                    fontSize: 28,
                    color: Colors.red,
                    fontWeight: FontWeight.bold),
              ),
            ],
          );
          // return Expanded(
          //   child: ListView.builder(
          //     itemCount: responce!.data!.length,
          //     itemBuilder: (context, index) {
          //       return MovieItem(
          //         movie: responce!.data![index],
          //       );
          //     },
          //   ),
          // );
        }
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Something Worring",
              style: TextStyle(
                  fontSize: 28, color: Colors.red, fontWeight: FontWeight.bold),
            ),
          ],
        ); //return LoadingCenter();
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
