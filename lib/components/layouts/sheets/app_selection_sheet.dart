import 'package:flutter/material.dart';
import 'package:buddy_save/components/fragments/spacers/app_sized_box.dart';
import 'package:buddy_save/components/typography/app_text.dart';
import 'package:buddy_save/models/podos/selection.dart';
import 'package:buddy_save/style/colors.dart';
import 'package:buddy_save/style/text_styles.dart';
import 'package:buddy_save/utils/extensions.dart';
import 'package:buddy_save/utils/typedefs.dart';

class SelectionBottomSheet<T> extends StatelessWidget {
  final OnChanged<T> onSelect;
  final String? title;

  final List<SelectionData> items;

  SelectionBottomSheet({
    this.title,
    required this.onSelect,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    final scaler = context.scaler;

    return DraggableScrollableSheet(
      initialChildSize: .53,
      maxChildSize: .9,
      minChildSize: .45,
      builder: (context, _) {
        return Builder(
          builder: (context) {
            return Container(
              padding: scaler.insets.symmetric(horizontal: 5),
              decoration: BoxDecoration(
                color: BuddyColors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(
                    scaler.fontSizer.sp(30),
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const BuddySizedBox(height: 3),
                  BuddyText(
                    title ?? "",
                    style: BuddyTextStyle.bold.copyWith(
                      fontSize: 55,
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                      controller: _,
                      itemBuilder: (_, idx) {
                        final item = items[idx];
                        return ListTile(
                          onTap: () {
                            onSelect(item as T);
                            Navigator.of(context).pop();
                          },
                          leading: item.data != null ? Icon(item.data) : null,
                          dense: true,
                          contentPadding: scaler.insets.zero,
                          title: BuddyText(
                            item.title,
                            style: BuddyTextStyle.light,
                          ),
                        );
                      },
                      separatorBuilder: (_, __) {
                        return Divider(
                          color: BuddyColors.divider,
                          height: scaler.sizer.setHeight(.5),
                        );
                      },
                      itemCount: items.length,
                      padding: scaler.insets.symmetric(vertical: 1),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
