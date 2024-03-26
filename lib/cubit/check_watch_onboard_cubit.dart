

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:session1/domain/local_interface/local_interface.dart';

part 'check_watch_onboard_state.dart';

class CheckWatchOnboardCubit extends Cubit<CheckWatchOnboardState> {
  CheckWatchOnboardCubit({required this.localRepositury}) : super(CheckWatchOnboardInitial()){
    checkWatchState();
  }

  final LocalInterface localRepositury;

  void checkWatchState () {
    if(localRepositury.isWatchOnboard() == false){
      emit(NotWatchOnboard());
    }else{
      emit(WatchOnboard());
    }
  }
}
