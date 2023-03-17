import 'package:cloud_firestore/cloud_firestore.dart';

class ChatService {
  static const String _collection = 'message';
  static final _fireStore = FirebaseFirestore.instance;

  static Future<void> sendMessage(String senderID, String message) async {
    await _fireStore.collection(_collection).add(
        {'senderID': senderID, 'message': message, 'time': DateTime.now().toString()});
  }

  static Future <List> messageStream() async{

    CollectionReference _collectionRef =
    FirebaseFirestore.instance.collection('message');

    QuerySnapshot querySnapshot = await _collectionRef.get();

    // Get data from docs and convert map to List
    final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    return allData;
  }
}
