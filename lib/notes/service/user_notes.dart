import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../models/note_model.dart';

//import '../models/notes_model.dart';

class UserNotes{
  static Future<void>addNotes(NoteModel model) async{
    final FirebaseAuth auth=FirebaseAuth.instance;
    final String uid=auth.currentUser!.uid;
    final String nid=model.note_id as String;
    final db=FirebaseFirestore.instance;
    db.collection('Users').doc(uid).collection('Notes').doc(nid).set(model.toJson());

  }

  static getNotes() {}
}