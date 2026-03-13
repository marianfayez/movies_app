import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/resources/styles_manager.dart';
import 'package:movies_app/core/widgets/app_bar.dart';
import 'package:movies_app/core/widgets/main_text_field.dart';
import 'package:movies_app/di.dart';
import 'package:movies_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:movies_app/features/profile_tab/presentation/widgets/add_bottom_sheet.dart';

@RoutePage()
class EditProfileScreen extends StatefulWidget {

   const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final  phoneController = TextEditingController();

  final nameController = TextEditingController();

  int avatarId = 0;
  int? selectedAvatarId;

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => getIt<AuthBloc>(),
  child: BlocConsumer<AuthBloc, AuthState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    final authState = context.watch<AuthBloc>().state;
    final user = authState.authModel?.user;
    // final avatarId = user?.avatarId ?? 1;
    // final userName = user?.name ?? "Guest";

    return Scaffold(
        appBar: const MyAppBar(title: "Edit Profile",),
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
                            backgroundColor: const Color(0xFF282A28),
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
                  BuildTextField(suffixIcon: Icon(Icons.person),)
                   SizedBox(
                    height: 16.h,
                  ),
                   SizedBox(
                    height: 30.h,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      onTap: (){

                      },
                      child: Text(
                        "Reset Password",
                        style: getRegular2(color: Colors.white),
                        textAlign: TextAlign.start,
                      ),
                    ),
                  ),Spacer(),
                  const SizedBox(height: 12),
                ]),
              ),
            ),
          ),
        ));
  },
),
);
  }
}
