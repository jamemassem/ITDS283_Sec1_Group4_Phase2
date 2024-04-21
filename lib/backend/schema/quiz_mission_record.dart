import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuizMissionRecord extends FirestoreRecord {
  QuizMissionRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "englevel" field.
  String? _englevel;
  String get englevel => _englevel ?? '';
  bool hasEnglevel() => _englevel != null;

  // "levellogo" field.
  String? _levellogo;
  String get levellogo => _levellogo ?? '';
  bool hasLevellogo() => _levellogo != null;

  // "nummission" field.
  int? _nummission;
  int get nummission => _nummission ?? 0;
  bool hasNummission() => _nummission != null;

  // "quizamount" field.
  int? _quizamount;
  int get quizamount => _quizamount ?? 0;
  bool hasQuizamount() => _quizamount != null;

  void _initializeFields() {
    _englevel = snapshotData['englevel'] as String?;
    _levellogo = snapshotData['levellogo'] as String?;
    _nummission = castToType<int>(snapshotData['nummission']);
    _quizamount = castToType<int>(snapshotData['quizamount']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('quizMission');

  static Stream<QuizMissionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => QuizMissionRecord.fromSnapshot(s));

  static Future<QuizMissionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => QuizMissionRecord.fromSnapshot(s));

  static QuizMissionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      QuizMissionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static QuizMissionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      QuizMissionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'QuizMissionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is QuizMissionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createQuizMissionRecordData({
  String? englevel,
  String? levellogo,
  int? nummission,
  int? quizamount,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'englevel': englevel,
      'levellogo': levellogo,
      'nummission': nummission,
      'quizamount': quizamount,
    }.withoutNulls,
  );

  return firestoreData;
}

class QuizMissionRecordDocumentEquality implements Equality<QuizMissionRecord> {
  const QuizMissionRecordDocumentEquality();

  @override
  bool equals(QuizMissionRecord? e1, QuizMissionRecord? e2) {
    return e1?.englevel == e2?.englevel &&
        e1?.levellogo == e2?.levellogo &&
        e1?.nummission == e2?.nummission &&
        e1?.quizamount == e2?.quizamount;
  }

  @override
  int hash(QuizMissionRecord? e) => const ListEquality()
      .hash([e?.englevel, e?.levellogo, e?.nummission, e?.quizamount]);

  @override
  bool isValidKey(Object? o) => o is QuizMissionRecord;
}
