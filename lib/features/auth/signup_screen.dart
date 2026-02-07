import 'package:flutter/material.dart';
import 'package:news_app/core/datasource/local_data/preferences_manager.dart';
import 'package:news_app/core/widgts/custom_text_field.dart';
import 'package:news_app/features/auth/sign_in_screen.dart';
import 'package:news_app/features/home/home_screen.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController =
      TextEditingController();
      String? errorMessage;
      bool isLoading = false;

  void register() async {
    setState(() {
        errorMessage =null;
      isLoading = true;
    });
   final savedEmail = PreferencesManager().getString('user_email');
   if(savedEmail!=null &&  savedEmail== emailController.text.trim()){
       setState(() {
         errorMessage = 'Email already exists';
         isLoading = false;

   });
   }else{
   await PreferencesManager().setString('user_email', emailController.text.trim());
    await PreferencesManager().setString('user_password', passwordController.text.trim());
    await PreferencesManager().setBool('is_logged_in', true);

    setState(() {
      isLoading = false;
    });
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) =>   LoginScreen(),
      ),
    );
   }
   


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
                Center(
                  child: Image.asset('assets/images/logo.png', height: 45),
                ),
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
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
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
                SizedBox(height: 24),
                CustomTextFormField(
                  controller: confirmPasswordController,
                  hintText: 'confirm password',
                  label: 'confirm password',
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your confirm password';
                    }
                    if (value != passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                ),
                if (errorMessage != null)
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Text(errorMessage!,style: TextStyle(color: Colors.red),),
                 ),
                SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        return register();
                      }
                    },
                    child: isLoading ? CircularProgressIndicator() : Text('Sign Up'),
                  ),
                ),
                SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?",
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(width: 4),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
