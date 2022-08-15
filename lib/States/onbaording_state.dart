import 'package:buddy_save/models/podos/onboarding_models.dart';
import 'package:buddy_save/values/images.dart';
import 'package:flutter/foundation.dart';

class OnBoardingState with ChangeNotifier {
  // get _instance of OnBoardingState => OnBoardingState();
  static OnBoardingState? _instance;
  static OnBoardingState get instance {
    _instance ??= OnBoardingState();
    return _instance!;
  }

  List<OnboardData> get data {
    return const [
      OnboardData(
          svg: BuddySvgs.buddies,
          title: "Buddies 4life!",
          description: "Always stay in touch with OG's before IG!"),
      OnboardData(
        svg: BuddySvgs.families,
        title: "Families are important!",
        description: "Keep track of your family members and their expenses",
      ),
      OnboardData(
        svg: BuddySvgs.savings,
        title: "Save for the future!",
        description: "Save for the future and get a better future",
      ),
    ];
  }
}
