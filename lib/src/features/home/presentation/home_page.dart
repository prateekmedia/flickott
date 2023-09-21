import 'package:flickott/src/features/home/presentation/widgets/front_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flickott/init.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyHomePage extends StatefulHookConsumerWidget {
  const MyHomePage({super.key});

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.sizeOf(context).width > 800;
    final titles = useFuture(init());

    return Scaffold(
      appBar: isDesktop
          ? null
          : AppBar(
              centerTitle: true,
              elevation: 1,
              title: Text(
                "FOTT",
                style: TextStyle(
                  fontFamily: GoogleFonts.kanit().fontFamily,
                  color: Colors.red,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
            ),
      body: SafeArea(
        child: Row(
          children: [
            if (isDesktop)
              NavigationRail(
                elevation: 5,
                groupAlignment: -0.9,
                leading: Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(
                    "FOTT",
                    style: TextStyle(
                      fontFamily: GoogleFonts.kanit().fontFamily,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                      letterSpacing: 1.4,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                destinations: const [
                  NavigationRailDestination(
                    icon: Icon(Icons.home),
                    label: Text('Home'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.favorite),
                    label: Text('Favorites'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.extension),
                    label: Text('Extensions'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.settings),
                    label: Text('Settings'),
                  ),
                ],
                selectedIndex: 0,
                labelType: NavigationRailLabelType.all,
              ),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    FrontCarousel(),
                    const Text(
                      "We FLICK OTT, so you don't have to",
                    ),
                    // Use switch to render error and loading states
                    if (titles.data != null) Text(titles.data![0].title)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: isDesktop
          ? null
          : NavigationBar(
              selectedIndex: 0,
              onDestinationSelected: (index) {},
              destinations: const [
                NavigationDestination(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                NavigationDestination(
                  icon: Icon(Icons.favorite),
                  label: 'Favorites',
                ),
                NavigationDestination(
                  icon: Icon(Icons.extension),
                  label: 'Extensions',
                ),
                NavigationDestination(
                  icon: Icon(Icons.settings),
                  label: 'Settings',
                ),
              ],
            ),
    );
  }
}
