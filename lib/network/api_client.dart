// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:google_sign_in/google_sign_in.dart';
//
// class ApiClient {
//   final FirebaseAuth auth;
//   final GoogleSignIn googleSignIn;
//   final FirebaseFirestore firebaseFirestore;
//   final FirebaseStorage firebaseStorage;
//
//   const ApiClient({
//     required this.auth,
//     required this.firebaseFirestore,
//     required this.googleSignIn,
//     required this.firebaseStorage,});
//
//
//   Future<UserCredential> signInWithGoogle() async {
//     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
//     final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
//
//     // Create a new credential
//     final credential = GoogleAuthProvider.credential(
//       accessToken: googleAuth?.accessToken,
//       idToken: googleAuth?.idToken,
//     );
//
//     // Once signed in, return the UserCredential
//     return await FirebaseAuth.instance.signInWithCredential(credential);
//   }
//
//
//   Future<bool> handleGoogleSignIn() async {
//     GoogleSignInAccount? googleUser = await googleSignIn.signIn();
//     if (googleUser != null) {
//       GoogleSignInAuthentication? googleAuth = await googleUser.authentication;
//       final AuthCredential credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );
//
//       User? firebaseUser =
//           (await firebaseAuth.signInWithCredential(credential)).user;
//
//       if (firebaseUser != null) {
//         final QuerySnapshot result = await firebaseFirestore
//             .collection(FirestoreConstants.pathUserCollection)
//             .where(FirestoreConstants.id, isEqualTo: firebaseUser.uid)
//             .get();
//         final List<DocumentSnapshot> document = result.docs;
//         if (document.isEmpty) {
//           firebaseFirestore
//               .collection(FirestoreConstants.pathUserCollection)
//               .doc(firebaseUser.uid)
//               .set({
//             FirestoreConstants.displayName: firebaseUser.displayName,
//             FirestoreConstants.photoUrl: firebaseUser.photoURL,
//             FirestoreConstants.id: firebaseUser.uid,
//             "createdAt: ": DateTime
//                 .now()
//                 .millisecondsSinceEpoch
//                 .toString(),
//             FirestoreConstants.chattingWith: null
//           });
//         }
//       }