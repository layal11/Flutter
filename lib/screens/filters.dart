import 'package:first_flutter_app/screens/tabs.dart';
import 'package:first_flutter_app/widgets/main_darwer.dart';
import 'package:flutter/material.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({super.key});

  @override
  State<FiltersScreen> createState() => _FiltersState();
}

class _FiltersState extends State<FiltersScreen> {
  bool toggleGlutenFree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      drawer: MainDarwer(
        onSelectDrawer: (identifier) {
          Navigator.of(context).pop();
          if (identifier == 'meals') {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => const TabsScreen(),
              ),
            );
          }
        },
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: toggleGlutenFree,
            onChanged: (value) => setState(() {
              toggleGlutenFree = value;
            }),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 17, right: 17),
            title: Text(
              'Gluten-free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            subtitle: Text(
              'Only includes gluten-free meals.',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
