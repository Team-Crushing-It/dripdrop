import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'user_repository.dart';

import 'authentication_bloc.dart';
import 'login_bloc.dart';
import 'login_form.dart';

class LoginPage extends StatelessWidget {
  final UserRepository userRepository;

  LoginPage({Key key, @required this.userRepository})
      : assert(userRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Image(image: AssetImage("assets/logo-stacked.png")),
              BlocProvider(
                create: (context) {
                  return LoginBloc(
                    authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
                    userRepository: userRepository,
                  );
                },
                child: LoginForm(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
