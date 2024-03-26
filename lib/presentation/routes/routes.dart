
import 'package:auto_route/auto_route.dart';
import 'package:session1/presentation/common_logic/common_logic.dart';
import 'package:session1/presentation/log_in_screens/forgot_pass_screens/forgot_screen/forgot_password_screen.dart';
import 'package:session1/presentation/log_in_screens/forgot_pass_screens/new_password_screen/new_password_screen.dart';
import 'package:session1/presentation/log_in_screens/forgot_pass_screens/verefication_screen/otp_verefication_screen.dart';
import 'package:session1/presentation/log_in_screens/log_in_screen/log_in_screen.dart';
import 'package:session1/presentation/log_in_screens/sign_up_screen/sign_up_screen.dart';
import 'package:session1/presentation/onboard_screen/onboard_screen.dart';

part 'routes.gr.dart';  
  
@AutoRouterConfig()  
class AppRouter extends _$AppRouter {  
  
  @override List<AutoRoute> get routes => [
    AutoRoute(
      page: CommonLogicRoute.page,
      path: '/'
    ),
    AutoRoute(
      page: OnBoardLogicRoute.page,
      path: '/Onboard'
    ),
    AutoRoute(
      page: LogInRoute.page,
      path: '/LogIn',
      children: [
        AutoRoute(
          page: SignUpRoute.page,
          path: 'SignUp',
        ),
        AutoRoute(
          page: ForgotPasswordRoute.page,
          path: 'ForgotPassword',
        ),
        AutoRoute(
          page: OtpVereficationRoute.page,
          path: 'OtpVerefication',
        ),
        AutoRoute(
          page: NewPasswordRoute.page,
          path: 'NewPassword',
        ),
      ]
    )
  ];
}