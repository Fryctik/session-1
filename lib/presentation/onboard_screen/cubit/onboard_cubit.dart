import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:session1/data/models/onboard/onboard_list.dart';
import 'package:session1/domain/local_interface/local_interface.dart';

part 'onboard_state.dart';

class OnboardCubit extends Cubit<OnboardState> {
  OnboardCubit({required this.localRepositury}) : super(OnboardInitial());
  
  final LocalInterface localRepositury;

  void getOnboardList () {
    OnboardList onboardList = localRepositury.getQueueListOnboard();
    emit(LoadOnboardList(onboardList: onboardList));
  }

  void tapOnSkip () {
    localRepositury.setWatch();
  }
  
  Future<void> tapOnNext (OnboardList onboardList) async {
    onboardList.queueNumber += 1;
    await localRepositury.setNumberQueueOnboard(onboardList.queueNumber);
    emit(LoadOnboardList(onboardList: onboardList));
  }
}
