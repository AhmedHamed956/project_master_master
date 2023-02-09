import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project/src/network/local/cache-helper.dart';
import 'package:project/src/ui/Shared/constant.dart';
import 'package:project/src/ui/navigation_screen/chat/repo/auth_provider.dart';
import 'package:project/src/ui/navigation_screen/chat/repo/chat_provider.dart';
import 'package:project/src/ui/navigation_screen/chat/ui/screens/chat_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

class ChatCycle extends StatefulWidget {
  String peerName;
  String peerId;

  ChatCycle({required this.peerName, required this.peerId});

  @override
  State<ChatCycle> createState() => _ChatCycleState();
}

class _ChatCycleState extends State<ChatCycle> {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  SharedPreferences? prefs;

  @override
  void initState() {
    init();
    super.initState();
  }

  init() async {
    // userId = '116';
    userId = CacheHelper.getData(key: 'userId');
    // print('userId $userId');
    prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<AuthProvider>(
              create: (_) =>
                  AuthProvider(firebaseFirestore: firebaseFirestore)),
          Provider<ChatProvider>(
              create: (_) => ChatProvider(firebaseFirestore: firebaseFirestore))
        ],
        child: ChatPage(
            peerNickname: widget.peerName,
            peerAvatar: 'peerAvatar',
            peerId: widget.peerId,
            userAvatar: 'userAvatar'));
  }
}
