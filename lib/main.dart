import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_app/application/HotandNew/hotand_new_bloc.dart';
import 'package:netflix_app/application/download/download_bloc.dart';
import 'package:netflix_app/application/fastandlaugh/fastandlaugh_bloc.dart';
import 'package:netflix_app/application/home_screen/homescreen_bloc.dart';
import 'package:netflix_app/application/search/search_bloc.dart';

// import 'package:netflix_app/application/downloads/downloads_bloc.dart';
import 'package:netflix_app/core/colors.dart';
import 'package:netflix_app/domain/core/Di/injectable.dart';
// import 'package:netflix_app/domain/core/di/injectable.dart';
import 'package:netflix_app/presentation/main_page/screen_main_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureinjection();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => getitobj<DownloadsBloc>(),
      ),
      BlocProvider(
        create: (context) => getitobj<SearchBloc>(),
      ),
      BlocProvider(create: (context) => getitobj<FastandlaughBloc>()),
      BlocProvider(create: (context) => getitobj<HotandNewBloc>()),
      BlocProvider(create: (context) => getitobj<HomescreenBloc>())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.transparent, elevation: 0),
          primaryColor: Colors.blue,
          scaffoldBackgroundColor: backgroundcolornetflix,
          textTheme: const TextTheme(
              bodyLarge: TextStyle(color: Colors.white),
              bodyMedium: TextStyle(color: Colors.white)),
          useMaterial3: true,
          fontFamily: GoogleFonts.montserrat().fontFamily),
      home: ScreenMainPage(),
    );
  }
}
