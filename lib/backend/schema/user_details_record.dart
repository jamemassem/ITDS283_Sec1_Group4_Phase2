import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserDetailsRecord extends FirestoreRecord {
  UserDetailsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "hasToprank" field.
  bool? _hasToprank;
  bool get hasToprank => _hasToprank ?? false;
  bool hasHasToprank() => _hasToprank != null;

  // "highscore" field.
  int? _highscore;
  int get highscore => _highscore ?? 0;
  bool hasHighscore() => _highscore != null;

  // "rank" field.
  int? _rank;
  int get rank => _rank ?? 0;
  bool hasRank() => _rank != null;

  // "isCurrectUser" field.
  bool? _isCurrectUser;
  bool get isCurrectUser => _isCurrectUser ?? false;
  bool hasIsCurrectUser() => _isCurrectUser != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _image = snapshotData['image'] as String?;
    _email = snapshotData['email'] as String?;
    _hasToprank = snapshotData['hasToprank'] as bool?;
    _highscore = castToType<int>(snapshotData['highscore']);
    _rank = castToType<int>(snapshotData['rank']);
    _isCurrectUser = snapshotData['isCurrectUser'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('userDetails');

  static Stream<UserDetailsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserDetailsRecord.fromSnapshot(s));

  static Future<UserDetailsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserDetailsRecord.fromSnapshot(s));

  static UserDetailsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserDetailsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserDetailsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserDetailsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserDetailsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserDetailsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserDetailsRecordData({
  String? name,
  String? image,
  String? email,
  bool? hasToprank,
  int? highscore,
  int? rank,
  bool? isCurrectUser,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'image': image,
      'email': email,
      'hasToprank': hasToprank,
      'highscore': highscore,
      'rank': rank,
      'isCurrectUser': isCurrectUser,
    }.withoutNulls,
  );

  return firestoreData;
}

class UserDetailsRecordDocumentEquality implements Equality<UserDetailsRecord> {
  const UserDetailsRecordDocumentEquality();

  @override
  bool equals(UserDetailsRecord? e1, UserDetailsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.image == e2?.image &&
        e1?.email == e2?.email &&
        e1?.hasToprank == e2?.hasToprank &&
        e1?.highscore == e2?.highscore &&
        e1?.rank == e2?.rank &&
        e1?.isCurrectUser == e2?.isCurrectUser;
  }

  @override
  int hash(UserDetailsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.image,
        e?.email,
        e?.hasToprank,
        e?.highscore,
        e?.rank,
        e?.isCurrectUser
      ]);

  @override
  bool isValidKey(Object? o) => o is UserDetailsRecord;
}
