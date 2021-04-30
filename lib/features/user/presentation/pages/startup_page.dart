import 'package:flutter/material.dart';
import 'package:hagglex/core/constants/app_assets.dart';
import 'package:hagglex/core/share_ui/shared/app_colors.dart';
import 'package:hagglex/core/share_ui/shared/ui_helpers.dart';

class StartupPage extends StatelessWidget {
  const StartupPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SizedBox.expand(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color(0xFF2E1963),
                const Color(0xFF402B75),
                const Color(0xFF271160),
              ],
              begin: const FractionalOffset(0.0, 0.4),
              end: const FractionalOffset(1.0, 0.0),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppAssets.appLogoImage,
                width: 50,
                height: 50,
              ),
              verticalSpaceSmall,
              Text(
                'HaggleX',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 27,
                  fontWeight: FontWeight.w900,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
