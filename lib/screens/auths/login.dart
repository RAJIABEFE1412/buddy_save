import 'package:buddy_save/screens/home/home.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:buddy_save/components/typography/app_text_span.dart';
// import 'package:buddy_save/models/http/requests/login.dart';
// import 'package:buddy_save/states/auth/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:package_info/package_info.dart';
import 'package:provider/provider.dart';
import 'package:buddy_save/components/fragments/buttons/app_button.dart';
import 'package:buddy_save/components/fragments/inputs/app_password_input.dart';
import 'package:buddy_save/components/fragments/inputs/app_text_field.dart';
import 'package:buddy_save/components/fragments/spacers/app_sized_box.dart';
import 'package:buddy_save/components/typography/app_text.dart';

import 'package:buddy_save/style/colors.dart';
import 'package:buddy_save/style/text_styles.dart';
import 'package:buddy_save/utils/extensions.dart';
import 'package:buddy_save/utils/modals.dart';
import 'package:buddy_save/utils/validators.dart';
import 'package:buddy_save/values/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage();

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _form = GlobalKey();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  late TextEditingController _phoneCtrl;
  late TextEditingController _passwordCtrl;
  // PackageInfo packageInfo;

  @override
  void initState() {
    super.initState();
    getPackageDetails();
    _phoneCtrl = TextEditingController();
    _passwordCtrl = TextEditingController();
  }

  getPackageDetails() async {
    // packageInfo = await PackageInfo.fromPlatform();
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final scaler = context.scaler;
    // final model = context.watch<AuthState>();

    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: Container(
          padding: scaler.insets.symmetric(horizontal: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: scaler.insets.only(top: 3),
                  child: Form(
                    key: _form,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        BuddyText(
                          "Login",
                          style: BuddyTextStyle.bold.copyWith(
                              color: BuddyColors.primary, fontSize: 120),
                        ),
                        const BuddySizedBox(height: 4.5),
                        const BuddyTextSpan(messages: [
                          "Please enter phone number and password to continue."
                        ]
                            // style: BuddyTextStyle.light.copyWith(fontSize: 50),
                            ),
                        const BuddySizedBox(height: 3),
                        Row(
                          children: [
                            Expanded(
                              child: BuddyTextField(
                                hintText: "90 668 47024",
                                prefixIconConstraints:
                                    BoxConstraints(minWidth: 0, minHeight: 0),
                                prefixIcon: Padding(
                                  padding: scaler.insets.symmetric(
                                    horizontal: 2.0,
                                  ),
                                  child: CountryCodePicker(
                                    onChanged: print,
                                    // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                                    initialSelection: 'NG',
                                    favorite: ['+39', 'NG'],

                                    // optional. Shows only country name and flag
                                    showCountryOnly: false,
                                    // optional. Shows only country name and flag when popup is closed.
                                    showOnlyCountryWhenClosed: false,
                                    // optional. aligns the flag and the Text left
                                    alignLeft: false,
                                  ),
                                ),
                                controller: _phoneCtrl,
                                // controller: auth.phoneNumberController,
                                validator: BuddyValidators.phoneValidator,
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(10),
                                  // PhoneNumberInputFormatter()
                                ],
                              ),
                            ),
                          ],
                        ),
                        const BuddySizedBox(height: 1.5),
                        PasswordTextField(
                          controller: _passwordCtrl,
                          validator: BuddyValidators.required,
                        ),
                        const BuddySizedBox(height: 2),
                      ],
                    ),
                  ),
                ),
              ),
              BuddyButton.rich(
                text: "No account yet?",
                secondText: "Create one",
                onPressed: () {
                  // Navigator.of(context).pushNamed(BuddyRoutes.signUp);
                },
                color: BuddyColors.transparent,
                isBold: true,
                textColor: BuddyColors.black,
                fontSize: 50,
              ),
              const BuddySizedBox(height: 1),
              BuddyButton(
                text: "Sign In",
                onPressed: () async {
                  if (_form.currentState?.validate() ?? false) {
                    final doRoute = await formSubmitDialog(
                      context: context,
                      future: Future.delayed(const Duration(seconds: 2), () {
                        return true;
                      }),
                    );
                    if (doRoute != null) {
                      // model.login(context, LoginRequest(password:_passwordCtrl.text ,phoneNumber: "+234"+ _phoneCtrl.text));
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        BuddyRoutes.homeScreen,
                        (route) => false,
                      );
                    }
                  }
                },
              ),
              const BuddySizedBox(height: 5.5),
            ],
          ),
        ),
        bottom: false,
      ),
    );
  }
}
