import 'package:flutter/material.dart';
import 'package:hagglex/core/constants/app_assets.dart';
import 'package:hagglex/core/share_ui/shared/app_colors.dart';
import 'package:hagglex/core/share_ui/shared/ui_helpers.dart';
import 'package:hagglex/features/user/presentation/widgets/hagglex_app_backgroun_widget.dart';

class SelectCountryPage extends StatefulWidget {
  SelectCountryPage({Key key}) : super(key: key);

  @override
  _SelectCountryPageState createState() => _SelectCountryPageState();
}

class _SelectCountryPageState extends State<SelectCountryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: HaggleXAppBackgroundWidget(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpaceLarge,
                verticalSpaceMedium,
                SearchTextField(),
                verticalSpace(30),
                Divider(
                  color: Color.fromRGBO(255, 255, 255, 0.2),
                ),
                Column(
                  children: List.generate(
                    50,
                    (index) => ListTile(
                      leading: Container(
                        height: 50,
                        width: 40,
                        child: Image.asset(
                          AppAssets.nigeriaFlagImage,
                        ),
                      ),
                      title: Text(
                        '(+234) Nigeria',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                ),
                verticalSpace(50),
                // Expanded(
                //   child: ListView.builder(
                //     itemCount: 90,
                //     itemBuilder: (context, index) {
                //       return ;
                //     },
                //   ),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 43,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 1),
      decoration: BoxDecoration(
        color: Color.fromRGBO(255, 255, 255, 0.2),
        borderRadius: BorderRadius.circular(22),
      ),
      child: TextField(
        cursorColor: Colors.white,
        style: TextStyle(
          color: Colors.white,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: 'Search for country',
          hintStyle: TextStyle(
            color: Colors.white.withOpacity(0.8),
          ),
          suffixIcon: Icon(
            Icons.search,
            color: Colors.white.withOpacity(0.8),
          ),
        ),
      ),
    );
  }
}
