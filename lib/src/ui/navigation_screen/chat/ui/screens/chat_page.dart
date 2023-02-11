import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:project/generated/l10n.dart';
import 'package:project/src/network/local/cache-helper.dart';
import 'package:project/src/ui/Shared/constant.dart';
import 'package:project/src/ui/components/appar.dart';
import 'package:project/src/ui/navigation_screen/chat/constants/firestore_constants.dart';
import 'package:project/src/ui/navigation_screen/chat/constants/size_constants.dart';
import 'package:project/src/ui/navigation_screen/chat/model/chat_messages.dart';
import 'package:project/src/ui/navigation_screen/chat/repo/chat_provider.dart';
import 'package:project/src/ui/navigation_screen/chat/ui/screens/full_image_view.dart';
import 'package:project/src/ui/navigation_screen/chat/ui/widget/common_widgets.dart';
import 'package:project/src/ui/widgets/widgets.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatefulWidget {
  final String peerId;
  final String peerNickname;

  const ChatPage({Key? key, required this.peerNickname, required this.peerId})
      : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}//01016118790

class _ChatPageState extends State<ChatPage> {
  late String currentUserId;

  List<QueryDocumentSnapshot> listMessages = [];

  int _limit = 20;
  final int _limitIncrement = 20;
  String groupChatId = '';

  File? imageFile;
  bool isLoading = false;
  bool isShowSticker = false;
  String imageUrl = '';

  final TextEditingController textEditingController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  final FocusNode focusNode = FocusNode();

  late ChatProvider chatProvider;

  @override
  void initState() {
    super.initState();
    chatProvider = context.read<ChatProvider>();

    focusNode.addListener(onFocusChanged);
    scrollController.addListener(_scrollListener);
    readLocal();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWidget(label: S.current.chat),
        body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: Sizes.dimen_8),
                child: Column(
                    children: [buildListMessage(), buildMessageInput()]))));
  }

  Widget buildMessageInput() {
    return Container(
        width: double.infinity,
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(children: [
          Flexible(
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: textFieldColor)),
                  child: TextField(
                      focusNode: focusNode,
                      textInputAction: TextInputAction.send,
                      keyboardType: TextInputType.text,
                      textCapitalization: TextCapitalization.sentences,
                      controller: textEditingController,
                      maxLines: null,
                      onSubmitted: (value) {
                        onSendMessage(
                            textEditingController.text, MessageType.text);
                      },
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'أدخل رسالتك',
                          prefixIcon: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                IconButton(
                                    icon: const Icon(Icons.send,
                                        color: button1color),
                                    onPressed: () {
                                      onSendMessage(textEditingController.text,
                                          MessageType.text);
                                    }),
                                IconButton(
                                    icon: const Icon(Icons.attach_file,
                                        color: button1color),
                                    onPressed: () => getImage())
                              ]))))),
        ]));
  }

  Widget buildItem(int index, DocumentSnapshot? documentSnapshot) {
    if (documentSnapshot != null) {
      ChatMessages chatMessages = ChatMessages.fromDocument(documentSnapshot);
      if (chatMessages.idFrom == currentUserId) {
        // right side (my message)
        return Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            chatMessages.type == MessageType.text
                ? messageBubble(
                    chatContent: chatMessages.content,
                    color: button1color,
                    textColor: Colors.white)
                : chatMessages.type == MessageType.image
                    ? Container(
                        margin: const EdgeInsets.only(
                            right: Sizes.dimen_10,
                            top: Sizes.dimen_8,
                            bottom: Sizes.dimen_8),
                        child: chatImage(
                            imageSrc: chatMessages.content,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FullImageView(
                                            url: chatMessages.content,
                                          )));
                            }))
                    : const SizedBox.shrink(),
            isMessageSent(index)
                ? Image.asset('assets/icons/chat/chat_ic.png',
                    height: 35, width: 35)
                : Container(width: 35)
          ]),
          isMessageSent(index)
              ? Container(
                  margin: const EdgeInsets.only(
                      right: Sizes.dimen_50,
                      top: Sizes.dimen_6,
                      bottom: Sizes.dimen_8),
                  child: Text(
                      DateFormat('dd MMM yyyy, hh:mm a').format(
                          DateTime.fromMillisecondsSinceEpoch(
                              int.parse(chatMessages.timestamp))),
                      style: const TextStyle(
                          color: textColor,
                          fontSize: Sizes.dimen_12,
                          fontStyle: FontStyle.italic)))
              : const SizedBox.shrink()
        ]);
      } else {
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            isMessageReceived(index)
                ? Image.asset('assets/icons/chat/chat_ic.png',
                    height: 35, width: 35)
                : Container(width: 35),
            chatMessages.type == MessageType.text
                ? messageBubble(
                    color: textColor,
                    textColor: Colors.white,
                    chatContent: chatMessages.content)
                : chatMessages.type == MessageType.image
                    ? Container(
                        margin: const EdgeInsets.only(
                            left: Sizes.dimen_10,
                            top: Sizes.dimen_8,
                            bottom: Sizes.dimen_8),
                        child: chatImage(
                            imageSrc: chatMessages.content,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => FullImageView(
                                            url: chatMessages.content,
                                          )));
                            }))
                    : const SizedBox.shrink()
          ]),
          isMessageReceived(index)
              ? Container(
                  margin: const EdgeInsets.only(
                      left: Sizes.dimen_50,
                      top: Sizes.dimen_6,
                      bottom: Sizes.dimen_8),
                  child: Text(
                      DateFormat('dd MMM yyyy, hh:mm a').format(
                          DateTime.fromMillisecondsSinceEpoch(
                              int.parse(chatMessages.timestamp))),
                      style: const TextStyle(
                          color: textColor,
                          fontSize: Sizes.dimen_12,
                          fontStyle: FontStyle.italic)))
              : const SizedBox.shrink()
        ]);
      }
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget buildListMessage() {
    return Flexible(
        child: groupChatId.isNotEmpty
            ? StreamBuilder<QuerySnapshot>(
                stream: chatProvider.getChatMessage(groupChatId, _limit),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData) {
                    listMessages = snapshot.data!.docs;
                    if (listMessages.isNotEmpty) {
                      return ListView.separated(
                          padding: const EdgeInsets.all(10),
                          itemCount: snapshot.data!.docs.length,
                          reverse: true,
                          controller: scrollController,
                          itemBuilder: (context, index) =>
                              buildItem(index, snapshot.data?.docs[index]),
                          separatorBuilder: (BuildContext context, int index) =>
                              const SizedBox(height: 2));
                    } else {
                      return const Center(child: Text('No messages...'));
                    }
                  } else {
                    return const Center(
                        child: CircularProgressIndicator(color: button2color));
                  }
                })
            : const Center(
                child: CircularProgressIndicator(color: button2color)));
  }

  _scrollListener() {
    if (scrollController.offset >= scrollController.position.maxScrollExtent &&
        !scrollController.position.outOfRange) {
      setState(() {
        _limit += _limitIncrement;
      });
    }
  }

  void onFocusChanged() {
    if (focusNode.hasFocus) {
      setState(() {
        isShowSticker = false;
      });
    }
  }

  void readLocal() async{
    currentUserId = await CacheHelper.getData(key: 'userId');

    if (currentUserId.compareTo(widget.peerId) > 0) {
      groupChatId = '$currentUserId - ${widget.peerId}';
    } else {
      groupChatId = '${widget.peerId} - $currentUserId';
    }
    setState(() {

    });
  }

  void getSticker() {
    focusNode.unfocus();
    setState(() {
      isShowSticker = !isShowSticker;
    });
  }

  Future<bool> onBackPressed() {
    if (isShowSticker) {
      setState(() {
        isShowSticker = false;
      });
    } else {
      chatProvider.updateFirestoreData(FirestoreConstants.pathUserCollection,
          currentUserId, {FirestoreConstants.chattingWith: null});
    }
    return Future.value(false);
  }

  void onSendMessage(String content, int type) {
    if (content.trim().isNotEmpty) {
      textEditingController.clear();
      chatProvider.sendChatMessage(
          content, type, groupChatId, currentUserId, widget.peerId);
      scrollController.animateTo(0,
          duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
    } else {
      showSnackBar(title: 'Nothing to send');
    }
  }

  // checking if received message
  bool isMessageReceived(int index) {
    if ((index > 0 &&
            listMessages[index - 1].get(FirestoreConstants.idFrom) ==
                currentUserId) ||
        index == 0) {
      return true;
    } else {
      return false;
    }
  }

  // checking if sent message
  bool isMessageSent(int index) {
    if ((index > 0 &&
            listMessages[index - 1].get(FirestoreConstants.idFrom) !=
                currentUserId) ||
        index == 0) {
      return true;
    } else {
      return false;
    }
  }

  Future getImage() async {
    ImagePicker imagePicker = ImagePicker();
    XFile? pickedFile;
    pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      if (imageFile != null) {
        setState(() {
          isLoading = true;
        });
        uploadImageFile();
      }
    }
  }

  void uploadImageFile() async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    UploadTask uploadTask = chatProvider.uploadImageFile(imageFile!, fileName);
    try {
      TaskSnapshot snapshot = await uploadTask;
      imageUrl = await snapshot.ref.getDownloadURL();
      setState(() {
        isLoading = false;
        onSendMessage(imageUrl, MessageType.image);
      });
    } on FirebaseException catch (e) {
      setState(() {
        isLoading = false;
      });
      showSnackBar(title: e.message ?? e.toString());
    }
  }
}
