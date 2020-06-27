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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Spacer(flex: 2),
              Image(image: AssetImage("assets/logo.png")),
              Text("only real news",
                  style: TextStyle(
                      color: Colors.grey[800],
                      fontFamily: "Open Sans",
                      fontSize: 20,
                      fontWeight: FontWeight.w600)),
              Spacer(flex: 2),
              BlocProvider(
                create: (context) {
                  return LoginBloc(
                    authenticationBloc:
                        BlocProvider.of<AuthenticationBloc>(context),
                    userRepository: userRepository,
                  );
                },
                child: LoginForm(),
              ),
              Spacer(),
              Text("Forgot your password?",
                  style: TextStyle(color: Colors.grey[600], fontSize: 15)),
              Spacer(flex: 2),
              RichText(
                text: TextSpan(
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      color: Colors.grey[600]),
                  children: [
                    TextSpan(text: "Don't have an account? "),
                    TextSpan(
                        text: "Sign Up",
                        style: TextStyle(fontWeight: FontWeight.w600))
                  ],
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
