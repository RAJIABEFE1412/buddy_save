import 'package:flutter/material.dart';
import 'package:buddy_save/components/fragments/inputs/app_text_field.dart';

import 'package:buddy_save/models/podos/selection.dart';
import 'package:buddy_save/utils/modals.dart';
import 'package:buddy_save/utils/typedefs.dart';

class BuddyDropdownInput<T> extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final OnValidate<String?>? validator;
  final List<SelectionData<T>>? items;
  final OnChanged<int>? onChanged;
  final bool pop;
  final bool isEnabled;

  BuddyDropdownInput(
    this.controller, {
    this.hintText = "Dropdown",
    this.validator,
    this.items,
    this.isEnabled = true,
    this.onChanged,
    this.pop = false,
  }) : assert(controller != null);

  @override
  State<StatefulWidget> createState() => _BuddyDropdownInputState<T>();
}

class _BuddyDropdownInputState<T> extends State<BuddyDropdownInput> {
  late TextEditingController _localCtrl;

  @override
  void initState() {
    super.initState();

    _populateCtrl();
  }

  void _populateCtrl() {
    if (widget.controller != null &&
        widget.controller.text != null &&
        widget.controller.text.isNotEmpty) {
      final selection = widget.items!.firstWhere(
        (it) => (it.title == widget.controller.text),
      );

      _localCtrl = TextEditingController(text: selection.title);
    } else {
      _localCtrl = TextEditingController();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return InkWell(
          onTap: widget.isEnabled
              ? () async {
                  FocusScope.of(context).requestFocus(FocusNode());
                  showSelectionSheet(
                    context,
                    title: widget.hintText,
                    data: widget.items,
                    onSelect: (data) {
                      widget.controller.text = data.title;
                      _localCtrl.text = data.title;
                      if (widget.onChanged != null) {
                        if (widget.pop) Navigator.pop(context);
                        widget.onChanged!(widget.items!.indexOf(data));
                      }
                    },
                  );
                }
              : null,
          child: BuddyTextField(
            isEnabled: false,
            controller: _localCtrl,
            hintText: widget.hintText,
            validator: widget.validator,
            suffixIcon: Icon(Icons.keyboard_arrow_down),
          ),
        );
      },
    );
  }

  @override
  void didUpdateWidget(BuddyDropdownInput oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (this.widget.controller.text.trim().isEmpty) {
      _localCtrl.clear();
    }
  }
}

// class LgaDropDownInput extends StatefulWidget {
//   final String? state;
//   final OnValidate<String?>? validator;
//   final TextEditingController? controller;

//   LgaDropDownInput({
//     this.state,
//     this.validator,
//     this.controller,
//   });

//   @override
//   State<StatefulWidget> createState() => _LgaDropDownInputState();
// }

// class _LgaDropDownInputState extends State<LgaDropDownInput> {
//   List<SelectionData<String>> get lgas {
//     if (widget.state == null || widget.state!.isEmpty) return [];

//     return StateLgaMapping.fromJson(widget.state!)
//         .lgas
//         .map((it) => SelectionData(selection: it.toLowerCase(), title: it))
//         .toList();
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (lgas.isEmpty) return Offstage();

//     return BuddyDropdownInput(
//       widget.controller!,
//       validator: widget.validator,
//       hintText: "LGA",
//       items: lgas,
//     );
//   }
// }
