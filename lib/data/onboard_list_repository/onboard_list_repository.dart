import 'package:session1/data/models/onboard/onboard.dart';
import 'package:session1/data/models/onboard/onboard_list.dart';

class OnboardListRepository {


  OnboardList createOnboardList () {
    return OnboardList(
      queueNumber: 0, 
      onboard: [
        Onboard(
          imagePath: 'assets/onboarding/onboard-one.png', 
          largeText: 'Quick Delivery At Your Doorstep', 
          smallText: 'Enjoy quick pick-up and delivery to your destination',
        ),
        Onboard(
          imagePath: 'assets/onboarding/onboard-two.png', 
          largeText: 'Flexible Payment', 
          smallText: 'Different modes of payment either before and after delivery without stress',
        ),
        Onboard(
          imagePath: 'assets/onboarding/onboard-three.png', 
          largeText: 'Real-time Tracking', 
          smallText: 'Track your packages/items from the comfort of your home till final destination',
        ),
      ]
    );
  }
}