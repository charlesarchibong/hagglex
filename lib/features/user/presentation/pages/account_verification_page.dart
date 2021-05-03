import 'package:flutter/material.dart';
import 'package:hagglex/core/constants/app_assets.dart';
import 'package:hagglex/core/navigations/route_paths.dart';
import 'package:hagglex/core/share_ui/shared/app_colors.dart';
import 'package:hagglex/core/share_ui/shared/custom_back_button.dart';
import 'package:hagglex/core/share_ui/shared/input_field.dart';
import 'package:hagglex/core/share_ui/shared/touachable_opacity.dart';
import 'package:hagglex/core/share_ui/shared/ui_helpers.dart';
import 'package:hagglex/features/user/presentation/widgets/hagglex_app_backgroun_widget.dart';

class AccountVerificationPage extends StatefulWidget {
  AccountVerificationPage({Key key}) : super(key: key);

  @override
  _AccountVerificationPageState createState() =>
      _AccountVerificationPageState();
}

class _AccountVerificationPageState extends State<AccountVerificationPage> {
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomBackButton(),
                    verticalSpace(30),
                    Text(
                      'Verify your account',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
              verticalSpaceSmall,
              verticalSpaceSmall,
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        verticalSpace(35),
                        Image.asset(
                          AppAssets.checkIcon,
                          width: 64,
                          height: 64,
                        ),
                        verticalSpace(35),
                        Text(
                          'We just sent a verification code to your email. Please enter the code',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        verticalSpace(5.5),
                        InputField(
                          controller: null,
                          label: 'Verification code',
                          color: Colors.black,
                          labelTextColor: Colors.black,
                          password: true,
                        ),
                        verticalSpace(35.5),
                        TouchableOpacity(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              Routes.setupSuccessPage,
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
                                'VERIFY ME',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        verticalSpace(28),
                        Text(
                          'This code will expire in 10 minutes',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        verticalSpace(49),
                        Text(
                          'Resend Code',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            decoration: TextDecoration.underline,
                          ),
                          textAlign: TextAlign.center,
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
