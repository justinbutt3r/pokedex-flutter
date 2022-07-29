import 'package:flutter/material.dart';

import '../../../utils/theme.dart';
import 'range_selector.dart';
import 'search_bar.dart';
import 'type_filter.dart';

class FilterDrawer extends StatefulWidget {
  const FilterDrawer({Key? key}) : super(key: key);

  @override
  State<FilterDrawer> createState() => _FilterDrawerState();
}

class _FilterDrawerState extends State<FilterDrawer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Drawer(
        elevation: 20.0,
        child: SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SizedBox(
                  height: 50,
                  child: DrawerHeader(
                    padding: EdgeInsets.zero,
                    child: Text(
                      'Filters',
                      style: largeTextStyle,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      const ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: SearchBar(),
                      ),
                      const ListTile(
                        contentPadding: EdgeInsets.zero,
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Types',
                              style: resultTextStyle,
                            ),
                            SizedBox(
                              height: sizeBetween,
                            ),
                            TypeFilter(),
                          ],
                        ),
                      ),
                      // Gender ,
                      // weight range
                      const ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: RangeSelector(
                          label: 'Weight',
                          max: 1000,
                        ),
                      ),
                      // height range
                      const ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: RangeSelector(
                          label: 'Height',
                          max: 100,
                        ),
                      ),
                      // Overall stats,
                      const ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: RangeSelector(
                          label: 'Overall',
                          min: 170,
                          max: 1130,
                        ),
                      ),
                      // Ability
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 70.0,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
