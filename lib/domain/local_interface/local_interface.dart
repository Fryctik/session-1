import 'package:session1/data/models/onboard/onboard_list.dart';

abstract interface class LocalInterface {
  bool isWatchOnboard ();
  Future<void> setWatch ();

  OnboardList getQueueListOnboard ();
  Future<void> setNumberQueueOnboard (int number);


}