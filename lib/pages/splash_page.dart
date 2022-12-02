import 'package:flutter/material.dart';
import 'package:supabase_chat_app/constants.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _redirect();
  }

  Future<void> _redirect() async {
    await Future.delayed(Duration.zero);

    final session = supabase.auth.currentSession;
    if (session == null) {
      Navigator.of(context)
          .pushAndRemoveUntil(RegisterPage.route(), (route) => false);
    } else {
      Navigator.of(context)
          .pushAndRemoveUntil(ChatPage.route(), (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: preloader);
  }
}
