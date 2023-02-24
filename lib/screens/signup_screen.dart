import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/widgets/text_field_input.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _usernameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                width: double.infinity,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Flexible(flex: 2, child: Container()),
                      //svg image
                      SvgPicture.asset(
                        'assets/ic_instagram.svg',
                        color: primaryColor,
                        height: 64,
                      ),
                      const SizedBox(
                        height: 64,
                      ),
                      //circular widget to accept and show our selected file
                      Stack(children: const [
                        CircleAvatar(
                          radius: 64,
                          backgroundImage: NetworkImage(
                              'https://images.unsplash.com/photo-1677238805928-62c4df123119?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
                        ),
                        Positioned(
                          bottom: -10,
                          left: 80,
                            child: IconButton(
                                onPressed: null,
                                icon: Icon(Icons.add_a_photo)))
                      ]),
                      const SizedBox(
                        height: 14,
                      ),
                      //text field input for username
                      TextFieldInput(
                          textEditingController: _usernameController,
                          hintText: 'Enter your username',
                          textInputType: TextInputType.text),
                      const SizedBox(
                        height: 24,
                      ),
                      //text field input for email
                      TextFieldInput(
                          textEditingController: _emailController,
                          hintText: 'Enter your email',
                          textInputType: TextInputType.emailAddress),

                      const SizedBox(
                        height: 24,
                      ),
                      //text field input for password
                      TextFieldInput(
                        textEditingController: _passwordController,
                        hintText: 'Enter your password',
                        textInputType: TextInputType.text,
                        isPassword: true,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      //text field input for bio
                      TextFieldInput(
                        textEditingController: _bioController,
                        hintText: 'Enter your bio',
                        textInputType: TextInputType.text,
                        isPassword: false,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      //login button
                      InkWell(
                        child: Container(
                            width: double.infinity,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            decoration: const ShapeDecoration(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(4),
                                  ),
                                ),
                                color: blueColor),
                            child: const Text('Login')),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Flexible(flex: 2, child: Container()),
                      //Transitioning to signing up
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: const Text('Don\'t have an account?'),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, '/signup');
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: const Text(
                                'Sign Up',
                                style: TextStyle(
                                  color: blueColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Flexible(flex: 1, child: Container()),
                    ]))));
  }
}
