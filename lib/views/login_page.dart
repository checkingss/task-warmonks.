import 'package:flutter/material.dart';
import 'package:sample_project_warmonks/block/user_bloc.dart';
import 'package:sample_project_warmonks/models/get_user_response_model.dart';
import 'package:sample_project_warmonks/utils/constants.dart';
import 'package:sample_project_warmonks/utils/utils.dart';
import 'package:sample_project_warmonks/views/enquiry_form_page.dart';
import 'package:sample_project_warmonks/views/widgets/build_common_button.dart';
import 'package:sample_project_warmonks/views/widgets/build_custom_clip_path_widget.dart';
import 'package:sample_project_warmonks/views/widgets/build_text_form_field_widget.dart';
import 'package:sample_project_warmonks/views/widgets/build_text_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _userController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  GetUserResponseModel getUserResponseModel = GetUserResponseModel();
  UserBloc userBloc = UserBloc();
  bool isLoading = false;

  @override
  void initState() {
    userBloc.loginListerner.listen((event) {
      getUserResponseModel = event;
      print("event.userDetails!.username");
      print(event.userDetails!.username);
      print(event.userDetails!.password);
      if (event.userDetails!.username == _userController.text) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => EnquiryFormPage(),
            ));
      } else {
        showToast("wrong username or password");
      }
    }, onError: (error) {
      showToast("Login failed");
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RotationTransition(
                  turns: new AlwaysStoppedAnimation(50 / 100),
                  child: SizedBox(
                    height: screenHeight(context, dividedBy: 6.2),
                    width: screenWidth(context, dividedBy: 2.6),
                    child: ClipPath(
                        clipper: ClipTriangle(),
                        child: Stack(
                          children: [
                            Container(
                              color: Colors.red,
                            ),
                            Container(
                              width: screenWidth(context),
                              height: 18,
                              color: Constants.kitGradients[0],
                            ),
                          ],
                        )),
                  ),
                ),
                // );,
                SizedBox(
                  height: screenHeight(context, dividedBy: 18),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: screenWidth(context, dividedBy: 9)),
                  child: BuildTextWidget(
                    text: 'Hey,',
                    color: Constants.kitGradients[1],
                    size: 25,
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: screenWidth(context, dividedBy: 9)),
                  child: BuildTextWidget(
                    text: 'Login Now!',
                    color: Constants.kitGradients[2],
                    size: 42,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: screenHeight(context, dividedBy: 28),
                ),
                Container(
                  height: screenHeight(context, dividedBy: 5.0),
                  // color: Colors.red,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: screenWidth(context, dividedBy: 9)),
                    child: Column(children: [
                      const SizedBox(
                        height: 10,
                      ),
                      BuildTexFormFieldWidget(
                          validation: (value) => validateUserName(value),
                          controller: _userController,
                          hintText: 'Username',
                          suffix: Icon(Icons.person)),
                      const SizedBox(
                        height: 15,
                      ),
                      BuildTexFormFieldWidget(
                        validation: (value) => validateUserName(value),
                        controller: _passwordController,
                        hintText: 'Password',
                        suffix: Icon(Icons.remove_red_eye_sharp),
                      ),
                    ]),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: screenWidth(context, dividedBy: 9),
                    ),
                    const BuildTextWidget(
                      text: 'Forget password? ',
                    ),
                    const BuildTextWidget(text: '/  Reset')
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                    child: isLoading
                        ? CircularProgressIndicator(
                            color: Constants.kitGradients[2],
                          )
                        : BuildCommonButton(
                            Text: 'Login Now',
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                setState(() {
                                  isLoading = true;
                                });
                                userBloc.login(
                                    username: _userController.text,
                                    password: _passwordController.text);
                              }
                            },
                          ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
