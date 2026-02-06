import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/core/resources/color_manager.dart';
import 'package:movies_app/core/resources/styles_manager.dart';
import 'package:movies_app/core/routes/auto_route.gr.dart';
import 'package:movies_app/core/widgets/button.dart';
import 'package:movies_app/core/widgets/custom_elevated_button.dart';
import 'package:movies_app/core/widgets/main_text_field.dart';
import 'package:movies_app/core/widgets/validators.dart';
import 'package:movies_app/di.dart';
import 'package:movies_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:movies_app/gen/assets.gen.dart';

@RoutePage()
class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthBloc>(),
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.logInRequestState == RequestState.loading) {
            showDialog(
                context: context,
                builder: (context) => const AlertDialog(
                      title: Center(child: CircularProgressIndicator()),
                      backgroundColor: Colors.transparent,
                    ));
          } else if (state.logInRequestState == RequestState.error) {
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      title: const Text("Error"),
                      content: Text(state.routeFailures?.message ??
                          "Something went wrong"),
                      actions: [
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Ok"))
                      ],
                    ));
          } else if (state.logInRequestState == RequestState.success) {
            // context.router.replaceAll([MainRoute()]);
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: ColorManager.primary,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 40.h,
                      ),
                      Center(child: Assets.images.splashLogo.image()),
                      SizedBox(
                        height: 70.h,
                      ),
                      BuildTextField(
                        prefixIcon: const Icon(
                          Icons.email,
                          color: Colors.white,
                        ),
                        backgroundColor: ColorManager.grey,
                        hint: 'Email',
                        controller: emailController,
                        textInputType: TextInputType.emailAddress,
                        validation: AppValidators.validateEmail,
                      ),
                      SizedBox(
                        height: 22.h,
                      ),
                      BuildTextField(
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Colors.white,
                        ),
                        backgroundColor: ColorManager.grey,
                        hint: 'Password',
                        controller: passwordController,
                        isObscured: true,
                        textInputType: TextInputType.text,
                        validation: AppValidators.validatePassword,
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Row(
                        children: [
                          const Spacer(),
                          GestureDetector(
                              onTap: () {},
                              child: Text('Forget password?',
                                  style: getRegular2(
                                      color: ColorManager.secondary))),
                        ],
                      ),
                      SizedBox(
                        height: 32.h,
                      ),
                      CustomElevatedButton(
                        isStadiumBorder: false,
                        backgroundColor: ColorManager.secondary,
                        textStyle: getRegularStyle2(color: ColorManager.primary),
                        label: 'Login',
                        onTap: () {
                          BlocProvider.of<AuthBloc>(context).add(LogInEvent(
                              emailController.text,
                              passwordController.text));
                        },
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Don’t have an account?',
                              style: getRegular2(color: ColorManager.white)),
                          SizedBox(
                            width: 8.w,
                          ),
                          GestureDetector(
                            onTap: () => context.pushRoute(SignUpRoute()),
                            child: Text('Create Account',
                                style:
                                    getRegular2(color: ColorManager.secondary)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                              child: Divider(
                            color: ColorManager.secondary,
                            thickness: 1,
                            indent: 30,
                            endIndent: 20,
                          )),
                          Center(
                              child: Text(
                            "OR",
                            style: getRegular2(color: ColorManager.secondary),
                          )),
                          Expanded(
                              child: Divider(
                            color: ColorManager.secondary,
                            thickness: 1,
                            indent: 20,
                            endIndent: 30,
                          )),
                        ],
                      ),
                      SizedBox(
                        height: 28.h,
                      ),
                      CustomElevatedButton(
                        prefixIcon: Assets.images.google.image(width: 25.w,height: 25.h),
                        isStadiumBorder: false,
                        backgroundColor: ColorManager.secondary,
                        textStyle: getRegularStyle2(color: ColorManager.primary),
                        label: 'Login With Google',
                        onTap: () {
                          BlocProvider.of<AuthBloc>(context).add(LogInEvent(
                              emailController.text,
                              passwordController.text));
                          },
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
