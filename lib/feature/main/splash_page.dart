import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:lu_foundation/foundation.dart' as lu_foundation;
import 'package:temple/data/database.dart';
import 'package:temple/routes/app_router.dart';
import 'package:temple/theme/theme.dart';

/// @author luwenjie on 2023/9/14 00:10:16
///

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SplashPage();
  }
}

class _SplashPage extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.sync(() async {
      await lu_foundation.initialize();
      await DbManager.instance.initialize();
      await ThemeManager.instance.initialize();
      appRouter.replace(const MainRoute());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
      ),
    );
  }
}
