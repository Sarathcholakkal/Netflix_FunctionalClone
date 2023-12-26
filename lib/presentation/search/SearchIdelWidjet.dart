import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/application/search/search_bloc.dart';

import 'package:netflix_app/core/constant.dart';
import 'package:netflix_app/presentation/widjets/text_tittle_widjet.dart';

// const String imageUrl =
//     "https://www.themoviedb.org/t/p/w250_and_h141_face/7RySzFeK3LPVMXcPtqfZnl6u4p1.jpg";

class SearchIdelWidjet extends StatelessWidget {
  const SearchIdelWidjet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kheight,
        const TextTittleWidjet(textTittle: 'Top Searches'),
        kheight,
        Expanded(
          child: BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              if (state.isloading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state.iserror) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final movie = state.idlelist[index];
                      return TopSearchItemTile(
                          imageurl: "$imageAppendurl${movie.posterPath ?? ''}",
                          tittle: movie.title ?? 'notittle');
                    },
                    separatorBuilder: (ctx, inex) => kheight,
                    itemCount: state.idlelist.length);
              }
            },
          ),
        ),
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  const TopSearchItemTile(
      {required this.imageurl, required this.tittle, super.key});

  final String imageurl;
  final String tittle;
  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;

    return Row(
      children: [
        Container(
          width: screenwidth * .33,
          height: 80,
          decoration: BoxDecoration(
            image: DecorationImage(
              //
              image: NetworkImage(imageurl),
              //
              fit: BoxFit.fill,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              tittle,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Container(
            width: 60.0, // Adjust the size as needed
            height: 60.0, // Adjust the size as needed
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: 4.0,
              ),
              color: Colors.black,
            ),
            child: const Center(
              child: Icon(
                Icons.play_arrow,
                color: Colors.white,
                size: 40.0, // Adjust the size as needed
              ),
            ))
      ],
    );
  }
}
