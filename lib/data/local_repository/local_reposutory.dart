import 'package:session1/data/models/onboard/onboard_list.dart';
import 'package:session1/data/onboard_list_repository/onboard_list_repository.dart';
import 'package:session1/domain/local_interface/local_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalRepository implements LocalInterface {

  
  LocalRepository({required this.preferences});

  final SharedPreferences preferences;
  static const _keyStateWatch = 'state_watch';
  static const _keyQueueNumber = 'queue_number';

  @override
  bool isWatchOnboard() {
    final stateWatch = preferences.getBool(_keyStateWatch);
    return stateWatch ?? false;
  }

  @override
  Future<void> setWatch() async {
    await preferences.setBool(_keyStateWatch, true);
  }
  
  @override
  OnboardList getQueueListOnboard() {
    var onboardList = OnboardListRepository().createOnboardList();
    onboardList.queueNumber = preferences.getInt(_keyQueueNumber) ?? 0;
    return onboardList;
  }
  
  @override
  Future<void> setNumberQueueOnboard(int queueNumber) async {
    await preferences.setInt(_keyQueueNumber, queueNumber);
  }

  

}