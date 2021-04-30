import 'package:flutter/material.dart';
import 'package:hagglex/core/constants/app_assets.dart';
import 'package:hagglex/core/share_ui/shared/app_colors.dart';

class StartupPage extends StatelessWidget {
  const StartupPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Stack(
        children: [
          Image.asset(
            AppAssets.backgroundImage,
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
            alignment: Alignment.center,
          ),
          Center(
            child: Image.asset(
              AppAssets.appLogoImage,
              width: 50,
              height: 50,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 110.0),
            child: Center(
              child: Text(
                'HaggleX',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 27,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
