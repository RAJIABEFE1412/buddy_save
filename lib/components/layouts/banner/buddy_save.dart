import 'package:buddy_save/components/fragments/spacers/app_sized_box.dart';
import 'package:buddy_save/components/typography/app_text.dart';
import 'package:buddy_save/style/colors.dart';
import 'package:buddy_save/style/text_styles.dart';
import 'package:buddy_save/utils/extensions.dart';
import 'package:buddy_save/values/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BuddySaveBanner extends StatelessWidget {
  const BuddySaveBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final scaler = context.scaler;
    return Container(
      // height: scaler.sizer.setHeight(percentage),
      width: scaler.sizer.width,
      decoration: BoxDecoration(
        gradient: BuddyColors.primaryGradient,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(scaler.sizer.setWidth(8)),
          topRight: Radius.circular(scaler.sizer.setWidth(8)),
          topLeft: Radius.circular(scaler.sizer.setWidth(8)),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: scaler.sizer.setWidth(10),
            spreadRadius: scaler.sizer.setWidth(5),
            offset: Offset(0, scaler.sizer.setWidth(5)),
          ),
        ],
      ),
      padding: scaler.insets.symmetric(
        vertical: 1.5,
        horizontal: 3,
      ),
      child: Table(
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        columnWidths: const {
          0: FlexColumnWidth(1.4),
          1: FlexColumnWidth(.4),
          2: FlexColumnWidth(8),
          3: FlexColumnWidth(0.01),
        },
        children: [
          TableRow(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: scaler.sizer.setWidth(20),
                  height: scaler.sizer.setWidth(20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    image: DecorationImage(image: AssetImage(
                      BuddyImages.piggy,
                    ),
                    ),
                  ),
                ),
              ),
              const BuddySizedBox(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BuddySizedBox(
                    height: 1.25,
                  ),
                  BuddyText(
                    "Buddy Savings",
                    style: BuddyTextStyle.light.copyWith(
                      fontSize: 60,
                      color: Colors.white60,
                    ),
                  ),
                  const BuddySizedBox(
                    height: 0.825,
                  ),
                  BuddyText(
                    "Save with your family and friendsfor your next rent",
                    style: BuddyTextStyle.light.copyWith(
                      fontSize: 32,
                      color: Colors.white60,
                    ),
                  ),
                  const BuddySizedBox(
                    height: 1.25,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
