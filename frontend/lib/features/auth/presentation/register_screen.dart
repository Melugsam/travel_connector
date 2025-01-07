import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:travel_connector/app/di.dart';
import 'package:travel_connector/core/color/app_colors.dart';
import 'package:travel_connector/core/manager/notification_manager.dart';
import 'package:travel_connector/core/widget/custom_button_widget.dart';
import 'package:travel_connector/core/widget/custom_circular_indicator_widget.dart';
import 'package:travel_connector/features/auth/domain/usecase/register_usecase.dart';
import 'package:travel_connector/features/auth/presentation/bloc/register/register_bloc.dart';

import 'widget/auth_text_field_widget.dart';

class RegisterScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocProvider(
      create: (context) => RegisterBloc(getIt<RegisterUseCase>()),
      child: BlocListener<RegisterBloc, RegisterState>(
        listener: (context, state) {
          if (state is RegisterSuccess) {
            getIt<NotificationManager>().showSuccess(message: 'Успешная регистрация');
          }
          if (state is RegisterError){
            getIt<NotificationManager>().showError(message: state.message);
          }
        },
        child: Scaffold(
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
                      'Travel Connector\nДобро пожаловать!',
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
                  flex: 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AuthTextFieldWidget(
                        controller: emailController,
                        isPassword: false,
                        title: "Почта",
                        hint: "Введите почту",
                        validator: (p0) {},
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      AuthTextFieldWidget(
                        controller: passwordController,
                        isPassword: true,
                        title: "Пароль",
                        hint: "Введите пароль",
                        validator: (p0) {},
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      AuthTextFieldWidget(
                        controller: confirmPasswordController,
                        isPassword: true,
                        title: "Подтвердите пароль",
                        hint: "Введите пароль ещё раз",
                        validator: (p0) {},
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                BlocBuilder<RegisterBloc, RegisterState>(
                  builder: (context, state) {
                    if (state is RegisterLoading) {
                      return CustomCircularIndicatorWidget();
                    }
                    return CustomButtonWidget(
                      text: "Регистрация",
                      outline: false,
                      onPressed: () {
                        context.read<RegisterBloc>().add(
                          ExecuteRegisterEvent(
                              email: emailController.text,
                              password: passwordController.text,
                              confirmPassword:
                              confirmPasswordController.text),
                        );
                      },
                    );
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Уже есть аккаунт?",
                      style: theme.textTheme.bodyMedium!.copyWith(
                        color: AppColors.black,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        context.pop();
                      },
                      child: Text(
                        "Войти",
                        style: theme.textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w700,
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
