import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'index.dart';

const appName = 'Lumpime Tracker';

const filmRoutePrefix = 'anime';

final navigatorKey = GlobalKey<NavigatorState>();

class App extends HookConsumerWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: appName,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: Layout(
        topBar: const TopBar(),
        navBar: const NavBar(),
        page: Navigator(
          key: navigatorKey,
          initialRoute: '/',
          onGenerateRoute: (settings) {
            if (settings.name == '/' || settings.name == null) {
              return MyPageRoute(
                builder: (context) => const QueryPage(),
              );
            }

            final uri = Uri.parse(settings.name!);

            if (uri.pathSegments.length == 1) {
              return MyPageRoute(
                builder: (context) => FilmListPage(uri.pathSegments[0]),
              );
            }
          },
        ),
      ),
    );
  }
}
