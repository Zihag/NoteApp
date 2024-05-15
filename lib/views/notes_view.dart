import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mynotes/constants/routes.dart';
import 'package:mynotes/enums/nemu_action.dart';
import 'package:mynotes/main.dart';

class NotesView extends StatefulWidget {
  const NotesView({super.key});

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Main UI'), actions: [
        PopupMenuButton<MenuAction>(
          onSelected: (value) async{
            switch(value){
              
              case MenuAction.logout:
                final shouldLogout = await showLogOutDialog(context);
                if (shouldLogout){
                  await FirebaseAuth.instance.signOut();
                  Navigator.of(context).pushNamedAndRemoveUntil(loginRoute, (_) => false);
                }
            }
          },
          itemBuilder: (context) {
            return const [
              PopupMenuItem<MenuAction>(
                value: MenuAction.logout,
                child: Text('Log out'),
              ),
            ];
          },
        )
      ]),
      body: const Text('Hello world'),
    );
  }
}