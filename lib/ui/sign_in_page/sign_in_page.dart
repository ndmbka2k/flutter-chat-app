import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_app/common/app_button.dart';
import 'package:flutter_login_app/common/app_input_field.dart';
import 'package:flutter_login_app/config/app_config.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppInputField(
              controller: _emailController,
              focusNode: _emailFocusNode,
              prefixIcon: const Icon(Icons.mail),
              hintText: 'Email or phone number',
              elevation: 5,
              textInputAction: TextInputAction.next,
              onEditingComplete: () {
                _passwordFocusNode.requestFocus();
              },
            ),
            const Gap(16),
            AppInputField(
              controller: _passwordController,
              focusNode: _passwordFocusNode,
              prefixIcon: const Icon(Icons.key),
              obscureText: true,
              hintText: 'Password',
              elevation: 5,
              textInputAction: TextInputAction.done,
              onFieldSubmitted: (_) => formFiledSubmitted(),
            ),
            const Gap(8),
            const Align(
              alignment: Alignment.centerRight,
              child: Text('Forgot password?'),
            ),
            const Text('Remember me'),
            SizedBox(
              width: double.infinity,
              child: AppButton(title: 'Login', onPressed: formFiledSubmitted),
            ),
            const Text('Or'),
            const Text('Sign in with'),
            _buildLoginIcon(),
          ],
        ),
      ),
    );
  }

  Row _buildLoginIcon() {
    return Row(
            mainAxisSize: MainAxisSize.min,
            children:  [
              const FaIcon(
                FontAwesomeIcons.facebook,
                color: Colors.blue,
              ),
              const Gap(8),
              const FaIcon(
                FontAwesomeIcons.twitter,
                color: Colors.blue,
              ),
              const Gap(8),
              InkWell(
                onTap: _loginWithGoogle,
                child: const FaIcon(
                  FontAwesomeIcons.googlePlus,
                  color: Colors.red,
                ),
              ),
            ],
          );
  }

  void formFiledSubmitted() async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      if (mounted) {
        Navigator.of(context).pushReplacementNamed(AppConfig.homePage);
      }
    } catch (e) {
      showDialog(context: context, builder: (context) => AlertDialog());
    }
  }
    Future<void> _loginWithGoogle() async {
      // final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      //
      // final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
      //
      // final credential = GoogleAuthProvider.credential(
      //   accessToken: googleAuth?.accessToken,
      //   idToken: googleAuth?.idToken,
      // );
      //
      // await FirebaseAuth.instance.signInWithCredential(credential);
      // if (mounted) {
      //   Navigator.of(context).pushReplacementNamed(AppConfig.homePage);
      // }

      // Only UI:
      Navigator.of(context).pushReplacementNamed(AppConfig.homePage);
  }
}
