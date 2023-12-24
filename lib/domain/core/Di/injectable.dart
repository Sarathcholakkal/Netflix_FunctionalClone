import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:netflix_app/domain/core/Di/injectable.config.dart';

final getitobj = GetIt.instance;
@injectableInit
Future<void> configureinjection() async {
  getitobj.init(environment: Environment.prod);
}
