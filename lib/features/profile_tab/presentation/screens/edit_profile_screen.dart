import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/color_manager.dart';
import 'package:movies_app/core/resources/request_state.dart';
import 'package:movies_app/core/resources/styles_manager.dart';
import 'package:movies_app/core/routes/auto_route.gr.dart';
import 'package:movies_app/core/widgets/app_bar.dart';
import 'package:movies_app/core/widgets/custom_elevated_button.dart';
import 'package:movies_app/core/widgets/main_text_field.dart';
import 'package:movies_app/features/auth/data/models/sign_up_request_model.dart';
import 'package:movies_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:movies_app/features/profile_tab/presentation/bloc/profile_bloc.dart';
import 'package:movies_app/features/profile_tab/presentation/widgets/add_bottom_sheet.dart';

@RoutePage()
class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final phoneController = TextEditingController();
  final nameController = TextEditingController();
  int avatarId = 0;
  int? selectedAvatarId;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    final user = context.read<AuthBloc>().state.authModel?.user;

    nameController.text = user?.name ?? "";
    phoneController.text = user?.phone ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileBloc, ProfileState>(listener: (context, state) {
      if (state.updateProfileRequestState == RequestState.success) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Profile updated successfully!"),
          ),
        );

      }

      if (state.updateProfileRequestState == RequestState.error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              state.updateProfileRouteFailures?.message ??
                  "Something went wrong",
            ),
          ),
        );
      }
    }, child: BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        final user = state.authModel?.user;

        if (nameController.text.isEmpty && user != null) {
          nameController.text = user.name;
          phoneController.text = user.phone ?? "";
        }
        return Scaffold(
            backgroundColor: ColorManager.primary,
            appBar: const MyAppBar(
              title: "Edit Profile",
            ),
            body: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: Column(children: [
                      InkWell(
                          onTap: () async {
                            selectedAvatarId = await showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                backgroundColor: ColorManager.primary,
                                builder: (context) {
                                  return Wrap(
                                    children: [
                                      AddBottomSheet(
                                        avaterId: avatarId,
                                      ),
                                    ],
                                  );
                                });
                            if (selectedAvatarId != null) {
                              setState(() {
                                avatarId = selectedAvatarId!;
                              });
                            }
                          },
                          child: selectedAvatarId != null
                              ? Image.asset("assets/images/gamer$avatarId.png")
                              : Image.asset(
                                  "assets/images/gamer${user?.avatarId}.png")),
                      SizedBox(
                        height: 35.h,
                      ),
                      BuildTextField(
                        prefixIcon: const Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                        backgroundColor: ColorManager.grey,
                        controller: nameController,
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      BuildTextField(
                        prefixIcon: const Icon(
                          Icons.phone,
                          color: Colors.white,
                        ),
                        backgroundColor: ColorManager.grey,
                        controller: phoneController,
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: InkWell(
                          onTap: () {
                            context.replaceRoute(ForgetPasswordRoute());
                          },
                          child: Text(
                            "Reset Password",
                            style: getRegular2(color: Colors.white),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ),
                      const Spacer(),
                      CustomElevatedButton(
                          label: "Delete Account",
                          backgroundColor: Colors.red,
                          isStadiumBorder: false,
                          onTap: () {}),
                      SizedBox(height: 12.h),
                      CustomElevatedButton(
                          label: "Update Data",
                          backgroundColor: ColorManager.secondary,
                          isStadiumBorder: false,
                          textColor: ColorManager.primary,
                          onTap: () {
                            final currentUser =
                                context.read<AuthBloc>().state.authModel?.user;
                            if (currentUser == null) return;

                            context.read<ProfileBloc>().add(UpdateUserEvent(
                                  FirebaseUserModel(
                                    id: currentUser.id,
                                    name: nameController.text.trim(),
                                    email: currentUser.email,
                                    phone: phoneController.text.trim().isEmpty
                                        ? currentUser.phone
                                        : phoneController.text.trim(),
                                    role: currentUser.role,
                                    avatarId: selectedAvatarId ??
                                        currentUser.avatarId,
                                    createdAt: currentUser.createdAt,
                                  ),
                                ));
                          })
                    ]),
                  ),
                ),
              ),
            ));
      },
    ));
  }
}
