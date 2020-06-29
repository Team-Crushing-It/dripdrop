import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'login_bloc.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginForm extends StatefulWidget {
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _onLoginButtonPressed() {
      BlocProvider.of<LoginBloc>(context).add(
        LoginButtonPressed(
          username: _usernameController.text,
          password: _passwordController.text,
        ),
      );
    }

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('${state.error}'),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Form(
            child: Column(

              //Input fields ======================================================
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: "USERNAME"),
                  controller: _usernameController,
                ),
                SizedBox(height: 15),
                TextFormField(
                  decoration: InputDecoration(labelText: 'PASSWORD'),
                  controller: _passwordController,
                  obscureText: true,
                ),
                // SizedBox(height: 40),
//                RaisedButton(
//                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
//                  onPressed: state is! LoginInProgress ? _onLoginButtonPressed : null,
//                  textColor: Colors.white,
//                  padding: const EdgeInsets.all(0.0),
//                  child: Container(
//                    width: double.maxFinite,
//                    decoration: BoxDecoration(
//                      borderRadius: BorderRadius.circular(5),
//                      gradient: LinearGradient(
//                        begin: Alignment.bottomCenter,
//                        end: Alignment.topCenter,
//                        colors: <Color>[
//                          Color(0xFF06AF24),
//                          Color(0xFF07B023),
//                          Color(0xFFBCF1B7),
//                        ],
//                      ),
//                    ),
//                    padding: const EdgeInsets.all(10.0),
//                    child: Center(
//                      child: Padding(
//                        padding: const EdgeInsets.symmetric(vertical: 8.0),
//                        child: const Text('LOGIN', style: TextStyle(fontSize: 20)),
//                      ),
//                    ),
//                  ),
//                ),

                // Remember me row with switch
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Remember me?",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Switch(
                      value: true,
                      activeColor: Theme.of(context).accentColor,
                      inactiveThumbColor: Theme.of(context).accentColor,
                      activeTrackColor: Theme.of(context).cardColor,
                      inactiveTrackColor: Theme.of(context).cardColor,
                      onChanged: (bool boolean) {},
                    ),
                  ],
                ),
                // Container(
                //   child: state is LoginInProgress ? CircularProgressIndicator() : null,
                // ),


                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    //Login Bbutton ===============================================================
                    Container(
                      width: 140,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Theme.of(context).accentColor,
                          width: 3,
                        ),
                        borderRadius: BorderRadius.circular(6)
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: FlatButton(
                        child: Text("LOGIN", style: Theme.of(context).textTheme.headline6,),
                        color: Theme.of(context).accentColor,
                        onPressed: state is! LoginInProgress ? _onLoginButtonPressed : null,
                      ),
                    ),

                    // Register button=========================================================
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).accentColor,
                            width: 3,
                          ),
                          borderRadius: BorderRadius.circular(6)
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: FlatButton(
                        child: Text("REGISTER", style: Theme.of(context).textTheme.headline6,),
                        color: Theme.of(context).accentColor,
                        onPressed: () {},
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
