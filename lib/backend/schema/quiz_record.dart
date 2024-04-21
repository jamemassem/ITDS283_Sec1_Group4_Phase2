import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuizRecord extends FirestoreRecord {
  QuizRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "timer" field.
  DateTime? _timer;
  DateTime? get timer => _timer;
  bool hasTimer() => _timer != null;

  // "questionindex" field.
  int? _questionindex;
  int get questionindex => _questionindex ?? 0;
  bool hasQuestionindex() => _questionindex != null;

  // "question" field.
  String? _question;
  String get question => _question ?? '';
  bool hasQuestion() => _question != null;

  void _initializeFields() {
    _timer = snapshotData['timer'] as DateTime?;
    _questionindex = castToType<int>(snapshotData['questionindex']);
    _question = snapshotData['question'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('quiz');

  static Stream<QuizRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuizRecord.fromSnapshot(s));

  static Future<QuizRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QuizRecord.fromSnapshot(s));

  static QuizRecord fromSnapshot(DocumentSnapshot snapshot) => QuizRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuizRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuizRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuizRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QuizRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQuizRecordData({
  DateTime? timer,
  int? questionindex,
  String? question,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'timer': timer,
      'questionindex': questionindex,
      'question': question,
    }.withoutNulls,
  );

  return firestoreData;
}

class QuizRecordDocumentEquality implements Equality<QuizRecord> {
  const QuizRecordDocumentEquality();

  @override
  bool equals(QuizRecord? e1, QuizRecord? e2) {
    return e1?.timer == e2?.timer &&
        e1?.questionindex == e2?.questionindex &&
        e1?.question == e2?.question;
  }

  @override
  int hash(QuizRecord? e) =>
      const ListEquality().hash([e?.timer, e?.questionindex, e?.question]);

  @override
  bool isValidKey(Object? o) => o is QuizRecord;
}
