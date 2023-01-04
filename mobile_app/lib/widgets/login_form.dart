/* flutter */
import 'package:flutter/material.dart';
/* widgets */
import 'package:mobile_app/widgets/custom_input.dart';
import 'package:mobile_app/widgets/custom_button.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  LoginFormState createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[
          CustomInput(
            icon: Icons.email_outlined,
            placeholder: 'Email',
            keyboardType: TextInputType.emailAddress,
            textController: emailCtrl,
          ),
          const SizedBox(height: 16),
          CustomInput(
            icon: Icons.lock_outline,
            placeholder: 'Password',
            textController: passCtrl,
            isPassword: true,
          ),
          const SizedBox(height: 16),
          CustomButton(
            onPressed: () {},
            text: 'Sign in',
          ),
        ],
      ),
    );
  }
}
