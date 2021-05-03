import 'package:flutter/material.dart';
import 'package:hagglex/core/errors/failure.dart';
import 'package:hagglex/core/navigations/navigation_service.dart';
import 'package:hagglex/core/navigations/route_paths.dart';
import 'package:hagglex/core/share_ui/shared/flushbar_notification.dart';
import 'package:hagglex/features/user/domain/entities/user_entity.dart';
import 'package:hagglex/features/user/domain/usecases/login_usecase.dart';
import 'package:hagglex/features/user/domain/usecases/register_usecase.dart';
import 'package:hagglex/features/user/domain/usecases/resend_otp_usecase.dart';
import 'package:hagglex/features/user/domain/usecases/verify_otp_usecase.dart';
import 'package:hagglex/injection_container.dart';

class AuthProvider extends ChangeNotifier {
  final RegisterUsecase registerUsecase;
  final LoginUsecase loginUsecase;
  final ResendOtpUsecase resendOtpUsecase;
  final VerifyOtpUsecase verifyOtpUsecase;

  AuthProvider({
    @required this.registerUsecase,
    @required this.loginUsecase,
    @required this.resendOtpUsecase,
    @required this.verifyOtpUsecase,
  });

  UserEntity _userEntity;

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
          title: 'Error',
        );
      },
      (r) {
        _userEntity = r;
        sl<NavigationService>().navigateTo(
          Routes.accountVerificationPage,
        );
      },
    );
  }

  Future<void> login({
    @required String email,
    @required String password,
    @required BuildContext context,
  }) async {
    final response = await loginUsecase(
      email,
      password,
    );
    response.fold(
      (l) {
        FlushBarNotification.showErrorMessage(
          context: context,
          message: FailureToMessage.mapFailureToMessage(l),
          title: 'Error',
        );
      },
      (r) {
        sl<NavigationService>().navigateTo(
          Routes.dashboardPage,
        );
      },
    );
  }

  Future<void> resendOtp({
    @required BuildContext context,
  }) async {
    final response = await resendOtpUsecase(
      _userEntity.email,
    );
    response.fold(
      (l) {
        FlushBarNotification.showErrorMessage(
          context: context,
          message: FailureToMessage.mapFailureToMessage(l),
          title: 'Error',
        );
      },
      (r) {
        FlushBarNotification.showInfoMessage(
          context: context,
          message: 'OTP resent successfully, please check you mail.',
        );
      },
    );
  }

  Future<void> verifyOtp({
    @required BuildContext context,
    @required String otp,
  }) async {
    final response = await verifyOtpUsecase(
      otp,
    );
    response.fold(
      (l) {
        FlushBarNotification.showErrorMessage(
          context: context,
          message: FailureToMessage.mapFailureToMessage(l),
          title: 'Error',
        );
      },
      (r) {
        Navigator.pushNamed(
          context,
          Routes.dashboardPage,
        );
      },
    );
  }
}
