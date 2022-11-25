import 'package:cloud_firestore/cloud_firestore.dart';

class Sport {
  final String? name;
  final String? image;
  final String uid;

  //final int members;

  Sport({
    this.name = "",
    this.image = "",
    this.uid = "",
    //this.members=0
  });

  factory Sport.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,) {
    final data = snapshot.data();
    return Sport(
        name: data?['name'],
        image: data?['image'],
        //members: data?['members'],
        uid: snapshot.id
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,
      if (image != null) "image": image,
      //if (members != 0) "members": members,
    };
  }
}
