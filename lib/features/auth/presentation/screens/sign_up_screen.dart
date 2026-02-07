import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/color_manager.dart';
import 'package:movies_app/core/resources/styles_manager.dart';
import 'package:movies_app/core/widgets/app_bar.dart';
import 'package:movies_app/core/widgets/custom_elevated_button.dart';
import 'package:movies_app/core/widgets/main_text_field.dart';
import 'package:movies_app/core/widgets/validators.dart';
import 'package:movies_app/di.dart';
import 'package:movies_app/features/auth/data/models/firebase_sign_up_request_model.dart';
import 'package:movies_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:movies_app/gen/assets.gen.dart';

@RoutePage()
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var nameController = TextEditingController();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  var mobileController = TextEditingController();

  var rePasswordController = TextEditingController();

  int currentIndex = 0;

  List<AssetGenImage> imgList = [
    Assets.images.gamer0,
    Assets.images.gamer1,
    Assets.images.gamer2,
    Assets.images.gamer3,
    Assets.images.gamer4,
    Assets.images.gamer5,
    Assets.images.gamer6,
    Assets.images.gamer7,
    Assets.images.gamer8,
  ];
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AuthBloc>(),
      child: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (Navigator.canPop(context)) {
            Navigator.pop(context);
          }

          if (state.requestState == RequestState.loading) {
            showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) => const AlertDialog(
                      title: Center(child: CircularProgressIndicator()),
                      backgroundColor: Colors.transparent,
                    ));
          } else if (state.requestState == RequestState.error) {
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
          } else if (state.requestState == RequestState.success) {
            // context.router.replaceAll([const MainRoute()]);
          }
        },
        builder: (context, state) {
          return Scaffold(
            backgroundColor: ColorManager.primary,
            appBar: const MyAppBar(title: "Register"),
            body: Padding(
              padding: EdgeInsets.all(20.r),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: CarouselSlider.builder(
                            itemCount: imgList.length,
                            itemBuilder: (context, index, realIdx) {
                              bool isSelected = index == currentIndex;
                              return Container(
                                decoration: BoxDecoration(
                                  border: isSelected
                                      ? Border.all(
                                          color: ColorManager.secondary,
                                          width: 3)
                                      : null,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: imgList[index].image(
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                            options: CarouselOptions(
                                height: 120,
                                viewportFraction: 0.3,
                                initialPage: 4,
                                enableInfiniteScroll: false,
                                reverse: false,
                                autoPlay: false,
                                enlargeCenterPage: true,
                                enlargeFactor: 0.4,
                                // Make the center image significantly larger
                                scrollDirection: Axis.horizontal,
                                aspectRatio: 8 / 4,
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    currentIndex = index;
                                  });
                                })),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      BuildTextField(
                        prefixIcon: const Icon(
                          Icons.perm_identity,
                          color: Colors.white,
                        ),
                        backgroundColor: ColorManager.grey,
                        hint: 'Name',
                        controller: nameController,
                        textInputType: TextInputType.name,
                        validation: AppValidators.validateFullName,
                      ),
                      SizedBox(
                        height: 18.h,
                      ),
                      BuildTextField(
                        prefixIcon: const Icon(
                          Icons.email,
                          color: Colors.white,
                        ),
                        hint: 'Email',
                        backgroundColor: ColorManager.grey,
                        controller: emailController,
                        validation: AppValidators.validateEmail,
                        textInputType: TextInputType.emailAddress,
                      ),
                      SizedBox(
                        height: 18.h,
                      ),
                      BuildTextField(
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Colors.white,
                        ),
                        hint: 'Password',
                        backgroundColor: ColorManager.grey,
                        controller: passwordController,
                        validation: AppValidators.validatePassword,
                        isObscured: true,
                        textInputType: TextInputType.text,
                      ),
                      SizedBox(
                        height: 18.h,
                      ),
                      BuildTextField(
                        prefixIcon: const Icon(
                          Icons.lock,
                          color: Colors.white,
                        ),
                        hint: 'Confirm Password',
                        backgroundColor: ColorManager.grey,
                        controller: rePasswordController,
                        validation: (val) =>
                            AppValidators.validateConfirmPassword(
                                val, passwordController.text),
                        isObscured: true,
                        textInputType: TextInputType.visiblePassword,
                      ),
                      SizedBox(
                        height: 18.h,
                      ),
                      BuildTextField(
                        prefixIcon: const Icon(
                          Icons.phone,
                          color: Colors.white,
                        ),
                        hint: 'Phone Number',
                        backgroundColor: ColorManager.grey,
                        controller: mobileController,
                        validation: AppValidators.validatePhoneNumber,
                        textInputType: TextInputType.phone,
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      CustomElevatedButton(
                        label: 'Create Account',
                        isStadiumBorder: false,
                        backgroundColor: ColorManager.secondary,
                        textStyle:
                            getRegularStyle3(color: ColorManager.primary),
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          if (_formKey.currentState!.validate()) {
                            FirebaseSignUpRequestModel model =
                                FirebaseSignUpRequestModel(
                                    avatarId: currentIndex,
                                    name: nameController.text,
                                    phone: mobileController.text,
                                    password: passwordController.text,
                                    email: emailController.text);
                            BlocProvider.of<AuthBloc>(context)
                                .add(SignUpEvent(model));
                          }
                        },
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already Have Account ?",
                            style: getRegular2(color: Colors.white),
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            "Login",
                            style: getRegular2(color: ColorManager.secondary),
                          ),
                        ],
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
