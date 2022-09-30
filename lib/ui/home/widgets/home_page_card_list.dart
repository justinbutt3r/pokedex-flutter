import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

import '../../../core/models/home_page_obejct.dart';

class HomePageCardList extends StatelessWidget {
  const HomePageCardList(this.list, {Key? key}) : super(key: key);

  final List<ChildLinkObject> list;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        final ChildLinkObject item = list[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 8.0),
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                item.path,
              );
            },
            child: Container(
              width: double.infinity,
              height: 70.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Theme.of(context).backgroundColor,
                image: DecorationImage(
                  image: Svg(
                    'assets/images/pokeball.svg',
                    color: Theme.of(context).primaryColor,
                    size: const Size(50, 50),
                  ),
                  opacity: 0.3,
                  alignment: const Alignment(-0.9, -0.5),
                ),
              ),
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.bottomRight,
              child: Text(
                item.label,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
        );
      },
      itemCount: list.length,
    );
  }
}
