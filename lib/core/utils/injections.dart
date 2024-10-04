import 'package:get_it/get_it.dart';
import 'package:todo_list/feature/login/data/repositories/auth_repository.dart';
import 'package:todo_list/feature/login/presentation/bloc/auth/auth_bloc.dart';

GetIt location = GetIt.instance;

init() async {
  //Bloc Locator
  location.registerFactory<AuthBloc>(
    () => AuthBloc(
      location(),
    ),
  );

  //Repository Locator
  location.registerLazySingleton<AuthRepository>(
    () => AuthRepository(),
  );
}
