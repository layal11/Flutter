import 'package:flutter/material.dart';

class MainDarwer extends StatelessWidget {
  const MainDarwer({super.key, required this.onSelectDrawer});

  final void Function(String identifier) onSelectDrawer;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.pink[300],
      width: 304, //default 304
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Icon(
                  Icons.fastfood,
                  size: 40,
                  color: Theme.of(context).colorScheme.onBackground,
                ),
                const SizedBox(width: 20),
                Text(
                  'Cooking Up!',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.restaurant,
              size: 24,
              color: Theme.of(context).colorScheme.onBackground,
            ),
            title: Text(
              'All Meals',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            onTap: () => onSelectDrawer('meals'),
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              size: 24,
              color: Theme.of(context).colorScheme.onBackground,
            ),
            title: Text(
              'Filters',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            onTap: () => onSelectDrawer('filters'),
          ),
        ],
      ),
    );
  }
}
