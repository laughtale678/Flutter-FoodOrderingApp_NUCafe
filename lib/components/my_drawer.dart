import 'package:flutter/material.dart';
import 'package:flutter_nu_cafe/components/my_drawer_tile.dart';
import 'package:flutter_nu_cafe/pages/settings_page.dart';
import 'package:flutter_nu_cafe/services/auth/auth_service.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logOut() {
    final authService = AuthService();
    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
            Padding(
              padding: const EdgeInsets.only(top: 100.0),
              child: Icon(
                Icons.coffee,
                size: 100,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Divider(
                color: Theme.of(context).colorScheme.secondary,
              )
            ),

            MyDrawerTile(
              text: 'H O M E',
              icon: Icons.home,
              onTap: () => Navigator.pop(context),
            ),

             MyDrawerTile(
              text: 'S E T T I N G S',
              icon: Icons.settings,
              onTap: (){
                Navigator.pop(context);
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) => const SettingsPage(),
                  ),
                );
              },
            ),

            const Spacer(),

             MyDrawerTile(
              text: 'L O G O U T',
              icon: Icons.logout,
              onTap: logOut,
            ),

            const SizedBox(height: 25),
        ],
        )

    );
  }
}