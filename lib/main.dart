import 'package:flutter/material.dart';
import 'package:project_work_atul/Pages/HomePage.dart';
import 'package:project_work_atul/Screens/splash.dart';
import 'package:project_work_atul/provider/appProvider.dart';
import 'package:project_work_atul/provider/userProvider.dart';
import './Pages/LoginPage.dart';
import 'package:provider/provider.dart';

//File Imports(Own Files)

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: UserProvider.initialize()),
          ChangeNotifierProvider.value(value: AppProvider())
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primaryColor: Colors.deepOrange,
          ),
          home: ScreensController(),
        )),
  );
}

class ScreensController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    switch (user.status) {
      case Status.Uninitialized:
        return Splash();
      case Status.Unauthenticated:
      case Status.Authenticating:
        return Login();
      case Status.Authenticated:
        return HomePage();
      default:
        return Login();
    }
  }
}
