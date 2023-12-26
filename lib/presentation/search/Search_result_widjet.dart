import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/application/search/search_bloc.dart';
import 'package:netflix_app/core/constant.dart';

import 'package:netflix_app/presentation/widjets/text_tittle_widjet.dart';

// final imageUrlVertival =
//     "https://www.themoviedb.org/t/p/w220_and_h330_face/7NAvPYPAu7MeHwP8E9sn81PqsRh.jpg";

class SearchresultWidjet extends StatelessWidget {
  const SearchresultWidjet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextTittleWidjet(textTittle: 'Movies & T V'),
          kheight,
          Expanded(
            child: BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                return GridView.count(
                  crossAxisCount: 3,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 1.1 / 1.6,
                  children: List.generate(20, (index) {
                    final movie = state.searchlist![index];
                    return MainCard(
                        searchimage: "$imageAppendurl${movie.posterPath}");
                  }),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class MainCard extends StatelessWidget {
  final String searchimage;
  const MainCard({required this.searchimage, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(searchimage), fit: BoxFit.fill),
          borderRadius: const BorderRadius.all(Radius.circular(7))),
    );
  }
}
