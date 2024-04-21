import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/l_b_rank_points_current_user_widget.dart';
import '/components/l_b_rank_points_other_user_widget.dart';
import '/components/profile_circle_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'leader_board_widget.dart' show LeaderBoardWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LeaderBoardModel extends FlutterFlowModel<LeaderBoardWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - populatePlayers] action in LeaderBoard widget.
  List<PlayerStruct>? populatedPlayers;
  // Model for ProfileCircle component.
  late ProfileCircleModel profileCircleModel1;
  // Model for ProfileCircle component.
  late ProfileCircleModel profileCircleModel2;
  // Model for ProfileCircle component.
  late ProfileCircleModel profileCircleModel3;

  @override
  void initState(BuildContext context) {
    profileCircleModel1 = createModel(context, () => ProfileCircleModel());
    profileCircleModel2 = createModel(context, () => ProfileCircleModel());
    profileCircleModel3 = createModel(context, () => ProfileCircleModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    profileCircleModel1.dispose();
    profileCircleModel2.dispose();
    profileCircleModel3.dispose();
  }
}
