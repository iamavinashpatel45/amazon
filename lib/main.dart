import 'package:amazon/constants/global_variables.dart';
import 'package:amazon/features/admin/widgets/bottombar_admin.dart';
import 'package:amazon/features/auth/screens/auth_screen.dart';
import 'package:amazon/providers/user_provider.dart';
import 'package:amazon/features/homescreen/widgets/bottombar_user.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'features/auth/services/auth_service.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => user_provider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final auth_service authservice = auth_service();
  bool route = false;

  init() async {
    route = await authservice.verifytoken(context);
    setState(() {});
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        "/maninscreen": (context) => const Bottomnavigatorbar_user(),
      },
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: global_variables.secondaryColor,
        ),
        scaffoldBackgroundColor: global_variables.backgroundColor,
      ),
      home: route
          ? Provider.of<user_provider>(context).user.token.isEmpty
              ? const auth_screen()
              : Provider.of<user_provider>(context).user.type == "user"
                  ? const Bottomnavigatorbar_user()
                  : const Bottomnavigatorbar_admin()
          : Scaffold(
              backgroundColor: global_variables.selectedNavBarColor,
              body: Center(
                child: LoadingAnimationWidget.dotsTriangle(
                  color: global_variables.secondaryColor,
                  size: 80,
                ),
              ),
            ),
    );
  }
}
