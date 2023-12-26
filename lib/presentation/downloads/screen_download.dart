import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:netflix_app/application/download/download_bloc.dart';
// import 'package:netflix_app/application/downloads/downloads_bloc.dart';
import 'package:netflix_app/core/colors.dart';
import 'package:netflix_app/core/constant.dart';

import 'package:netflix_app/presentation/widjets/appBar_widjet.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

class ScreenDownload extends StatelessWidget {
  ScreenDownload({super.key});
  final _widjetList = [const _Smartdownload(), Section2(), const Section3()];
  // final _widjetList = [Section2()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: AppBarWidjet(
              tittle: 'Downloads',
            )),
        body: ListView.separated(
            padding: const EdgeInsets.all(5),
            itemBuilder: (
              ctx,
              index,
            ) =>
                _widjetList[index],
            separatorBuilder: (ctx, index) => const SizedBox(height: 20),
            itemCount: _widjetList.length));
  }
}

class _Smartdownload extends StatelessWidget {
  const _Smartdownload({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(
          Icons.settings_outlined,
          color: kwhitecolor,
        ),
        kwidth,
        Text(
          'Smart downloads',
          style: TextStyle(
              color: kwhitecolor, fontSize: 15, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}

class Section2 extends StatelessWidget {
  const Section2({super.key});
  // final List imageList = [
  //   'https://www.themoviedb.org/t/p/w600_and_h900_bestv2/y4YMYsGSMwu8e985g0Zbumvqxld.jpg',
  //   "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/exFEYr9mJ4A0VtQZjrKaXdk82DB.jpg",
  //   "https://www.themoviedb.org/t/p/w600_and_h900_bestv2/uJYYizSuA9Y3DCs0qS4qWvHfZg4.jpg"
  // ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      BlocProvider.of<DownloadsBloc>(context)
          .add(DownloadsEvent.getDownloadsimagefn());
    });

    return Column(
      children: [
        const Text(
          'Introducing Downloads for You ',
          style: TextStyle(
              color: kwhitecolor, fontWeight: FontWeight.bold, fontSize: 23),
          textAlign: TextAlign.center,
        ),
        kheight,
        const Text(
          "We will download a personalised selection of\nmovies and shows for you , so there's \nalways something to watch on your \n device.",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey, fontSize: 17),
        ),
        //
        BlocBuilder<DownloadsBloc, DownloadsState>(
          builder: (context, state) {
            // print("downloads list lenghth is${state.downloads?.length}");
            return (state.downloads.length) == 0
                ? SizedBox(
                    width: size.width,
                    height: size.width * .95,
                  )
                : SizedBox(
                    width: size.width,
                    height: size.width * .95,
                    child: state.isloading
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : Stack(
                            alignment: Alignment.topCenter,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(bottom: 40, top: 10),
                                child: CircleAvatar(
                                  backgroundColor: Colors.grey.withOpacity(0.4),
                                  radius: size.width * .36,
                                ),
                              ),
                              DownloadImageWidjet(
                                  margin:
                                      const EdgeInsets.only(left: 200, top: 56),
                                  imagelist:
                                      //  imageList[0],

                                      "$imageAppendurl${state.downloads?[0].posterPath ?? "/7BpNtNfxuocYEVREzVMO75hso1l.jpg"}",
                                  angle: 15,
                                  size: Size(size.width * .3, size.width * .5)),
                              DownloadImageWidjet(
                                  margin: const EdgeInsets.only(
                                      right: 200, top: 56),
                                  imagelist:
                                      //  imageList[0],
                                      "$imageAppendurl${state.downloads?[2].posterPath ?? "/7BpNtNfxuocYEVREzVMO75hso1l.jpg"}",
                                  // "$imageAppendurl${state.downloads?[9].posterPath}",
                                  angle: -15,
                                  size: Size(size.width * .3, size.width * .5)),
                              DownloadImageWidjet(
                                margin: const EdgeInsets.only(
                                  top: 60,
                                ),
                                imagelist:
                                    // imageList[0],
                                    // "$imageAppendurl${state.downloads?[4].posterPath}",
                                    "$imageAppendurl${state.downloads?[3].posterPath ?? "/7BpNtNfxuocYEVREzVMO75hso1l.jpg"}",
                                size: Size(size.width * .36, size.width * .55),
                              )
                            ],
                          ));
          },
        ),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MaterialButton(
          color: kbuttoncolorBlue,
          onPressed: () {},
          minWidth: 370,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              'Set up',
              style: TextStyle(
                  color: kwhitecolor,
                  fontSize: 15,
                  fontWeight: FontWeight.w900),
            ),
          ),
        ),
        kheight,
        MaterialButton(
          color: KbuttoncolorWhite,
          onPressed: () {},
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: const Text(
            'See What you Can Download',
            style: TextStyle(
                color: KblackColor, fontSize: 20, fontWeight: FontWeight.w900),
          ),
        )
      ],
    );
  }
}

class DownloadImageWidjet extends StatelessWidget {
  const DownloadImageWidjet(
      {super.key,
      this.angle = 0,
      required this.margin,
      required this.imagelist,
      required this.size});

  final double angle;
  final EdgeInsets margin;
  final String imagelist;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle * pi / 180,
      child: Container(
        margin: margin,
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          // color: Colors.red,
          image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(
              imagelist,
            ),
            // fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
