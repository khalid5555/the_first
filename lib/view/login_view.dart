import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:the_first/admin/admin.dart';
import 'package:the_first/view/home_view.dart';
import 'package:the_first/view/singUp_view.dart';

import '../db/auth.dart';
import '../models/user_model.dart';
import '../shared/widgets/app_text_field.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  final GlobalKey<FormState> _keyform = GlobalKey<FormState>();
  late String _email, _password;

  LoginScreen({super.key});
  final _mauth = Auth();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height * .01;
    return Scaffold(
      body: Stack(
        children: [
          Image(
            height: height * 53,
            image: const AssetImage('assets/images/logo.gif'),
            fit: BoxFit.cover,
          ),
          Form(
            key: _keyform,
            child: ListView(
              children: [
                SizedBox(height: height * 50),
                AppTextField(
                  hint: 'ادخل الايميل',
                  icon: Icons.phone_android,
                  onClick: (val) {
                    _email = val!;
                  },
                ),
                const SizedBox(height: 20),
                AppTextField(
                  hint: 'أدخل الرقم السري',
                  icon: Icons.admin_panel_settings,
                  keytyp: TextInputType.number,
                  onClick: (val) {
                    _password = val!;
                  },
                ),
                SizedBox(height: height * 2),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 100),
                  child: Builder(
                    builder: (context) => MaterialButton(
                      padding: const EdgeInsets.only(top: 8, bottom: 8),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      color: Colors.black,
                      onPressed: newMethod,
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: height * 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Don\'t have account ?',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black38,
                      ),
                    ),
                    const SizedBox(width: 15),
                    GestureDetector(
                      onTap: () {
                        Get.off(
                          () => const SingUp(),
                          transition: Transition.size,
                          duration: const Duration(seconds: 1),
                        );
                      },
                      child: const Text(
                        'Singup',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                InkWell(
                  onTap: signUpGoogle,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.black,
                      ),
                      height: height * 7,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          Image(
                            image: AssetImage('assets/images/google.png'),
                            fit: BoxFit.cover,
                          ),
                          Text('  تسجيل الدخول بحساب',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20)),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void signUpGoogle() async {
    final res = await _mauth.signInWithGoogle();
    await _mauth.createUser(
      UserModel(
        id: res.user!.uid,
        name: res.user!.displayName ?? '',
        email: res.user!.email ?? '',
      ),
    );
    updatelogin();
    Get.toEnd((() => HomeView()));
    // Fluttertoast.showToast(msg: 'اهلا بيك ');
  }

  void newMethod() async {
    if (_keyform.currentState!.validate()) {
      try {
        _keyform.currentState!.save();

        final res = await _mauth.signIn(_email, _password);
        updatelogin();
        if (res.user!.uid == '9cCwmEojIderBAt420VaWpzHufS2' ||
            res.user!.uid == '285001kIAJg7nSzz8eyBFkdMxZL2') {
          // Fluttertoast.showToast(
          //     msg: 'اهلا بيك كلنا حوليك ');
          // Navigator.of(context)
          //     .pushReplacementNamed('admin.id');
          Get.off(() => const Admin());
        } else {
          Get.off(() => HomeView());
          // Navigator.of(context)
          //     .pushReplacementNamed('productshow.id');
          // Fluttertoast.showToast(msg: 'اهلا بيك ');
        }
      } catch (e) {
        // Fluttertoast.showToast(
        //     msg: e.toString(),
        //     toastLength: Toast.LENGTH_LONG);
      }
    }
  }

  void updatelogin() async {
    // SharedPreferences prfs = await SharedPreferences.getInstance();
    GetStorage prfs = GetStorage();
    prfs.write('login', true);
    prfs.write('seen', true);
  }
}

// Widget bottnbar(){
//   return  bottomNavigationBar :CurvedNavigationBar(
//           color: Colors.transparent,
//           backgroundColor: Colors.transparent,
//           buttonBackgroundColor: Colors.white,
//           height: 70.0,
//           items: <Widget>[
//             Icon(
//               Icons.home,
//               size: 40.0,
//               color: Colors.redAccent,
//             ),
//             Icon(
//               Icons.chat_bubble,
//               size: 40.0,
//               color: Colors.redAccent,
//             ),
//             Icon(
//               Icons.directions_bike,
//               size: 40.0,
//               color: Colors.redAccent,
//             ),
//             Icon(
//               Icons.location_on,
//               size: 30.0,
//               color: Colors.redAccent,
//             ),
//           ],
//         );
// }
