import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:signup_module/colors.dart';
import 'package:signup_module/components/wave.dart';
import 'package:signup_module/images.dart';
import 'package:signup_module/strings.dart';

class LoginSignup extends StatefulWidget {
  const LoginSignup({Key? key}) : super(key: key);

  @override
  LoginSignupState createState() => LoginSignupState();
}

class LoginSignupState extends State<LoginSignup> {
  final TextEditingController _usernamelogin = TextEditingController();
  final TextEditingController _passwordlogin = TextEditingController();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _contact = TextEditingController();
  FocusNode emailLogin = FocusNode();
  FocusNode passwordLogin = FocusNode();
  FocusNode submitLogin = FocusNode();
  FocusNode unameSignup = FocusNode();
  FocusNode passwordSignup = FocusNode();
  FocusNode emailSignup = FocusNode();
  FocusNode contactSignup = FocusNode();
  final _loginFormKey = GlobalKey<FormState>();
  final _signupFormKey = GlobalKey<FormState>();
  late double h1, h2, h3;

  /// this will be used for setting margin over waves
  bool firstPane = true;

  /// true if first page is open, false if close.
  bool onStart = true;

  ///onstart is only set once,
  bool displayText = true;
  bool visibilityPassword = true;
  bool visibilityPassSignup = true;
  bool keyboardOverlay = false;

  String? _validateEmail(String? value) {
    if (value!.isEmpty) {
      return AppStrings.enterValidEmail;
    }

    RegExp regEx = RegExp(AppStrings.emailFormat);

    if (regEx.hasMatch(value)) {
      return null;
    }
    return AppStrings.enterValidEmail;
  }

  void _togglePassword() {
    setState(() {
      visibilityPassword = !visibilityPassword;
    });
  }

  void _togglePasswordSignUp() {
    setState(() {
      visibilityPassSignup = !visibilityPassSignup;
    });
  }

  /// This method will change the size of containers to show different page

  void changeSize() {
    setState(() {
      if (firstPane) {
        firstPane = false;
        keyboardOverlay = true;
        h1 = MediaQuery.of(context).size.height * 0.10;
        h2 = MediaQuery.of(context).size.height * 0.12;
        h3 = MediaQuery.of(context).size.height;
        displayText = false;
      } else {
        firstPane = true;
        keyboardOverlay = false;
        h1 = MediaQuery.of(context).size.height * 0.3;
        h2 = MediaQuery.of(context).size.height * 0.318;
        h3 = MediaQuery.of(context).size.height * 0.33;
        displayText = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (onStart) {
      ///For setting the initial size of each wave
      onStart = false;
      h1 = MediaQuery.of(context).size.height * 0.3;
      h2 = MediaQuery.of(context).size.height * 0.318;
      h3 = MediaQuery.of(context).size.height * 0.33;
    }
    return Scaffold(
      resizeToAvoidBottomInset: keyboardOverlay,
      body: Stack(
        children: [
          SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: Image.asset(
                AppImages.mountain,
                fit: BoxFit.fill,
              )),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(
                    25, MediaQuery.of(context).size.height * 0.15, 20, 20),
                child: Row(
                  children: [
                    Text(
                      AppStrings.chalet,
                      style: const TextStyle(fontSize: 30),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              Expanded(
                child: AnimatedContainer(
                  margin: EdgeInsets.fromLTRB(0, h1, 0, 0),
                  constraints: BoxConstraints.loose(
                      Size(MediaQuery.of(context).size.width, 1000)),
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                  ),
                  duration: const Duration(milliseconds: 500),
                  child: Column(
                    children: [
                      CustomPaint(
                        painter: DrawCurve(backgroundColor: Colors.deepPurple),
                        size: Size(MediaQuery.of(context).size.width, 50),
                      ),
                      Expanded(
                        child: Container(
                          constraints: const BoxConstraints.expand(),
                          decoration:
                              const BoxDecoration(color: Colors.deepPurple),
                          child: Column(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Expanded(
                child: AnimatedContainer(
                  margin: EdgeInsets.fromLTRB(0, h2, 0, 0),
                  constraints: const BoxConstraints.expand(),
                  decoration: BoxDecoration(
                    color: AppColor.transparent,
                  ),
                  duration: const Duration(milliseconds: 500),
                  child: Column(
                    children: [
                      CustomPaint(
                        painter:
                            DrawCurve(backgroundColor: Colors.deepPurpleAccent),
                        size: Size(MediaQuery.of(context).size.width, 50),
                      ),
                      Expanded(
                        child: Container(
                          constraints: const BoxConstraints.expand(),
                          decoration:
                              BoxDecoration(color: AppColor.purpleLight),
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
                              child: Theme(
                                data: ThemeData(
                                  primaryColor: AppColor.white,
                                  textTheme: TextTheme(
                                    bodyText2: TextStyle(color: AppColor.white),
                                  ),
                                ),
                                child: Form(
                                  key: _signupFormKey,
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              FocusScope.of(context)
                                                  .requestFocus(emailLogin);
                                              changeSize();
                                            },
                                            icon: const Icon(
                                                Icons.arrow_back_ios),
                                            color: AppColor.white,
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(15.0),
                                        child: Text(
                                          AppStrings.welcome,
                                          style: TextStyle(
                                              color: AppColor.white,
                                              fontSize: 35),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            AppStrings.username,
                                            style: TextStyle(
                                                color: AppColor.white,
                                                fontSize: 15),
                                          ),
                                        ],
                                      ),
                                      TextFormField(
                                        controller: _username,
                                        focusNode: unameSignup,
                                        keyboardType: TextInputType.name,
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        onFieldSubmitted: (value) {
                                          FocusScope.of(context)
                                              .requestFocus(passwordSignup);
                                        },
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return AppStrings
                                                .enterValidUsername;
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          hintText: AppStrings.username,
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: AppColor.white),
                                          ),
                                          hintStyle: TextStyle(
                                              color: AppColor.greyLight),
                                        ),
                                        style: TextStyle(color: AppColor.white),
                                      ),
                                      const SizedBox(
                                        height: 50,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            AppStrings.password,
                                            style: TextStyle(
                                                color: AppColor.white,
                                                fontSize: 15),
                                          ),
                                        ],
                                      ),
                                      TextFormField(
                                        controller: _password,
                                        focusNode: passwordSignup,
                                        obscureText: visibilityPassword,
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        style: TextStyle(color: AppColor.white),
                                        onFieldSubmitted: (value) {
                                          FocusScope.of(context)
                                              .requestFocus(emailSignup);
                                        },
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return AppStrings
                                                .enterValidPassword;
                                          } else if (value.length < 8) {
                                            return AppStrings
                                                .enter8digitPassword;
                                          }
                                          return null;
                                        },
                                        decoration: InputDecoration(
                                          hintText: AppStrings.password,
                                          fillColor: AppColor.white,
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: AppColor.white),
                                          ),
                                          hintStyle: TextStyle(
                                              color: AppColor.greyLight),
                                          suffixIcon: IconButton(
                                            onPressed: _togglePassword,
                                            icon: const Icon(
                                                Icons.remove_red_eye),
                                            color: AppColor.white,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 50,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            AppStrings.email,
                                            style: TextStyle(
                                                color: AppColor.white,
                                                fontSize: 15),
                                          ),
                                        ],
                                      ),
                                      TextFormField(
                                        controller: _email,
                                        focusNode: emailSignup,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        style: TextStyle(color: AppColor.white),
                                        onFieldSubmitted: (value) {
                                          FocusScope.of(context)
                                              .requestFocus(contactSignup);
                                        },
                                        validator: _validateEmail,
                                        decoration: InputDecoration(
                                          hintText: AppStrings.enterEmail,
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: AppColor.white),
                                          ),
                                          hintStyle: TextStyle(
                                              color: AppColor.greyLight),
                                        ),
                                      ),
                                      const SizedBox(height: 50),
                                      Row(
                                        children: [
                                          Text(
                                            AppStrings.contact,
                                            style: TextStyle(
                                                color: AppColor.greyLight,
                                                fontSize: 15),
                                          ),
                                        ],
                                      ),
                                      TextFormField(
                                        controller: _contact,
                                        focusNode: contactSignup,
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        keyboardType: TextInputType.phone,
                                        maxLines: 1,
                                        maxLength: 10,
                                        style: TextStyle(color: AppColor.white),
                                        maxLengthEnforcement:
                                            MaxLengthEnforcement.enforced,
                                        onFieldSubmitted: (value) {
                                          FocusScope.of(context)
                                              .requestFocus(submitLogin);
                                        },
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return AppStrings.enterValidContact;
                                          } else if (value.length < 10) {
                                            return AppStrings.enterValidContact;
                                          } else {
                                            return null;
                                          }
                                        },
                                        decoration: InputDecoration(
                                          hintText: AppStrings.enterContact,
                                          enabledBorder: UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: AppColor.white),
                                          ),
                                          hintStyle: TextStyle(
                                              color: AppColor.greyLight),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                        margin: const EdgeInsets.all(20),
                                        width: double.infinity,
                                        height: 50,
                                        decoration: BoxDecoration(
                                          gradient: LinearGradient(
                                            colors: [
                                              AppColor.blueLight,
                                              AppColor.blue,
                                              AppColor.blueAccent,
                                              AppColor.purpleLight,
                                              AppColor.purpleDark
                                            ],
                                            begin: FractionalOffset.topLeft,
                                            end: FractionalOffset.bottomRight,
                                          ),
                                        ),
                                        child: TextButton(
                                          child: Text(
                                            AppStrings.submit,
                                            style: TextStyle(
                                                color: AppColor.white),
                                          ),
                                          onPressed: () {
                                            if (_signupFormKey.currentState!
                                                .validate()) {
                                              print(AppStrings.successful);
                                            }
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Expanded(
                child: AnimatedContainer(
                  margin: EdgeInsets.fromLTRB(0, h3, 0, 0),
                  constraints: const BoxConstraints.expand(),
                  decoration: BoxDecoration(
                    color: AppColor.transparent,
                  ),
                  duration: const Duration(milliseconds: 500),
                  child: SingleChildScrollView(
                    physics: const NeverScrollableScrollPhysics(),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        children: [
                          SingleChildScrollView(
                            child: SizedBox(
                              height: 50,
                              child: CustomPaint(
                                painter:
                                    DrawCurve(backgroundColor: AppColor.white),
                                size:
                                    Size(MediaQuery.of(context).size.width, 50),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              constraints: const BoxConstraints.expand(),
                              decoration: BoxDecoration(color: AppColor.white),
                              child: SingleChildScrollView(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(20, 30, 20, 0),
                                  child: Form(
                                    key: _loginFormKey,
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text(AppStrings.username),
                                          ],
                                        ),
                                        TextFormField(
                                          controller: _usernamelogin,
                                          focusNode: emailLogin,
                                          onFieldSubmitted: (value) {
                                            FocusScope.of(context)
                                                .requestFocus(passwordLogin);
                                          },
                                          validator: _validateEmail,
                                          decoration: InputDecoration(
                                            hintText: AppStrings.enterEmail,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 30,
                                        ),
                                        Row(
                                          children: [
                                            Text(AppStrings.password),
                                          ],
                                        ),
                                        TextFormField(
                                          controller: _passwordlogin,
                                          focusNode: passwordLogin,
                                          obscureText: visibilityPassSignup,
                                          autovalidateMode:
                                              AutovalidateMode.disabled,
                                          onFieldSubmitted: (value) {
                                            FocusScope.of(context)
                                                .requestFocus(submitLogin);
                                          },
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return AppStrings
                                                  .enterValidPassword;
                                            } else if (value.length < 8) {
                                              return AppStrings
                                                  .enter8digitPassword;
                                            }
                                            return null;
                                          },
                                          decoration: InputDecoration(
                                            hintText: AppStrings.enterPassword,
                                            suffixIcon: IconButton(
                                              onPressed: _togglePasswordSignUp,
                                              icon: const Icon(
                                                  Icons.remove_red_eye),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.all(20),
                                          width: double.infinity,
                                          height: 50,
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                AppColor.blueLight,
                                                AppColor.blue,
                                                AppColor.blueAccent,
                                                AppColor.purpleLight,
                                                AppColor.purpleDark
                                              ],
                                              begin: FractionalOffset.topLeft,
                                              end: FractionalOffset.bottomRight,
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: AppColor.purpleLight,
                                                blurRadius: 10,
                                                spreadRadius: 0.1,
                                                offset: const Offset(0, 3),
                                              ),
                                            ],
                                          ),
                                          child: TextButton(
                                            child: Text(
                                              AppStrings.login,
                                              style: TextStyle(
                                                  color: AppColor.white),
                                            ),
                                            onPressed: () {
                                              if (_loginFormKey.currentState!
                                                  .validate()) {
                                                print(AppStrings.successful);
                                              }
                                            },
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            GestureDetector(
                                              onTap: () {},
                                              child: Text(
                                                AppStrings.forgetPassword,
                                                style: TextStyle(
                                                    color: AppColor.greyLight),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox.expand(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: displayText
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(AppStrings.donthaveaccount),
                              GestureDetector(
                                onTap: () {
                                  FocusScope.of(context)
                                      .requestFocus(unameSignup);
                                  changeSize();
                                },
                                child: Text(
                                  AppStrings.signup,
                                  style: TextStyle(color: AppColor.blueDark),
                                ),
                              ),
                            ],
                          )
                        : null)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
