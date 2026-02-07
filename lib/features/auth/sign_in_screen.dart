import 'package:flutter/material.dart';
import 'package:news_app/core/datasource/local_data/preferences_manager.dart';
import 'package:news_app/core/theme/light_color.dart';
import 'package:news_app/core/widgts/custom_text_field.dart';
import 'package:news_app/features/auth/signup_screen.dart';
import 'package:news_app/features/home/home_screen.dart';
import 'package:news_app/features/main/main_screen.dart';

class LoginScreen extends StatefulWidget {
    LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
String? errorMessage;
 bool isLoading = false;

 void login() async{
  final email = PreferencesManager().getString('user_email');
  final password = PreferencesManager().getString('user_password');
  setState(() {
    errorMessage = null;
    isLoading = true;
  });
  if(email == null || password == null){
    setState(() {
      isLoading = false;
      errorMessage = 'Please sign up first';
    });
    return;
   }
 
  if(email != emailController.text || password != passwordController.text){
     setState(() {
      isLoading = false;
      errorMessage = 'Invalid email or password';
    });
    return;
  
  } 
    await PreferencesManager().setBool('is_logged_in', true);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) =>   MainScreen(),
      ),
    );
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
 
      body: Container(
        width: double.infinity,
        height: double.infinity,

        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background_image.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
           

              Center(child: Image.asset('assets/images/logo.png', height: 45)),
              SizedBox(height: 8),
              Text(
                'Welcome to Newst',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 24),
              CustomTextFormField(
                controller: emailController,
                hintText: 'Email',
                label: 'Email',
                validator: (value) {
                RegExp emailRegex = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$");
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                if (!emailRegex.hasMatch(value)) {
                  return 'Please enter a valid email';
                }else{
                  return null;
                }
                     },
              ),
              SizedBox(height: 24),
              CustomTextFormField(
                controller: passwordController,
                obscureText: true,
                hintText: 'Password',
                label: 'Password',
                validator: (value) {
                 if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                
                  return null;
                
                },
              ),
               if(errorMessage != null)
               Text(errorMessage!,style: TextStyle(color: Colors.red),),
              SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                 
                  onPressed: () {
                    if (_formKey.currentState?.validate()??false) {
                      login();
                     
                     }
                     
                  },
                  child: isLoading ? CircularProgressIndicator() : Text('Login'),
                ),
              ),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?",style: TextStyle(fontSize: 14),),
                  SizedBox(width: 4),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>   SignUpScreen(),
                        ),
                      );
                    },
                    child: Text('Sign Up',style: TextStyle(color:Theme.of(context).primaryColor,fontSize: 16),),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      )
    );
  }
}
