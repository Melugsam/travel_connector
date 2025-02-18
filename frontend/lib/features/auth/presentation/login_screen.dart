// ignore_for_file: body_might_complete_normally_nullable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_connector/core/injector/di.dart';
import 'package:travel_connector/core/color/app_colors.dart';
import 'package:travel_connector/core/manager/notification_manager.dart';
import 'package:travel_connector/core/widget/custom_button_widget.dart';
import 'package:travel_connector/core/widget/custom_circular_indicator_widget.dart';
import 'package:travel_connector/core/widget/custom_text_labeled_form_widget.dart';
import 'package:travel_connector/features/app/presentation/bloc/session/session_bloc.dart';
import 'package:travel_connector/features/auth/presentation/bloc/login/login_bloc.dart';

class LoginScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocProvider(
      create: (context) => LoginBloc(getIt()),
      child: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            context.read<SessionBloc>().add(
                  LoginSessionEvent(
                    accessToken: state.accessEntity.accessToken,
                  ),
                );
          }
          if (state is LoginError) {
            getIt<NotificationManager>().showError(message: state.message);
          }
        },
        child: Scaffold(
          backgroundColor: theme.scaffoldBackgroundColor,
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                Spacer(),
                Expanded(
                  flex: 1,
                  child: Center(
                    child: Text(
                      'Travel Connector\nРады видеть снова!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        color: AppColors.primary,
                        height: 1.5,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomTextLabeledForm(
                        controller: emailController,
                        isPassword: false,
                        title: "Почта",
                        hint: "Введите почту",
                        validator: (p0) {},
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      CustomTextLabeledForm(
                        controller: passwordController,
                        isPassword: true,
                        title: "Пароль",
                        hint: "Введите пароль",
                        validator: (p0) {},
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'Забыли пароль?',
                              style: theme.textTheme.bodyMedium,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    if (state is LoginLoading) {
                      return CustomCircularIndicatorWidget();
                    }
                    return CustomButtonWidget(
                      text: "Войти",
                      outline: false,
                      onPressed: () {
                        context.read<LoginBloc>().add(
                              ExecuteLoginEvent(
                                email: emailController.text,
                                password: passwordController.text,
                              ),
                            );
                      },
                    );
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Нет аккаунта?",
                      style: theme.textTheme.bodyMedium!.copyWith(
                        color: AppColors.black,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        context.pushNamed('register');
                      },
                      child: Text(
                        "Регистрация",
                        style: theme.textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w700,
                          color: AppColors.secondary,
                        ),
                      ),
                    ),
                  ],
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
