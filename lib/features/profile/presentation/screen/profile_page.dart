import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:notes/core/di/dependency_injection.dart';

import '../../../../core/navigation/routes/login_route.dart';
import '../../../../generated/l10n.dart';
import '../bloc/profile_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      getIt<ProfileBloc>()
        ..add(ProfileUserSubscribed())..add(ProfileCurrentUserLoaded()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('PROFILE'),
        ),
        body: Column(
          children: [
            Row(
              children: [
                _ProfileImage(),
                Column(
                  children: [
                    _EmailText(),
                    _UsernameText()
                  ],
                ),
              ],
            ),
            TextButton(
                onPressed: () {
                  context.go(LoginRoute.navigationRoute);
                },
                child: Text(S
                    .of(context)
                    .login))
          ],
        ),
      ),
    );
  }
}

class _ProfileImage extends StatelessWidget {
  const _ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        final user = state.user;
        if (user == null) return SvgPicture.asset('assets/icons/ic_user_question.svg');
        final imageLink = user.photoURL;
        if (imageLink == null) return SvgPicture.asset('assets/icons/ic_user.svg');
        debugPrint('imageLink : $imageLink');
        return Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            image: DecorationImage(
              image: NetworkImage(imageLink),
            ),
          ),
        );
      },
    );
  }
}

class _EmailText extends StatelessWidget {
  const _EmailText({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        final email = state.user?.email;
        if (email == null) return const SizedBox();
        return Text(email);
      },
    );
  }
}

class _UsernameText extends StatelessWidget {
  const _UsernameText({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        final email = state.user?.email;
        if (email == null) return const SizedBox();
        return Text(email);
      },
    );
  }
}