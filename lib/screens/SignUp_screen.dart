import 'package:flutter/material.dart';
import 'package:http/http.dart' ;

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

void login(String email, password)async{
  try{
    Response response = await post(
        Uri.parse('https://reqres.in/api/register'),
        body: {
          'email' : email,
          'password' : password,
        }
    );
    if(response.statusCode == 200){
      print('account created successfully');
    }else{
      print('failed');
  }
  }catch(e){
    print(e.toString());
  }
}
class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'Email',
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 20,),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: 'Password',
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 40,),
            InkWell(
              onTap: () {
                login(emailController.text.toString(),
                    passwordController.text.toString());
              },
              child: Container(
                color: Colors.cyan,
                width: double.infinity,
                height: 50,
                child: Center(
                  child: Text('Sign Up', style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black
                  ),),
                ),

              ),
            ),
          ],
        ),
      ),
    );
  }

}