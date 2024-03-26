
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:session1/cubit/check_watch_onboard_cubit.dart';
import 'package:session1/presentation/onboard_screen/cubit/onboard_cubit.dart';
import 'package:session1/presentation/routes/routes.dart';

@RoutePage()
class CommonLogic extends StatefulWidget {
  const CommonLogic({super.key});

  @override
  State<CommonLogic> createState() => _CommonLogicState();
}

class _CommonLogicState extends State<CommonLogic> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckWatchOnboardCubit, CheckWatchOnboardState>(
      builder: (context, state) {
        if(state is NotWatchOnboard || state is LoadOnboardList){
          context.pushRoute(OnBoardLogicRoute());
        }
        if(state is WatchOnboard){
          context.pushRoute(LogInRoute());
        }
        return const Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: CircularProgressIndicator(
              color: Color.fromARGB(255, 5, 95, 250),
            ),
          ),
        );
      }
    );   
  }
}