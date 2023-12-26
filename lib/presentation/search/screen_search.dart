import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/application/search/search_bloc.dart';
import 'package:netflix_app/core/constant.dart';
import 'package:netflix_app/domain/core/debounce/debounce.dart';
import 'package:netflix_app/presentation/search/SearchIdelWidjet.dart';
import 'package:netflix_app/presentation/search/Search_result_widjet.dart';

class ScreenSearch extends StatelessWidget {
  ScreenSearch({super.key});
  final _debouncer = Debouncer(milliseconds: 1 * 1000);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      BlocProvider.of<SearchBloc>(context).add(const SearchEvent.initialize());
    });

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CupertinoSearchTextField(
                style: const TextStyle(color: Colors.white),
                backgroundColor: Colors.grey.withOpacity(.3),
                prefixIcon: const Icon(
                  CupertinoIcons.search,
                  color: Colors.grey,
                ),
                suffixIcon: const Icon(
                  CupertinoIcons.xmark_circle_fill,
                  color: Colors.grey,
                  //adding bloc provider
                ),
                onChanged: (value) {
                  -_debouncer.run(() {
                    BlocProvider.of<SearchBloc>(context)
                        .add(SearchEvent.searchmovies(movieQuery: value));
                  });
                },
                //
              ),
              Expanded(
                child: BlocBuilder<SearchBloc, SearchState>(
                    builder: (context, state) {
                  if (state.searchlist!.isEmpty) {
                    return const SearchIdelWidjet();
                  } else {
                    return const SearchresultWidjet();
                  }
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
