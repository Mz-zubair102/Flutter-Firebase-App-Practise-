import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../Models/post_model.dart';

class FirestoreDB {
  static CollectionReference  postRefrence =
  FirebaseFirestore.instance.collection("posts");
  static CollectionReference commentRefrence =
  FirebaseFirestore.instance.collection("comments");
  static CollectionReference userReference =
  FirebaseFirestore.instance.collection("users");

  static Future<bool> addUserProfile(
      {required Map<String, dynamic> data, required String uid}) async {
    User? user = FirebaseAuth.instance.currentUser;

    try {
      DocumentReference currentUserReference = userReference.doc(data["uid"]);
      await currentUserReference.set(data);
      return true;
    } on Exception catch (e) {
      return false;
    }
  }

  //data={"title":"dasdsa","body":"dasda"};
  static addNewPost(Map<String, dynamic> data) async {
    User? user = FirebaseAuth.instance.currentUser;
    String uid = "";
    if (user != null) {
      uid = user.uid;
    }

    data["uid"] = uid;
    //data={"title":"dasdsa","body":"dasda","uid":"qwrdqwwqwqdeqwfdewfew"};
    postRefrence.add(data);
  }

  //data={"postId":"dasdsa","text":"usr typed text"};
  static addNewCommentToPost(Map<String, dynamic> data,) async {
    User? user = FirebaseAuth.instance.currentUser;
    String uid = "";
    if (user != null) {
      uid = user.uid;
    }

    data["uid"] = uid;
    //data={"postId":"dasdsa","text":"usr typed text",uid":"qwrdqwwqwqdeqwfdewfew"};
    postRefrence.add(data);
  }
  void addPostToFirestore({required String titletext,required String bodytext})async{
    User? currentUser=FirebaseAuth.instance.currentUser;
    String uid="";
    if(currentUser!=null){
      uid=currentUser.uid;
    }
    Map<String, dynamic> data={"title": titletext,"body":bodytext,"uid":uid};
    postRefrence
        .add(data).then((value)
    => print("Successfully add to firestore"))
        .onError((error, stacktrace)
    =>print("Error $error"));
  }
  void addCommentToFirestore({required String commenttext,required String postid}) async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    String uid = "";
    if (currentUser != null) {
      uid = currentUser.uid;
    }
    ;
    Map<String, dynamic> data = {
      "comment": commenttext,
      "uid": uid,
      "postid": postid,
    };
    commentRefrence
        .add(data)
        .then((value) => print("Successfully add to firestore"))
        .onError((error, stacktrace) => print("Error $error"));
  }
}