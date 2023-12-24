import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/application/search/search_bloc.dart';
import 'package:netflix_app/core/constant.dart';
import 'package:netflix_app/presentation/search/SearchIdelWidjet.dart';
import 'package:netflix_app/presentation/search/Search_result_widjet.dart';

class ScreenSearch extends StatelessWidget {
  const ScreenSearch({super.key});

  @override
  Widget build(BuildContext context) {
    // WidgetsBinding.instance!.addPostFrameCallback((_) {
    //   BlocProvider.of<SearchBloc>(context).add(SearchEvent.initialize());
    // });
    BlocProvider.of<SearchBloc>(context).add(SearchEvent.initialize());
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CupertinoSearchTextField(
                style: TextStyle(color: Colors.white),
                backgroundColor: Colors.grey.withOpacity(.3),
                prefixIcon: const Icon(
                  CupertinoIcons.search,
                  color: Colors.grey,
                ),
                suffixIcon: const Icon(
                  CupertinoIcons.xmark_circle_fill,
                  color: Colors.grey,
                ),
              ),
              Expanded(
                child: SearchIdelWidjet(),
                // SearchresultWidjet(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
