import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_list/core/routing/router.dart';
import 'package:todo_list/feature/checklist/presentation/bloc/checklist/checklist_bloc.dart';
import 'package:todo_list/feature/checklist/presentation/bloc/item/item_bloc.dart';
import 'package:todo_list/feature/login/presentation/bloc/auth/auth_bloc.dart';
import 'package:todo_list/core/utils/injections.dart' as di;

void main() {
  runApp(const MyHomePage());
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override

  /// Initializes [di] before the widget is built.
  void initState() {
    di.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => di.location<AuthBloc>(),
        ),
        BlocProvider<ChecklistBloc>(
          create: (context) => di.location<ChecklistBloc>(),
        ),
        BlocProvider<ItemBloc>(
          create: (context) => di.location<ItemBloc>(),
        ),
      ],
      child: ScreenUtilInit(
        splitScreenMode: true,
        designSize: const Size(390, 844),
        minTextAdapt: true,
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routeInformationParser: router.routeInformationParser,
          routerDelegate: router.routerDelegate,
          routeInformationProvider: router.routeInformationProvider,
        ),
      ),
    );
  }
}
