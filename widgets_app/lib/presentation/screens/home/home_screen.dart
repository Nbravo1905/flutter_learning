import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:widgets_app/config/menu/menu_item.dart';

import 'package:widgets_app/presentation/widgets/side_menu.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Widgets Varios'),
        centerTitle: true,
      ),
      body: const _HomeView(),
      drawer: SideMenu(scaffoldKey: scaffoldKey)
    );
  }
}

class _HomeView extends StatelessWidget {

  const _HomeView();

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      itemCount: appMenuItems.length,
      itemBuilder: (context, index) {
        final itemMenu = appMenuItems[index];

        return _CustomListTile(itemMenu: itemMenu);
      },
    );
  }
}

class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    required this.itemMenu,
  });

  final MenuItem itemMenu;

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;

    return ListTile(
      leading: Icon(itemMenu.icon, color: colors.primary),
      trailing: Icon( Icons.arrow_forward_ios, color: colors.primary),
      title: Text(itemMenu.title),
      subtitle: Text(itemMenu.subTitle),
      onTap: () {
        
        context.push( itemMenu.link );

      },
    );
  }
}