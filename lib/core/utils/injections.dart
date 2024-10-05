import 'package:get_it/get_it.dart';
import 'package:todo_list/feature/checklist/data/respositories/request_data.dart';
import 'package:todo_list/feature/checklist/data/respositories/send_data.dart';
import 'package:todo_list/feature/checklist/domain/entities/checklist.dart';
import 'package:todo_list/feature/checklist/presentation/bloc/checklist/checklist_bloc.dart';
import 'package:todo_list/feature/checklist/presentation/bloc/item/item_bloc.dart';
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
  location.registerFactory<ChecklistBloc>(
    () => ChecklistBloc(
      location(),
      location(),
    ),
  );
  location.registerFactory<ItemBloc>(
    () => ItemBloc(
      location(),
      location(),
    ),
  );

  //Repository Locator
  location.registerLazySingleton<AuthRepository>(
    () => AuthRepository(),
  );
  location.registerLazySingleton<RequestChecklistRepository>(
    () => RequestChecklistRepository(),
  );
  location.registerLazySingleton<SendDataRepository>(
    () => SendDataRepository(),
  );
}
