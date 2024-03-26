import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:session1/cubit/check_watch_onboard_cubit.dart';
import 'package:session1/data/models/onboard/onboard.dart';
import 'package:session1/presentation/onboard_screen/cubit/onboard_cubit.dart';

@RoutePage()
class OnBoardLogic extends StatefulWidget {
  const OnBoardLogic({super.key});

  @override
  State<OnBoardLogic> createState() => _OnBoardLogicState();
}

class _OnBoardLogicState extends State<OnBoardLogic> {

  @override
  void initState() {
    BlocProvider.of<OnboardCubit>(context).getOnboardList(); 
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardCubit, OnboardState>(
      builder: (context, state) {
        if(state is LoadOnboardList){
          int index = state.onboardList.queueNumber;
          Onboard onboard = state.onboardList.onboard[index];
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.fromLTRB(23, 60, 23, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: Image.asset(onboard.imagePath, fit: BoxFit.cover,),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 30),
                              child: Column(
                                children: [
                                  Text(
                                    onboard.largeText,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.w700,
                                      fontSize: 24,
                                      color: Color.fromARGB(255, 5, 95, 250)
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: Text(
                                      onboard.smallText,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16,
                                        color: Color.fromARGB(255, 58, 58, 58)
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: 
                    index < 2
                    ? Padding(
                      padding: const EdgeInsets.only(bottom: 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 100,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: (){
                                BlocProvider.of<OnboardCubit>(context).tapOnSkip();
                                BlocProvider.of<CheckWatchOnboardCubit>(context).checkWatchState();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4.86), 
                                  side: const BorderSide(
                                    color: Color.fromARGB(255, 5, 95, 250),
                                    width: 1
                                  )
                                ),
                                shadowColor: Colors.transparent
                              ),
                              child: const Text(
                                'Skip',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 5, 95, 250)
                                ),
                              ),
                            ),
                            
                          ),
                          SizedBox(
                            width: 100,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: (){
                                BlocProvider.of<OnboardCubit>(context).tapOnNext(state.onboardList);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(255, 5, 95, 250),
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.86))
                              ),
                              child: const Text(
                                'Next',
                                style: TextStyle(
                                  color: Colors.white
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                    : Padding(
                      padding: const EdgeInsets.only(bottom: 40),
                      child: Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            height: 46,
                            child: 
                            ElevatedButton(
                              onPressed: (){
                                BlocProvider.of<OnboardCubit>(context).tapOnSkip();
                                BlocProvider.of<CheckWatchOnboardCubit>(context).checkWatchState();
                              },
                              style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color.fromARGB(255, 5, 95, 250),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))
                                  ),
                              child: const Text(
                                'Sign Up',
                                style: TextStyle(
                                  color: Colors.white
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Already have an account?',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 167, 167, 167),
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Roboto',
                                    fontSize: 14
                                  ),
                                ),
                                InkWell(
                                  onTap: (){
                                    BlocProvider.of<OnboardCubit>(context).tapOnSkip();
                                    BlocProvider.of<CheckWatchOnboardCubit>(context).checkWatchState();
                                  },
                                  child: const Text(
                                    'Sign in',
                                    style:  TextStyle(
                                      color: Color.fromARGB(255, 5, 95, 250),
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Roboto',
                                      fontSize: 14
                                    ),
                                  )
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ) ,
          );
        }
        return const Scaffold();
      },
    );
  }
}