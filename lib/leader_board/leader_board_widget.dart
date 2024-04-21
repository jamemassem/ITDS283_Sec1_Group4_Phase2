import '/backend/schema/enums/enums.dart';
import '/backend/schema/structs/index.dart';
import '/components/l_b_rank_points_current_user_widget.dart';
import '/components/l_b_rank_points_other_user_widget.dart';
import '/components/profile_circle_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'leader_board_model.dart';
export 'leader_board_model.dart';

class LeaderBoardWidget extends StatefulWidget {
  const LeaderBoardWidget({super.key});

  @override
  State<LeaderBoardWidget> createState() => _LeaderBoardWidgetState();
}

class _LeaderBoardWidgetState extends State<LeaderBoardWidget> {
  late LeaderBoardModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LeaderBoardModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.populatedPlayers = await actions.populatePlayers();
      setState(() {
        FFAppState().currentPlayers =
            _model.populatedPlayers!.toList().cast<PlayerStruct>();
      });
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          iconTheme:
              IconThemeData(color: FlutterFlowTheme.of(context).primaryText),
          automaticallyImplyLeading: true,
          title: Text(
            'Leaderboard',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Figtree',
                  fontSize: 20.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    wrapWithModel(
                      model: _model.profileCircleModel1,
                      updateCallback: () => setState(() {}),
                      child: ProfileCircleWidget(
                        ranks: LeaderboardRanks.Second,
                      ),
                    ),
                    wrapWithModel(
                      model: _model.profileCircleModel2,
                      updateCallback: () => setState(() {}),
                      child: ProfileCircleWidget(
                        ranks: LeaderboardRanks.First,
                      ),
                    ),
                    wrapWithModel(
                      model: _model.profileCircleModel3,
                      updateCallback: () => setState(() {}),
                      child: ProfileCircleWidget(
                        ranks: LeaderboardRanks.Third,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 36.0),
                  child: Container(
                    decoration: BoxDecoration(),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
                      child: Builder(
                        builder: (context) {
                          final players = FFAppState().currentPlayers.toList();
                          return ListView.separated(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: players.length,
                            separatorBuilder: (_, __) => SizedBox(height: 4.0),
                            itemBuilder: (context, playersIndex) {
                              final playersItem = players[playersIndex];
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    24.0, 6.0, 24.0, 0.0),
                                child: Builder(
                                  builder: (context) {
                                    if (playersItem.isCurrentUser) {
                                      return LBRankPointsCurrentUserWidget(
                                        key: Key(
                                            'Keyw1m_${playersIndex}_of_${players.length}'),
                                        player: playersItem,
                                      );
                                    } else {
                                      return LBRankPointsOtherUserWidget(
                                        key: Key(
                                            'Keylwp_${playersIndex}_of_${players.length}'),
                                        player: playersItem,
                                      );
                                    }
                                  },
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
