import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'profile_circle_model.dart';
export 'profile_circle_model.dart';

class ProfileCircleWidget extends StatefulWidget {
  const ProfileCircleWidget({
    super.key,
    required this.ranks,
  });

  final LeaderboardRanks? ranks;

  @override
  State<ProfileCircleWidget> createState() => _ProfileCircleWidgetState();
}

class _ProfileCircleWidgetState extends State<ProfileCircleWidget> {
  late ProfileCircleModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ProfileCircleModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: valueOrDefault<double>(
        widget.ranks == LeaderboardRanks.First ? 120.0 : 90.0,
        90.0,
      ),
      height: valueOrDefault<double>(
        widget.ranks == LeaderboardRanks.First ? 140.0 : 110.0,
        110.0,
      ),
      decoration: BoxDecoration(),
      child: Stack(
        children: [
          Container(
            width: valueOrDefault<double>(
              widget.ranks == LeaderboardRanks.First ? 120.0 : 100.0,
              120.0,
            ),
            height: valueOrDefault<double>(
              widget.ranks == LeaderboardRanks.First ? 120.0 : 100.0,
              120.0,
            ),
            decoration: BoxDecoration(
              color: valueOrDefault<Color>(
                widget.ranks == LeaderboardRanks.First
                    ? Color(0xFF4837DD)
                    : FlutterFlowTheme.of(context).primary,
                Color(0xFF6759E4),
              ),
              shape: BoxShape.circle,
            ),
            child: Padding(
              padding: EdgeInsets.all(4.0),
              child: Container(
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: EdgeInsets.all(2.0),
                  child: Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: Image.network(
                          valueOrDefault<String>(
                            () {
                              if (widget.ranks == LeaderboardRanks.First) {
                                return 'https://mighty.tools/mockmind-api/content/human/44.jpg';
                              } else if (widget.ranks ==
                                  LeaderboardRanks.Second) {
                                return 'https://mighty.tools/mockmind-api/content/human/57.jpg';
                              } else {
                                return 'https://mighty.tools/mockmind-api/content/human/38.jpg';
                              }
                            }(),
                            'https://cdn-icons-png.flaticon.com/512/8345/8345328.png',
                          ),
                        ).image,
                      ),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.0, 1.0),
            child: Container(
              width: 40.0,
              height: 40.0,
              decoration: BoxDecoration(
                color: valueOrDefault<Color>(
                  widget.ranks == LeaderboardRanks.First
                      ? Color(0xFF4837DD)
                      : FlutterFlowTheme.of(context).primary,
                  Color(0xFF6759E4),
                ),
                shape: BoxShape.circle,
              ),
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Text(
                () {
                  if (widget.ranks == LeaderboardRanks.First) {
                    return '1';
                  } else if (widget.ranks == LeaderboardRanks.Second) {
                    return '2';
                  } else {
                    return '3';
                  }
                }(),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Lato',
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      fontSize: 18.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w800,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
