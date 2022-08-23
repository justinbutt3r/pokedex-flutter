import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:provider/provider.dart';

import '../../../core/models/home_page_obejct.dart';
import '../../../core/services/theme_manager.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();
    final ThemeNotifier themeProvider = Provider.of<ThemeNotifier>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
            top: 50.0, left: 32.0, right: 32.0, bottom: 10.0),
        child: Column(
          children: [
            Center(
              child: InkWell(
                onTap: () {
                  themeProvider.toggleThemeMode();
                },
                child: Text(
                  'Pokedex',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ),
            ),
            const SizedBox(
              height: 32.0,
            ),
            Expanded(
              child: FadingEdgeScrollView.fromScrollView(
                child: ListView(
                  controller: controller,
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  children: data
                      .map(
                        (item) => Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.title,
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            ...item.children
                                .map(
                                  (e) => InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                        context,
                                        e.path,
                                      );
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      height: 70.0,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        color:
                                            Theme.of(context).backgroundColor,
                                        image: DecorationImage(
                                          image: Svg(
                                            'assets/images/pokeball.svg',
                                            color:
                                                Theme.of(context).primaryColor,
                                            size: const Size(50, 50),
                                          ),
                                          opacity: 0.3,
                                          alignment:
                                              const Alignment(-0.9, -0.5),
                                        ),
                                      ),
                                      padding: const EdgeInsets.all(8.0),
                                      margin:
                                          const EdgeInsets.only(bottom: 8.0),
                                      alignment: Alignment.bottomRight,
                                      child: Text(
                                        e.label,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          ],
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<HomePageObject> data = [
  HomePageObject(
    title: 'Pokemon',
    children: [
      ChildLinkObject(label: 'Generation', path: '/pokemon/gen'),
      ChildLinkObject(label: 'Types', path: '/pokemon/type'),
      ChildLinkObject(label: 'Mythical', path: '/pokemon/mythical'),
      ChildLinkObject(label: 'Legendary', path: '/pokemon/legendary'),
    ],
  ),
  HomePageObject(
    title: 'Moves',
    children: [
      ChildLinkObject(label: 'All', path: '/moves/list'),
      ChildLinkObject(label: 'Types', path: '/moves/type'),
      ChildLinkObject(label: 'Physical', path: '/moves/physical'),
      ChildLinkObject(label: 'Special', path: '/moves/special'),
      ChildLinkObject(label: 'Status', path: '/moves/status'),
      ChildLinkObject(label: 'Effects', path: '/moves/effect'),
    ],
  ),
  HomePageObject(
    title: 'Abilities',
    children: [
      ChildLinkObject(label: 'All', path: '/abilities/all'),
    ],
  ),
];
