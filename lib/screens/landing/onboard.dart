import 'package:buddy_save/States/onbaording_state.dart';
import 'package:buddy_save/components/fragments/spacers/app_sized_box.dart';
import 'package:buddy_save/components/typography/app_text.dart';
import 'package:buddy_save/style/text_styles.dart';
import 'package:buddy_save/utils/extensions.dart';
import 'package:concentric_transition/concentric_transition.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../States/onbaording_state.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BuddyBoarding extends StatelessWidget {
  const BuddyBoarding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = context.watch<OnBoardingState>();
    final scaler = context.scaler;
    return Scaffold(
      body: ConcentricPageView(
        colors: const <Color>[Colors.purple, Colors.blue, Colors.red],
        itemCount: 3, // null = infinity
        physics: const NeverScrollableScrollPhysics(),
        onFinish: () {
          Navigator.pushReplacementNamed(context, '/login');
        },
        itemBuilder: (
          int index,
        ) {
          return Padding(
            padding: scaler.insets.all(14.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    model.data[index].svg,
                    height: scaler.sizer.setHeight(30),
                    width: scaler.sizer.setHeight(30),
                    fit: BoxFit.fill,
                  ),
                  const BuddySizedBox(height: 5),
                  Container(
                    child: BuddyText(
                      model.data[index].title,
                      textAlign: TextAlign.left,
                      style: BuddyTextStyle.bold.copyWith(
                        color: Colors.white,
                        fontSize: 60,
                      ),
                    ),
                  ),
                  const BuddySizedBox(height: 5),
                  Container(
                    child: BuddyText(
                      model.data[index].description,
                      textAlign: TextAlign.left,
                      style: BuddyTextStyle.medium.copyWith(
                        color: Colors.white,
                        fontSize: 45,
                      ),
                    ),
                  ),

                  const BuddySizedBox(height: 10),
                ]),
          );
        },
      ),
    );
  }
}
