/* flutter */
import 'package:flutter/material.dart';
import 'package:mobile_app/widgets/alert.dart';
import 'package:provider/provider.dart';
/* widgets */
import 'package:mobile_app/widgets/custom_input.dart';
import 'package:mobile_app/widgets/custom_button.dart';
/* services */
import 'package:mobile_app/services/auth_service.dart';
import 'package:mobile_app/services/socket_service.dart';

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
    final authService = Provider.of<AuthService>(context);
    final socketService = Provider.of<SocketService>(context);

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
            onPressed: () async {
              FocusScope.of(context).unfocus();

              final auth =
                  await authService.signIn(emailCtrl.text, passCtrl.text);

              if (!auth.status) {
                // ignore: use_build_context_synchronously
                return showAlert(context, 'No authenticated', auth.message);
              }

              socketService.connect();

              // ignore: use_build_context_synchronously
              Navigator.pushReplacementNamed(context, 'users');
            },
            text: 'Sign in',
            isLoading: authService.isSignInProcess,
          ),
        ],
      ),
    );
  }
}
