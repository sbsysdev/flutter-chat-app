/* flutter */
import 'package:flutter/material.dart';
/* widgets */
import 'package:mobile_app/widgets/logo.dart';
import 'package:mobile_app/widgets/login_form.dart';
import 'package:mobile_app/widgets/labels.dart';
import 'package:mobile_app/widgets/terms.dart';
/* types */
import 'package:mobile_app/constants/palette.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Palette.bg,
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            padding: const EdgeInsets.only(left: 32, right: 32),
            height: MediaQuery.of(context).size.height * 0.95,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const <Widget>[
                Logo(),
                LoginForm(),
                Labels(route: 'register'),
                Terms(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
