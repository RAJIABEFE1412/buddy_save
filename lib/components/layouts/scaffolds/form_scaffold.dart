import 'package:buddy_save/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:buddy_save/components/fragments/buttons/app_button.dart';
import 'package:buddy_save/components/fragments/spacers/app_sized_box.dart';
import 'package:buddy_save/components/typography/app_text.dart';
import 'package:buddy_save/style/text_styles.dart';
import 'package:buddy_save/utils/extensions.dart';
import 'package:buddy_save/utils/typedefs.dart';

class FormScaffold extends StatefulWidget {
  final List<Widget> fields;
  List<Widget>? action;
  final String title;
  final bool titleCenter;
  final GlobalKey? key;
  final String? subTitle;
  String? secondTitle;
  final String? btnText;
  final TextAlign titleAlignment;
  final OnPressed? onSubmit;
  final OnPressed? onCancel;
  final bool hideBtn;
  Widget? leading;
  bool _appbar;
  final bool _titleInAppBar;
  final GlobalKey<FormState>? form;
  final cancelText;
  FormScaffold({
    required this.fields,
    required this.title,
    this.btnText,
    this.onSubmit,
    this.key,
    this.titleCenter = true,
    this.subTitle,
    this.form,
    this.titleAlignment = TextAlign.center,
    this.hideBtn = false,
  })  : assert(fields != null && fields.isNotEmpty),
        assert(title != null),
        _titleInAppBar = false,
        this._appbar = true,
        this.cancelText = null,
        this.leading = null,
        this.action = null,
        onCancel = null,
        secondTitle = null;

  FormScaffold.withActions({
    required this.fields,
    required this.title,
    this.btnText,
    this.key,
    this.onSubmit,
    this.subTitle,
    this.action,
    this.titleCenter = true,
    this.leading,
    this.form,
    this.titleAlignment = TextAlign.center,
    this.hideBtn = false,
  })  : assert(fields != null && fields.isNotEmpty),
        assert(title != null),
        _titleInAppBar = true,
        _appbar = true,
        this.cancelText = null,
        onCancel = null,
        secondTitle = null;

  FormScaffold.withAppbar({
    required this.fields,
    required this.title,
    this.btnText,
    this.form,
    this.key,
    this.titleCenter = true,
    this.onSubmit,
    this.subTitle,
    this.titleAlignment = TextAlign.center,
    this.hideBtn = false,
  })  : assert(fields.isNotEmpty),
        _titleInAppBar = true,
        onCancel = null,
        this.cancelText = null,
        this.action = null,
        _appbar = true,
        this.leading = null,
        secondTitle = null;

  FormScaffold.withSubtitle({
    required this.fields,
    required this.title,
    required this.secondTitle,
    this.form,
    this.key,
    this.btnText,
    this.titleCenter = true,
    this.onSubmit,
    this.subTitle,
    this.titleAlignment = TextAlign.center,
    this.hideBtn = false,
  })  : assert(fields.isNotEmpty),
        onCancel = null,
        this.leading = null,
        _appbar = true,
        this.cancelText = null,
        this.action = null,
        _titleInAppBar = true;

  FormScaffold.withTwoButtons({
    required this.fields,
    required this.title,
    this.btnText,
    this.cancelText = "cancel",
    this.form,
    this.onSubmit,
    this.onCancel,
    this.key,
    this.titleCenter = true,
    this.subTitle,
    this.titleAlignment = TextAlign.center,
    this.hideBtn = false,
  })  : assert(fields.isNotEmpty),
        _titleInAppBar = true,
        _appbar = true,
        this.leading = null,
        this.action = null,
        secondTitle = null;

  FormScaffold.noAppBar({
    required this.fields,
    required this.title,
    this.btnText,
    this.cancelText = "cancel",
    this.form,
    this.onSubmit,
    this.onCancel,
    this.key,
    this.titleCenter = true,
    this.subTitle,
    this.titleAlignment = TextAlign.center,
    this.hideBtn = false,
  })  : assert(fields.isNotEmpty),
        _titleInAppBar = true,
        _appbar = false,
        this.leading = null,
        this.action = null,
        secondTitle = null;

  @override
  State<StatefulWidget> createState() => _FormScaffoldState();
}

class _FormScaffoldState extends State<FormScaffold> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final scaler = context.scaler;
    return GestureDetector(
      child: Scaffold(
        key: widget.key ?? scaffoldKey,
        backgroundColor: const Color(0xFFe4e5ed),
        body: Form(
          key: widget.form ?? formKey,
          child: CustomScrollView(
            slivers: [
              if (widget._appbar)
                SliverAppBar(
                  pinned: widget._titleInAppBar,
                  floating: true,
                  backgroundColor: const Color(0xFFe4e5ed),
                  centerTitle: widget.titleCenter,
                  elevation: 0,
                  actions: (widget.action != null) ? widget.action : null,
                  leading: (widget.leading != null)
                      ? widget.leading
                      : IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.black,
                          ),
                        ),
                  title: (widget._titleInAppBar)
                      ? BuddyText(
                          widget.title,
                          textAlign: widget.titleAlignment,
                          style: BuddyTextStyle.bold.copyWith(
                            fontSize: 60,
                            color: Colors.black,
                          ),
                        )
                      : null,
                ),
              SliverPadding(
                padding: scaler.insets.symmetric(
                  horizontal: 5,
                ),
                sliver: SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      BuddySizedBox(height: 1),
                      if (!widget._titleInAppBar)
                        BuddyText(
                          widget.title,
                          textAlign: widget.titleAlignment,
                          style: BuddyTextStyle.bold.copyWith(
                            fontSize: 65,
                          ),
                        ),
                      if (widget.secondTitle != null)
                        BuddySizedBox(height: 2.5),
                      if (widget.secondTitle != null)
                        BuddyText(
                          widget.secondTitle ?? '',
                          textAlign: widget.titleAlignment,
                          style: BuddyTextStyle.bold.copyWith(fontSize: 60),
                        ),
                      if (widget.subTitle != null) BuddySizedBox(height: 1),
                      if (widget.subTitle != null)
                        BuddyText(
                          widget.subTitle ?? '',
                          textAlign: widget.titleAlignment,
                          style: BuddyTextStyle.bold,
                        ),
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: scaler.insets.symmetric(
                  horizontal: 5,
                  vertical: 2,
                ),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (_, idx) {
                      return widget.fields[idx];
                    },
                    childCount: widget.fields.length,
                  ),
                ),
              ),
              SliverPadding(
                padding: scaler.insets.symmetric(
                  horizontal: 5,
                ),
                sliver: SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      BuddySizedBox(height: widget.hideBtn ? 0 : 4),
                      if (!widget.hideBtn)
                        Builder(
                          builder: (context) {
                            if (widget.onCancel != null)
                              return Container(
                                width: 400.0,
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: BuddyButton(
                                        text: widget.cancelText,
                                        withBorder: true,
                                        textColor: BuddyColors.wine,
                                        color: BuddyColors.transparent,
                                        onPressed: widget.onCancel ?? () {},
                                      ),
                                    ),
                                    BuddySizedBox(width: 2.5),
                                    Expanded(
                                      child: BuddyButton(
                                        text: widget.btnText ?? "Next",
                                        onPressed: () {
                                          if (formKey.currentState
                                                  ?.validate() ??
                                              false) widget.onSubmit!();
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            return BuddyButton(
                              text: widget.btnText ?? "Continue",
                              onPressed: () {
                                if (formKey.currentState?.validate() ?? false)
                                  widget.onSubmit!();
                              },
                            );
                          },
                        ),
                      if (!widget.hideBtn) BuddySizedBox(height: 4),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
    );
  }
}
