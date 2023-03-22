import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:one_signal_flutter/services/chat_services.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  final _textController = TextEditingController();
  final _focusNode = FocusNode();
  bool _isComposing = false;
  List allMessages = [];

  List<int> testList = [1, 2, 3];


  Future<void> sendMessage() async{
    final message = _textController.text.trim();
    setState(() {
      _textController.clear();
      _isComposing = true;
    });
    await ChatService.sendMessage('1', message);
  }

  Future<void> getData() async{
    CollectionReference _collectionRef =
    FirebaseFirestore.instance.collection('message');

    QuerySnapshot querySnapshot = await _collectionRef.get();

    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    allMessages = allData;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            tooltip: 'Sign out', onPressed: () {
              try{
                print('${testList[30]}');
              }catch(e, stack){
                FirebaseCrashlytics.instance.recordError(Exception('Crassh rồi'), stack, fatal: true);
              }
          },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(8.0),
              reverse: true,
              children: List.generate(
                allMessages.length,
                    (index) {
                  return Column(
                    crossAxisAlignment: allMessages[index]['senderId'] == '1'
                        ? CrossAxisAlignment.start
                        : CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text('Anonymous'),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(8.0),
                            topRight: const Radius.circular(8.0),
                            bottomLeft: Radius.circular(
                                allMessages[index]['senderId'] =='1'
                                    ? 8.0
                                    : 0.0),
                            bottomRight: Radius.circular(
                                allMessages[index]['senderId'] =='1'
                                    ? 0.0
                                    : 8.0),
                          ),
                        ),
                        color: allMessages[index]['senderId'] == '1'
                            ? Colors.blue
                            : Colors.blueGrey,
                        elevation: 0.0,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            allMessages[index]['message'],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18.0,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 4.0),
                    ],
                  );
                },
              ),
            ),
          ),
          const Divider(),
          _chatWidget(),
        ],
      ),
    );
  }


  // edittext chat widget
  Widget _chatWidget(){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: _textController,
              focusNode: _focusNode,
              decoration: const InputDecoration.collapsed(
                hintText: 'Your message here...',
              ),
              onChanged: (value) {
                setState(() {
                  _isComposing = value.isNotEmpty;
                });
              },
            ),
          ),
          IconButton(
            onPressed: (){
              try{
                testList.add(int.parse('ThaoATT'));
              }catch(e, stack){
                FirebaseCrashlytics.instance.recordError(e, stack, fatal: true);
              }
            },
            icon: const Icon(Icons.send),
            color: Colors.blue,
          ),
        ],
      ),
    );
  }
}
