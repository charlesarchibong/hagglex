import 'package:flutter/material.dart';
import 'package:hagglex/core/constants/app_assets.dart';
import 'package:hagglex/core/navigations/route_paths.dart';
import 'package:hagglex/core/share_ui/shared/app_colors.dart';
import 'package:hagglex/core/share_ui/shared/custom_back_button.dart';
import 'package:hagglex/core/share_ui/shared/input_field.dart';
import 'package:hagglex/core/share_ui/shared/touachable_opacity.dart';
import 'package:hagglex/core/share_ui/shared/ui_helpers.dart';
import 'package:hagglex/features/user/presentation/widgets/hagglex_app_backgroun_widget.dart';

class SignupPage extends StatefulWidget {
  SignupPage({Key key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: HaggleXAppBackgroundWidget(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              verticalSpaceLarge,
              verticalSpaceMedium,
              Padding(
                padding: const EdgeInsets.only(
                  left: 36,
                ),
                child: CustomBackButton(),
              ),
              verticalSpace(24),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(9),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xff00001A),
                        offset: Offset(0, 3),
                        blurRadius: 15,
                      )
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 27,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        verticalSpace(40),
                        Text(
                          'Create a new account',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                        verticalSpace(44),
                        InputField(
                          controller: null,
                          label: 'Email Address',
                          color: Colors.black,
                          labelTextColor: Colors.black,
                        ),
                        verticalSpace(5.5),
                        InputField(
                          controller: null,
                          label: 'Password (Min 8 characters)',
                          color: Colors.black,
                          labelTextColor: Colors.black,
                          password: true,
                        ),
                        verticalSpace(5.5),
                        InputField(
                          controller: null,
                          label: 'Create a username',
                          color: Colors.black,
                          labelTextColor: Colors.black,
                          password: true,
                        ),
                        verticalSpace(5.5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TouchableOpacity(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  Routes.selectCountryPage,
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                  right: 6.0,
                                ),
                                width: 75,
                                height: 36,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(2),
                                  color: Color(0xffE8E8E8),
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 0.5,
                                  ),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 20,
                                      child: Image.asset(
                                        AppAssets.nigeriaFlagImage,
                                      ),
                                    ),
                                    horizontalSpaceTiny,
                                    Text(
                                      '(+234)',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: InputField(
                                controller: null,
                                label: 'Enter your phone number',
                                color: Colors.black,
                                labelTextColor: Colors.black,
                                password: true,
                              ),
                            ),
                          ],
                        ),
                        verticalSpace(5.5),
                        InputField(
                          controller: null,
                          label: 'Referral code (optional)',
                          color: Colors.black,
                          labelTextColor: Color(0xff000000).withOpacity(0.4),
                          password: true,
                        ),
                        verticalSpace(16),
                        Center(
                          child: Text(
                            'By signing, you agree to HaggleX terms and privacy policy.',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        verticalSpace(44),
                        TouchableOpacity(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              Routes.accountVerificationPage,
                            );
                          },
                          child: Container(
                            width: double.infinity,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xff432B7B),
                                  Color(0xff6A4BBC),
                                ],
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'SIGN UP',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        verticalSpace(65),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
