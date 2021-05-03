import 'package:flutter/material.dart';
import 'package:hagglex/core/errors/failure.dart';
import 'package:hagglex/core/navigations/navigation_service.dart';
import 'package:hagglex/core/navigations/route_paths.dart';
import 'package:hagglex/core/share_ui/shared/flushbar_notification.dart';
import 'package:hagglex/features/user/domain/usecases/register_usecase.dart';
import 'package:hagglex/injection_container.dart';

class AuthProvider extends ChangeNotifier {
  final RegisterUsecase registerUsecase;

  AuthProvider({
    @required this.registerUsecase,
  });

  Future<void> register({
    @required String email,
    @required String password,
    @required String username,
    @required String phone,
    String referralCode,
    @required BuildContext context,
  }) async {
    final registered = await registerUsecase(
      email: email,
      password: password,
      username: username,
      phone: phone,
      referralCode: referralCode,
    );
    registered.fold(
      (l) {
        FlushBarNotification.showErrorMessage(
          context: context,
          message: FailureToMessage.mapFailureToMessage(l),
        );
      },
      (r) {
        sl<NavigationService>().navigateTo(
          Routes.accountVerificationPage,
        );
      },
    );
  }
}
