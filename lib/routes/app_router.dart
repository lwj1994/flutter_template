import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shoubox/feature/main/page.dart';
import 'package:shoubox/feature/main/splash_page.dart';
import 'package:url_launcher/url_launcher_string.dart';


part 'app_router.gr.dart';

final appRouter = AppRouter();

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
)
// extend the generated private router
class AppRouter extends _$AppRouter {
  // RouteType.custom(
  // transitionsBuilder: TransitionsBuilders.slideLeft,
  // durationInMilliseconds: 200,
  // reverseDurationInMilliseconds: 200);
  @override
  RouteType get defaultRouteType => const RouteType.cupertino();

  @override
  final List<AutoRoute> routes = [
    CustomRoute(
        page: SplashRoute.page,
        path: '/',
        transitionsBuilder: TransitionsBuilders.noTransition),
    CustomRoute(
        path: "/main",
        page: MainRoute.page,
        transitionsBuilder: TransitionsBuilders.noTransition),

  ];
}

extension RouterExtensions on StackRouter {
  pushSingleTop(PageRouteInfo<dynamic> route) {
    if (current.route.name == route.routeName) {
      replace(route);
    } else {
      push(route);
    }
  }



  // popToMain() {
  //   popUntil((route) {
  //     return route.settings.name == AppMainRoute.name;
  //   });
  // }
  //
  // void popToTokenDetail() {
  //   popUntil((route) {
  //     return route.settings.name == TokenDetailRoute.name;
  //   });
  // }
  //
  // Future<void> popToMainThenPush(PageRouteInfo routeInfo) async {
  //   await pushAndPopUntil(routeInfo, predicate: (route) {
  //     return route.settings.name == AppMainRoute.name;
  //   });
  // }
}


class AppRouterObserver extends AutoRouterObserver {
  static const String tag = "AppRouterObserver";

  @override
  Future<void> didPush(
      Route<dynamic> route, Route<dynamic>? previousRoute) async {
    if (appRouter.current.path == "/") {
      return;
    }
    if (route.settings.name?.isNotEmpty == true) {
      debugPrint(
          '$tag New route pushed: ${route.settings.name} from (${previousRoute?.settings.name}), current： ${appRouter.current.path} ${appRouter.currentUrl}');
    }
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    if (route.settings.name?.isNotEmpty == true) {
      // pop 之后防止 loading 错误的显示
      debugPrint(
          '$tag New route didPop: from ${route.settings.name} popTo (${previousRoute?.settings.name}), ${appRouter.current.path}, ${appRouter.currentUrl}');
    }
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    debugPrint(
        '$tag New route didRemove: ${route.settings.name} from (${previousRoute?.settings.name})');
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    debugPrint(
        '$tag New route didReplace: ${newRoute?.settings.name} from (${oldRoute?.settings.name})');
  }

  @override
  void didStartUserGesture(Route route, Route? previousRoute) {
    debugPrint(
        '$tag New route didStartUserGesture: ${route.settings.name} from (${previousRoute?.settings.name})');
  }

  @override
  void didStopUserGesture() {
    debugPrint('didStopUserGesture');
  }

  // only override to observer tab routes
  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    debugPrint('Tab route visited: ${route.name}');
  }

  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    debugPrint('Tab route re-visited: ${route.name}');
  }
}

