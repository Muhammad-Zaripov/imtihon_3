import 'package:flutter/material.dart';
import 'package:imtihon_3/viewmodels/user_viewmodel.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? error;
  String? errorP;

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/images/logo.png", width: 66, height: 66),
              SizedBox(height: 16),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Health",
                      style: TextStyle(fontSize: 20, color: Color(0xff6B7280)),
                    ),
                    TextSpan(
                      text: "Pal",
                      style: TextStyle(fontSize: 20, color: Color(0xff111928)),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Text(
                "Hi, Welcome Back!",
                style: TextStyle(
                  color: Color(0xff1C2A3A),
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Hope you’re doing fine.",
                style: TextStyle(fontSize: 14, color: Color(0xff6B7280)),
              ),
              SizedBox(height: 32),
              TextFormField(
                validator: (value) {
                  if (value == null) {
                    return "Iltimos email kiriting";
                  }
                  if (value.isEmpty) {
                    return "Iltimos email kiriting";
                  }
                  final emailRegExp = RegExp(
                    r"^[^@]+@[^@]+\.(com|uz|org|net|ru|io|edu|info|biz)$",
                  );
                  if (!emailRegExp.hasMatch(value)) {
                    return "email formati noto'g'ri";
                  }
                  return null;
                },
                controller: emailController,
                decoration: InputDecoration(
                  errorText: error,
                  prefixIcon: Icon(
                    Icons.email_outlined,
                    color: Color(0xff9CA3AF),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: "Your Email",
                  hintStyle: TextStyle(color: Color(0xff9CA3AF), fontSize: 14),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                obscureText: true,
                validator: (value) {
                  if (value == null) {
                    return "iltimos Parol kiriting";
                  }
                  if (value.isEmpty) {
                    return "iltimos Parol kiriting";
                  }
                  if (value.length < 6) {
                    return "kamida 6 ta belgi bo'lishi kerak";
                  }
                  return null;
                },
                controller: passwordController,
                decoration: InputDecoration(
                  errorText: errorP,
                  prefixIcon: Icon(
                    Icons.lock_outline,
                    color: Color(0xff9CA3AF),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: "Your Email",
                  hintStyle: TextStyle(color: Color(0xff9CA3AF), fontSize: 14),
                ),
              ),
              SizedBox(height: 20),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Color(0xff1C2A3A),
                  fixedSize: Size(342, 48),
                ),
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    error = await UserViewmodel().checkUser(
                      emailController.text,
                      passwordController.text,
                    );
                    setState(() {});
                    if (error == null && context.mounted) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Placeholder()),
                      );
                    }
                  }
                },
                child: Text(
                  "Sign In",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 23),
              Text(
                "or",
                style: TextStyle(
                  color: Color(0xff6B7280),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 23),
              InkWell(
                onTap: () {},
                child: Image.asset(
                  "assets/images/googleButton.png",
                  width: 342,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 16),
              InkWell(
                onTap: () {},
                child: Image.asset(
                  "assets/images/facebookButton.png",
                  width: 342,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 23),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Placeholder()),
                  );
                },
                child: Text(
                  "Forgot password?",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff1C64F2),
                  ),
                ),
              ),
              SizedBox(height: 23),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account yet? ",
                    style: TextStyle(fontSize: 14, color: Color(0xff6B7280)),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      "Sign up",
                      style: TextStyle(fontSize: 14, color: Color(0xff1C64F2)),
                    ),
                  ),
                ],
              ),
              // Sign up ga
            ],
          ),
        ),
      ),
    );
  }
}
