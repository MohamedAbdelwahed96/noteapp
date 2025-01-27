import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/presentation/widgets/text_field_widget.dart';
import 'package:noteapp/logic/sign_in_bloc/cubit.dart';
import 'package:noteapp/logic/sign_in_bloc/state.dart';
import 'package:noteapp/presentation/screens/home_screen.dart';
import 'package:noteapp/presentation/screens/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(18, 3, 17, 1),
      body: SingleChildScrollView(
        child: BlocProvider(create: (context)=>SignInCubit(FirebaseAuth.instance),
          child: BlocConsumer<SignInCubit,SignInStates>(
            listener: (context,state){
              if(state is SignInSuccessState){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Logged in Successfully")));
                Navigator.push(context,MaterialPageRoute(builder: (context) => const HomeScreen()));
              }
              else if(state is SignInErrorState)
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.em)));
            },
            builder: (context,state){
              return Padding(
                padding: const EdgeInsets.only(left: 24,right: 24,top: 180),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text(
                        "Hi, Welcome Back!",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 24, color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 40),
                    const Text("Email",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Colors.white)),
                    const SizedBox(height: 10),
                    TextFieldWidget(controller: emailController, hinttext: "example@gmail.com"),
                    const SizedBox(height: 20),
                    const Text("Password",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Colors.white)),
                    const SizedBox(height: 10),
                    TextFieldWidget(controller: passController, hinttext: "Enter Your Password"),
                    const SizedBox(height: 80),
                    InkWell(
                      onTap: (){
                        final email = emailController.text;
                        final pass = passController.text;
                        context.read<SignInCubit>().SignIn(email, pass);
                      },
                      child: Container(
                        height: 48,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white
                        ),
                        child: const Center(child: Text("Login", style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600, color: Colors.black))),
                      ),
                    ),
                    const SizedBox(height: 150),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Don’t have an account ?", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600,fontSize: 16)),
                        TextButton(onPressed: (){Navigator.push(context,MaterialPageRoute(builder: (context) => const SignupScreen()));},
                            child: const Text("Sign Up", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600,fontSize: 16))),
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
