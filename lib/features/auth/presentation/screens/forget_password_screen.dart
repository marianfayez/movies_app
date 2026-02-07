import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:movies_app/core/resources/color_manager.dart';
import 'package:movies_app/core/resources/styles_manager.dart';
import 'package:movies_app/core/routes/auto_route.gr.dart';
import 'package:movies_app/core/widgets/app_bar.dart';
import 'package:movies_app/core/widgets/custom_elevated_button.dart';
import 'package:movies_app/core/widgets/main_text_field.dart';
import 'package:movies_app/core/widgets/validators.dart';
import 'package:movies_app/di.dart';
import 'package:movies_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:movies_app/gen/assets.gen.dart';

@RoutePage()
class ForgetPasswordScreen extends StatelessWidget {
  ForgetPasswordScreen({super.key});

  var emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthBloc>(),
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (Navigator.canPop(context)) {
            Navigator.pop(context);
          }
          if (state.forgetPasswordRequestState == RequestState.loading) {
            showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => const AlertDialog(
                      title: Center(child: CircularProgressIndicator()),
                      backgroundColor: Colors.transparent,
                    ));
          } else if (state.forgetPasswordRequestState == RequestState.error) {
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
          } else if (state.forgetPasswordRequestState == RequestState.success) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Password reset email sent. Check your inbox 📩'),
              ),
            );          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: ColorManager.primary,
            appBar: const MyAppBar(title: "Forget Password"),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(child: Assets.images.forgotPasswordBro1.image()),
                    SizedBox(
                      height: 24.h,
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
                    CustomElevatedButton(
                      isStadiumBorder: false,
                      backgroundColor: ColorManager.secondary,
                      textStyle: getRegularStyle2(color: ColorManager.primary),
                      label: 'Verify Email',
                      onTap: () {
                        BlocProvider.of<AuthBloc>(context)
                            .add(ForgetPasswordEvent(
                          emailController.text,
                        ));
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
