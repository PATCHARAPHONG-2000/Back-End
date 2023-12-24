import 'package:back_end/servic/AuthService.dart';
import 'package:flutter/material.dart';

import 'Home.dart';
import 'UpDate/Knowledge_Link.dart';
import 'UpDate/Knowledge_news.dart';
import 'UpDate/Press_release.dart';
import 'UpDate/Toothache.dart';
import 'UpDate/careteeth.dart';
import 'UpDate/clinic.dart';

class DrawerPang extends StatelessWidget {
  const DrawerPang({super.key});

  @override
  Widget build(BuildContext context) {
    const drawerTextColor = TextStyle(
      color: Color(0xFF56078B),
    );
    return Drawer(
      width: MediaQuery.of(context).size.width *
          0.15, // กำหนดความกว้างของ Drawer เป็น 25% ของความกว้างหน้าจอ
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("image/Drawer.jpg"),
              ),
            ),
            child: null,
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return Home();
                  },
                ),
              );
            },
            leading: const Icon(Icons.home),
            title: Text(
              'H O M E',
              style: drawerTextColor,
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const Detel_clinic();
                  },
                ),
              );
            },
            leading: const Icon(Icons.edit),
            title: Text(
              'C L I N I C',
              style: drawerTextColor,
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const Knowledge_Link();
                  },
                ),
              );
            },
            leading: const Icon(Icons.edit),
            title: Text(
              'K N O W L E D G E  L I N K',
              style: drawerTextColor,
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const Knowledge_news();
                  },
                ),
              );
            },
            leading: const Icon(Icons.edit),
            title: Text(
              'K N O W L E D G E  N E W S',
              style: drawerTextColor,
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const Press_release();
                  },
                ),
              );
            },
            leading: const Icon(Icons.edit),
            title: Text(
              'P R E S S  R E L E A S E',
              style: drawerTextColor,
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const Toothache();
                  },
                ),
              );
            },
            leading: const Icon(Icons.edit),
            title: Text(
              'T O O T H A C H E',
              style: drawerTextColor,
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const Careteeth();
                  },
                ),
              );
            },
            leading: const Icon(Icons.edit),
            title: Text(
              'C A R E T E E T H',
              style: drawerTextColor,
            ),
          ),
          const SizedBox(
            height: 430,
          ),
          ListTile(
            onTap: () {
              AuthService().signOut();
            },
            leading: const Icon(Icons.logout),
            title: Text(
              'L O G O U T',
              style: drawerTextColor,
            ),
          ),
        ],
      ),
    );
  }
}
