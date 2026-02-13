import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/routes/auto_route.dart';
import 'package:movies_app/core/routes/auto_route.gr.dart';
import 'package:movies_app/core/widgets/custom_elevated_button.dart';
import 'package:movies_app/features/auth/presentation/bloc/auth_bloc.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomElevatedButton(
          label: "Log Out",
          onTap: () {
            BlocProvider.of<AuthBloc>(context).add(LogOut());
            context.replaceRoute( SignInRoute());
          }),
    );
  }
}
