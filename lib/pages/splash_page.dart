import 'package:flutter/material.dart';
import 'package:supabase_chat_app/constants.dart';
import 'package:supabase_chat_app/pages/register_page.dart';
import 'package:supabase_chat_app/pages/rooms_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'chat_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    getInitialSession();
    super.initState();
  }

  Future<void> getInitialSession() async {
    await Future.delayed(Duration.zero);

    try {
      final session = await SupabaseAuth.instance.initialSession;
      if (session == null) {
        Navigator.of(context)
            .pushAndRemoveUntil(RegisterPage.route(), (_) => false);
      } else {
        Navigator.of(context)
            .pushAndRemoveUntil(RoomsPage.route(), (_) => false);
      }
    } catch (_) {
      context.showErrorSnackBar(
          message: 'Error occured during session refresh');
      Navigator.of(context)
          .pushAndRemoveUntil(RegisterPage.route(), (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: preloader);
  }
}
