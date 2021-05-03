import 'package:flutter/material.dart';
import 'package:hagglex/core/local_data/user_data/delete_user_session.dart';
import 'package:hagglex/core/navigations/route_paths.dart';
import 'package:hagglex/core/share_ui/shared/touachable_opacity.dart';
import 'package:hagglex/core/share_ui/shared/ui_helpers.dart';
import 'package:hagglex/injection_container.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Dashboard'),
          verticalSpaceMedium,
          TouchableOpacity(
            onTap: () {
              sl<DeleteUserSession>()();
              Navigator.pushNamed(
                context,
                Routes.loginPage,
              );
            },
            child: Text(
              'Logout',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
