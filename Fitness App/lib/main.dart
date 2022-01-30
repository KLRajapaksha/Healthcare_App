import 'package:fitness_app/screens/age/binding/age_binding.dart';
import 'package:fitness_app/screens/age/view/age.dart';
import 'package:fitness_app/screens/gender/binding/gender_binding.dart';
import 'package:fitness_app/screens/gender/view/gender.dart';
import 'package:fitness_app/screens/height/view/height.dart';
import 'package:fitness_app/screens/home/binding/home_binding.dart';
import 'package:fitness_app/screens/home/view/home.dart';
import 'package:fitness_app/screens/selectgoal/view/selectgoal.dart';
import 'package:fitness_app/screens/weight/view/weight.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import 'screens/login/binding/login_binding.dart';
import 'screens/login/view/login.dart';
import 'screens/register/binding/register_binding.dart';
import 'screens/register/view/register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'My Fitness',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Lato'
      ),
      getPages: [
        GetPage(name: "/register", page: ()=>RegisterScreen(), binding: RegisterBinding()),
        GetPage(name: "/login", page: ()=>LoginScreen(), binding: LoginBinding()),
        GetPage(name: "/age", page: ()=>AgeScreen(), binding: AgeBinding()),
        GetPage(name: "/gender", page: ()=>GenderScreen(), binding: GenderBinding()),
        GetPage(name: "/height", page: ()=>HeightScreen()),
        GetPage(name: "/weight", page: ()=>WeightScreen()),
        GetPage(name: "/selectgoal", page: ()=>SelectGoalScreen()),
        GetPage(name: "/home", page: ()=>HomeScreen(), binding: HomeBinding()),
      ],
      initialRoute: "/login",
      builder: EasyLoading.init(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
