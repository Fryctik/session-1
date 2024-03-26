import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:session1/cubit/check_watch_onboard_cubit.dart';
import 'package:session1/data/local_repository/local_reposutory.dart';
import 'package:session1/domain/local_interface/local_interface.dart';
import 'package:session1/presentation/onboard_screen/cubit/onboard_cubit.dart';
import 'package:session1/presentation/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  final SharedPreferences prefs = await SharedPreferences.getInstance();

  GetIt.I.registerLazySingleton<LocalInterface>(() => LocalRepository(preferences: prefs),);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});


  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CheckWatchOnboardCubit(localRepositury: GetIt.I<LocalInterface>()),
        ),
        BlocProvider(
          create: (context) => OnboardCubit(localRepositury: GetIt.I<LocalInterface>()),
        ),
      ], 
      child: MaterialApp.router(
        theme: ThemeData(
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          primaryColor: const Color.fromARGB(255, 5, 95, 250),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        routerConfig: appRouter.config(),
      )
    );
  }
}

