import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class Answer2Record extends FirestoreRecord {
  Answer2Record._(
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
          ? parent.collection('answer2')
          : FirebaseFirestore.instance.collectionGroup('answer2');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('answer2').doc(id);

  static Stream<Answer2Record> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => Answer2Record.fromSnapshot(s));

  static Future<Answer2Record> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => Answer2Record.fromSnapshot(s));

  static Answer2Record fromSnapshot(DocumentSnapshot snapshot) =>
      Answer2Record._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static Answer2Record getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      Answer2Record._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'Answer2Record(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is Answer2Record &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAnswer2RecordData({
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

class Answer2RecordDocumentEquality implements Equality<Answer2Record> {
  const Answer2RecordDocumentEquality();

  @override
  bool equals(Answer2Record? e1, Answer2Record? e2) {
    return e1?.question == e2?.question && e1?.isTrue == e2?.isTrue;
  }

  @override
  int hash(Answer2Record? e) =>
      const ListEquality().hash([e?.question, e?.isTrue]);

  @override
  bool isValidKey(Object? o) => o is Answer2Record;
}
