import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class User {
  final String username;
  final String email;
  final String uid;
  final String photoUrl;
  final String bio;
  final List followers;
  final List following;

  const User({
    required this.username,
    required this.email,
    required this.uid,
    required this.photoUrl,
    required this.bio,
    required this.followers,
    required this.following,
  });

  Map<String, dynamic> toJson() => {
        "username": username,
        "uid": uid,
        "email": email,
        "bio": bio,
        "photoUrl": photoUrl,
        "followers": followers,
        "following": following
      };

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return User(
      username: snapshot['username'],
      uid: snapshot['uid'],
      bio: snapshot['bio'],
      email: snapshot['email'],
      photoUrl: snapshot['photoUrl'],
      followers: snapshot['followers'],
      following: snapshot['following'],
    );
  }
}
