import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shoubox/data/database.dart';
import 'package:shoubox/routes/app_router.dart';
import 'package:shoubox/theme/theme.dart';
import 'package:wen_foundation/foundation.dart' as wen_foundation;

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
      await wen_foundation.initialize();
      await appDb.init();
      await appTheme.init();
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
