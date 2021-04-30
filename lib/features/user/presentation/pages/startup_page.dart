import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hagglex/core/constants/app_assets.dart';
import 'package:hagglex/core/navigations/route_paths.dart';
import 'package:hagglex/core/share_ui/shared/app_colors.dart';
import 'package:hagglex/core/share_ui/shared/ui_helpers.dart';
import 'package:hagglex/features/user/presentation/widgets/hagglex_app_backgroun_widget.dart';

class StartupPage extends StatefulWidget {
  const StartupPage({Key key}) : super(key: key);

  @override
  _StartupPageState createState() => _StartupPageState();
}

class _StartupPageState extends State<StartupPage> {
  void _navigateToAnotherPage() {
    Timer(
      Duration(seconds: 3),
      () {
        Navigator.pushNamed(context, Routes.loginPage);
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _navigateToAnotherPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: HaggleXAppBackgroundWidget(
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
    );
  }
}
