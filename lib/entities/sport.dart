import 'package:cloud_firestore/cloud_firestore.dart';

class Sport {
  final String? name;
  final String? image;
  final String? description;
  final String uid;


  Sport({
    this.name = "",
    this.image = "",
    this.description,
    this.uid = "",
  });

  factory Sport.fromFirestore(DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options,) {
    final data = snapshot.data();
    return Sport(
        name: data?['name'],
        image: data?['image'],
        description: data?['description'],
        uid: snapshot.id
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,
      if (image != null) "image": image,
      if (description != null) "image": description,

    };
  }
}

