// ignore_for_file: file_names, non_constant_identifier_names

import 'package:adhd_proj/pages/signup.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<bool> isDuplicateUniqueMale(String uniqueEmail) async {
  QuerySnapshot query = await FirebaseFirestore.instance
      .collection('users')
      .where('Email', isEqualTo: uniqueEmail)
      .get();
  return query.docs.isNotEmpty;
}

Future<Map<String, dynamic>?> getDocumentByEmail(String email) async {
  // Create a query to search for documents with the given email
  QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
      .instance
      .collection('users')
      .where('Email', isEqualTo: email)
      .limit(1)
      .get();

  // Check if any documents were found
  if (querySnapshot.docs.isNotEmpty) {
    // Retrieve the first document found
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        querySnapshot.docs[0];
    return documentSnapshot.data();
  } else {
    return null; // No document found with the given email
  }
}

Future<void> Addscorefield(String email, int score) async {
  // Create a query to search for documents with the given email
  QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
      .instance
      .collection('users')
      .where('Email', isEqualTo: email)
      .limit(1)
      .get();

  // Check if any documents were found
  if (querySnapshot.docs.isNotEmpty) {
    // Retrieve the first document found
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        querySnapshot.docs[0];
    DocumentReference docRef = documentSnapshot.reference;
    await docRef.update({'mcqscore': score});
  } else {
    maketoast("error occured"); // No document found with the given email
  }
}
Future<void> updateInfo(String email,String newemail, String name,String gender,String age) async {
  // Create a query to search for documents with the given email
  QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
      .instance
      .collection('users')
      .where('Email', isEqualTo: email)
      .limit(1)
      .get();

  // Check if any documents were found
  if (querySnapshot.docs.isNotEmpty) {
    // Retrieve the first document found
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        querySnapshot.docs[0];
    DocumentReference docRef = documentSnapshot.reference;
    await docRef.update({'Email': newemail,'Name':name,'Age':age,'Gender':gender});
  } else {
    maketoast("error occured"); // No document found with the given email
  }
}
Future<List<String>> GetQuestions( String collectionName, String fieldName) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference collectionReference =
      firestore.collection(collectionName);
  List<String> questionsList = [];

  try {
    QuerySnapshot querySnapshot = await collectionReference.get();
    for (var doc in querySnapshot.docs) {
      questionsList.add(doc[fieldName] as String);
    }
  } catch (error) {
    print('Error getting questions: $error');
  }

  return questionsList;
}