import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class Answer1Record extends FirestoreRecord {
  Answer1Record._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "question" field.
  String? _question;
  String get question => _question ?? '';
  bool hasQuestion() => _question != null;

  // "is_true" field.
  bool? _isTrue;
  bool get isTrue => _isTrue ?? false;
  bool hasIsTrue() => _isTrue != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _question = snapshotData['question'] as String?;
    _isTrue = snapshotData['is_true'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('answer1')
          : FirebaseFirestore.instance.collectionGroup('answer1');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('answer1').doc(id);

  static Stream<Answer1Record> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => Answer1Record.fromSnapshot(s));

  static Future<Answer1Record> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => Answer1Record.fromSnapshot(s));

  static Answer1Record fromSnapshot(DocumentSnapshot snapshot) =>
      Answer1Record._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static Answer1Record getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      Answer1Record._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'Answer1Record(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is Answer1Record &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAnswer1RecordData({
  String? question,
  bool? isTrue,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'question': question,
      'is_true': isTrue,
    }.withoutNulls,
  );

  return firestoreData;
}

class Answer1RecordDocumentEquality implements Equality<Answer1Record> {
  const Answer1RecordDocumentEquality();

  @override
  bool equals(Answer1Record? e1, Answer1Record? e2) {
    return e1?.question == e2?.question && e1?.isTrue == e2?.isTrue;
  }

  @override
  int hash(Answer1Record? e) =>
      const ListEquality().hash([e?.question, e?.isTrue]);

  @override
  bool isValidKey(Object? o) => o is Answer1Record;
}
