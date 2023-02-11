import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:project/src/common/route_argument.dart';
import 'package:project/src/ui/navigation_screen/chat/repo/chat_provider.dart';
import 'package:project/src/ui/navigation_screen/chat/ui/screens/chat_page.dart';
import 'package:provider/provider.dart';

class ChatCycle extends StatefulWidget {
  static const routeName = "/ChatCycle";

  RouteArgument argument;

  ChatCycle({required this.argument});

  @override
  State<ChatCycle> createState() => _ChatCycleState();
}

class _ChatCycleState extends State<ChatCycle> {
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  late String peerId;
  String? peerName;
  String? fcmToken;
  List<String> data = [];

  @override
  void initState() {
    data = widget.argument.param;
    peerId = data[0];
    peerName = data[1];
    fcmToken = data[2];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      Provider<ChatProvider>(
          create: (_) => ChatProvider(
              firebaseFirestore: firebaseFirestore,
              firebaseStorage: firebaseStorage))
    ], child: ChatPage(peerNickname: peerName ?? "", peerId: peerId));
  }
}
