import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:login_page2/components/app_elevent_button.dart';
import 'package:login_page2/components/app_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});
  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  List<Color> colors = [Colors.red, Colors.yellow, Colors.blue];
  List<String> colorName = ["R", "Y", "B"];
  late Color selectedColor;
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    selectedColor = colors[0];
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () => showDialog<void>(
              context: context,
              barrierDismissible: false, // user must tap button!
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Menu '),
                  content: const SingleChildScrollView(
                    child: ListBody(
                      children: <Widget>[
                        Text('Hi! I am Menu'),
                      ],
                    ),
                  ),
                  actions: <Widget>[
                    AppEleventButton(
                      onPressed: () => Navigator.pop(context),
                      height: 38.0,
                      text: 'YES',
                    ),
                  ],
                );
              },
            ),
            child: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
          ),
          title: Text(widget.title),
          actions: List.generate(
              colors.length,
              (index) => GestureDetector(
                    onTap: () => setState(() {
                      selectedColor = colors[index];
                    }),
                    behavior: HitTestBehavior.translucent,
                    child: Padding(
                      padding: const EdgeInsets.all(4.6).copyWith(
                          right: index == colors.length - 1 ? 12.6 : 4.6),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 12.0,
                        child: Text(
                          colorName[index],
                          style: TextStyle(color: colors[index]),
                        ),
                      ),
                    ),
                  )),
        ),
        body: Stack(
          children: [
            Positioned.fill(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 40.0, top: 40.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Sign In',
                        style: TextStyle(color: selectedColor, fontSize: 20.0),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: AppTextField(
                          controller: userNameController,
                          hintText: 'userName',
                          prefixIcon: Icon(Icons.person),
                          textInputAction: TextInputAction.next,
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: AppTextField(
                          controller: passwordController,
                          hintText: 'Password',
                          prefixIcon: Icon(Icons.password),
                          isPassWord: true,
                          textInputAction: TextInputAction.done,
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      FractionallySizedBox(
                        widthFactor: 0.4,
                        child: AppEleventButton(
                          onPressed: () {
                            //gán biến để kiểm tra đúng sai của usẻ và pass word
                            bool isChecked =
                                userNameController.text.trim().isNotEmpty &&
                                    passwordController.text.isNotEmpty;

                            return showDialog<void>(
                              context: context,
                              barrierDismissible:
                                  false, // user must tap button!
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text(isChecked ? '😍' : '😐'),
                                  content: SingleChildScrollView(
                                    child: !isChecked
                                        ? const ListBody(
                                            children: <Widget>[
                                              Text(
                                                'Please enter username and password 💋',
                                                style: TextStyle(
                                                    color: Colors.brown,
                                                    fontSize: 20.0),
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          )
                                        : ListBody(
                                            children: <Widget>[
                                              Text(
                                                'Username: ${userNameController.text.trim()}',
                                                style: const TextStyle(
                                                    color: Colors.brown,
                                                    fontSize: 18.0),
                                              ),
                                              Text(
                                                'Password: ${passwordController.text}',
                                                style: const TextStyle(
                                                    color: Colors.brown,
                                                    fontSize: 18.0),
                                              ),
                                            ],
                                          ),
                                  ),
                                  actions: <Widget>[
                                    AppEleventButton(
                                      onPressed: () => Navigator.pop(context),
                                      height: 38.0,
                                      text: 'YES',
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          text: "Sign In",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 20.0,
              right: 20.0,
              bottom: 20.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Previous',
                    style: TextStyle(color: Colors.blue, fontSize: 18.0),
                  ),
                  Text(
                    'Next',
                    style: TextStyle(color: Colors.blue, fontSize: 18.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
