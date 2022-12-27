import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/empty_matches_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPageWidget extends StatefulWidget {
  const MainPageWidget({Key? key}) : super(key: key);

  @override
  _MainPageWidgetState createState() => _MainPageWidgetState();
}

class _MainPageWidgetState extends State<MainPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'MainPage'});
  }

  @override
  Widget build(BuildContext context) {
    return AuthUserStreamWidget(
      child: StreamBuilder<List<UsersRecord>>(
        stream: queryUsersRecord(
          queryBuilder: (usersRecord) => usersRecord
              .where('gender',
                  isEqualTo:
                      valueOrDefault(currentUserDocument?.desiredGender, ''))
              .whereNotIn(
                  'uid',
                  functions.combineLists(
                      (currentUserDocument?.matches?.toList() ?? []).toList(),
                      (currentUserDocument?.rejected?.toList() ?? [])
                          .toList())),
          singleRecord: true,
        ),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(
                  color: FlutterFlowTheme.of(context).primaryColor,
                ),
              ),
            );
          }
          List<UsersRecord> mainPageUsersRecordList =
              snapshot.data!.where((u) => u.uid != currentUserUid).toList();
          final mainPageUsersRecord = mainPageUsersRecordList.isNotEmpty
              ? mainPageUsersRecordList.first
              : null;
          return Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).spaceCadet,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).tealBlue,
              automaticallyImplyLeading: false,
              title: Text(
                'Main Page',
                style: FlutterFlowTheme.of(context).title2,
              ),
              actions: [],
              centerTitle: false,
              elevation: 0,
            ),
            body: Stack(
              children: [
                if (mainPageUsersRecord != null)
                  SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Image.network(
                              mainPageUsersRecord!.photoUrl!,
                              width: MediaQuery.of(context).size.width,
                              height: 230,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 12, 20, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Expanded(
                                child: Text(
                                  mainPageUsersRecord!.displayName!,
                                  style: FlutterFlowTheme.of(context)
                                      .title2
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color:
                                            FlutterFlowTheme.of(context).flax,
                                      ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  mainPageUsersRecord!.age!.toString(),
                                  style: FlutterFlowTheme.of(context)
                                      .subtitle1
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: FlutterFlowTheme.of(context)
                                            .illuminatingEmerald,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 4, 20, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Text(
                                  mainPageUsersRecord!.location!,
                                  style: FlutterFlowTheme.of(context)
                                      .subtitle1
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 20, 0, 24),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'MAIN_PAGE_PAGE_ButtonPrimary_ON_TAP');
                                  logFirebaseEvent(
                                      'ButtonPrimary_backend_call');

                                  final usersUpdateData = {
                                    'rejected': FieldValue.arrayUnion(
                                        [mainPageUsersRecord!.uid]),
                                  };
                                  await currentUserReference!
                                      .update(usersUpdateData);
                                  logFirebaseEvent('ButtonPrimary_navigate_to');
                                  await Navigator.push(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 0),
                                      reverseDuration:
                                          Duration(milliseconds: 0),
                                      child:
                                          NavBarPage(initialPage: 'MainPage'),
                                    ),
                                  );
                                },
                                text: 'Reject',
                                options: FFButtonOptions(
                                  width: 150,
                                  height: 40,
                                  color: Color(0xFFEF393C),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .title3
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: Colors.white,
                                      ),
                                  elevation: 3,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 20, 0, 24),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  logFirebaseEvent(
                                      'MAIN_PAGE_PAGE_ButtonPrimary_ON_TAP');
                                  logFirebaseEvent(
                                      'ButtonPrimary_backend_call');

                                  final usersUpdateData = {
                                    'matches': FieldValue.arrayUnion(
                                        [mainPageUsersRecord!.uid]),
                                  };
                                  await currentUserReference!
                                      .update(usersUpdateData);
                                  if (mainPageUsersRecord!.matches!
                                      .toList()
                                      .contains(currentUserUid)) {
                                    logFirebaseEvent(
                                        'ButtonPrimary_backend_call');

                                    final chatsCreateData = {
                                      ...createChatsRecordData(
                                        userA: mainPageUsersRecord!.reference,
                                        userB: currentUserReference,
                                        lastMessage: '\"\"',
                                        lastMessageTime: getCurrentTimestamp,
                                      ),
                                      'users': functions.createChatUserList(
                                          mainPageUsersRecord!.reference,
                                          currentUserReference!),
                                    };
                                    await ChatsRecord.collection
                                        .doc()
                                        .set(chatsCreateData);
                                    logFirebaseEvent(
                                        'ButtonPrimary_show_snack_bar');
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Congratulations! You have a new Match!',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor: Color(0x00000000),
                                      ),
                                    );
                                    logFirebaseEvent(
                                        'ButtonPrimary_wait__delay');
                                    await Future.delayed(
                                        const Duration(milliseconds: 3000));
                                  }
                                  logFirebaseEvent('ButtonPrimary_navigate_to');
                                  await Navigator.push(
                                    context,
                                    PageTransition(
                                      type: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 0),
                                      reverseDuration:
                                          Duration(milliseconds: 0),
                                      child:
                                          NavBarPage(initialPage: 'MainPage'),
                                    ),
                                  );
                                },
                                text: 'Match',
                                options: FFButtonOptions(
                                  width: 150,
                                  height: 40,
                                  color: Color(0xFF007101),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .title3
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: Colors.white,
                                      ),
                                  elevation: 3,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                if (!(mainPageUsersRecord != null))
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: EmptyMatchesWidget(),
                      ),
                    ],
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
