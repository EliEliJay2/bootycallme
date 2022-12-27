import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfileWidget extends StatefulWidget {
  const EditProfileWidget({
    Key? key,
    this.userEmail,
    this.userDisplay,
    this.userPhoto,
  }) : super(key: key);

  final UsersRecord? userEmail;
  final UsersRecord? userDisplay;
  final DocumentReference? userPhoto;

  @override
  _EditProfileWidgetState createState() => _EditProfileWidgetState();
}

class _EditProfileWidgetState extends State<EditProfileWidget> {
  bool isMediaUploading = false;
  String uploadedFileUrl = '';

  TextEditingController? textController1;
  TextEditingController? textController2;
  TextEditingController? textController3;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'editProfile'});
  }

  @override
  void dispose() {
    textController1?.dispose();
    textController2?.dispose();
    textController3?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UsersRecord>(
      stream: UsersRecord.getDocument(currentUserReference!),
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
        final editProfileUsersRecord = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).spaceCadet,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryColor,
            automaticallyImplyLeading: false,
            leading: InkWell(
              onTap: () async {
                logFirebaseEvent('EDIT_PROFILE_PAGE_Icon_7bxuwhxn_ON_TAP');
                logFirebaseEvent('Icon_navigate_back');
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_rounded,
                color: FlutterFlowTheme.of(context).tertiaryColor,
                size: 24,
              ),
            ),
            title: Text(
              'Edit Profile',
              style: FlutterFlowTheme.of(context).title2.override(
                    fontFamily: 'Lexend Deca',
                    color: FlutterFlowTheme.of(context).tertiaryColor,
                  ),
            ),
            actions: [],
            centerTitle: false,
            elevation: 0,
          ),
          body: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Material(
                  color: Colors.transparent,
                  elevation: 3,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 400,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          FlutterFlowTheme.of(context).primaryColor,
                          FlutterFlowTheme.of(context).spaceCadet
                        ],
                        stops: [0, 1],
                        begin: AlignmentDirectional(0, -1),
                        end: AlignmentDirectional(0, 1),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0, 0),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                            child: InkWell(
                              onTap: () async {
                                logFirebaseEvent(
                                    'EDIT_PROFILE_CircleImage_98a9otnw_ON_TAP');
                                logFirebaseEvent(
                                    'CircleImage_upload_media_to_firebase');
                                final selectedMedia = await selectMedia(
                                  maxWidth: 1000.00,
                                  maxHeight: 1000.00,
                                  mediaSource: MediaSource.photoGallery,
                                  multiImage: false,
                                );
                                if (selectedMedia != null &&
                                    selectedMedia.every((m) =>
                                        validateFileFormat(
                                            m.storagePath, context))) {
                                  setState(() => isMediaUploading = true);
                                  var downloadUrls = <String>[];
                                  try {
                                    showUploadMessage(
                                      context,
                                      'Uploading file...',
                                      showLoading: true,
                                    );
                                    downloadUrls = (await Future.wait(
                                      selectedMedia.map(
                                        (m) async => await uploadData(
                                            m.storagePath, m.bytes),
                                      ),
                                    ))
                                        .where((u) => u != null)
                                        .map((u) => u!)
                                        .toList();
                                  } finally {
                                    ScaffoldMessenger.of(context)
                                        .hideCurrentSnackBar();
                                    isMediaUploading = false;
                                  }
                                  if (downloadUrls.length ==
                                      selectedMedia.length) {
                                    setState(() =>
                                        uploadedFileUrl = downloadUrls.first);
                                    showUploadMessage(context, 'Success!');
                                  } else {
                                    setState(() {});
                                    showUploadMessage(
                                        context, 'Failed to upload media');
                                    return;
                                  }
                                }

                                logFirebaseEvent('CircleImage_backend_call');

                                final usersUpdateData = createUsersRecordData(
                                  photoUrl: uploadedFileUrl,
                                );
                                await currentUserReference!
                                    .update(usersUpdateData);
                              },
                              child: Container(
                                width: 80,
                                height: 80,
                                clipBehavior: Clip.antiAlias,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: Image.network(
                                  valueOrDefault<String>(
                                    editProfileUsersRecord.photoUrl,
                                    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/dark-mode-chat-xk2sj6/assets/ails754ngloi/uiAvatar@2x.png',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 12, 20, 0),
                                child: TextFormField(
                                  controller: textController1 ??=
                                      TextEditingController(
                                    text: editProfileUsersRecord.email,
                                  ),
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Email Address',
                                    labelStyle:
                                        FlutterFlowTheme.of(context).bodyText1,
                                    hintStyle:
                                        FlutterFlowTheme.of(context).bodyText1,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF9039EF),
                                        width: 3,
                                      ),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF9039EF),
                                        width: 3,
                                      ),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 3,
                                      ),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 3,
                                      ),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            16, 24, 16, 24),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: FlutterFlowTheme.of(context)
                                            .gray200,
                                        fontSize: 20,
                                      ),
                                  keyboardType: TextInputType.emailAddress,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 12, 20, 0),
                                child: TextFormField(
                                  controller: textController2 ??=
                                      TextEditingController(
                                    text: editProfileUsersRecord.displayName,
                                  ),
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Full Name',
                                    labelStyle:
                                        FlutterFlowTheme.of(context).bodyText1,
                                    hintStyle:
                                        FlutterFlowTheme.of(context).bodyText1,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF9039EF),
                                        width: 3,
                                      ),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF9039EF),
                                        width: 3,
                                      ),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 3,
                                      ),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 3,
                                      ),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            16, 24, 16, 24),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: FlutterFlowTheme.of(context)
                                            .gray200,
                                        fontSize: 20,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 12, 20, 0),
                                child: TextFormField(
                                  controller: textController3 ??=
                                      TextEditingController(
                                    text: editProfileUsersRecord.userRole,
                                  ),
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Job Title',
                                    labelStyle:
                                        FlutterFlowTheme.of(context).bodyText1,
                                    hintStyle:
                                        FlutterFlowTheme.of(context).bodyText1,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF9039EF),
                                        width: 3,
                                      ),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF9039EF),
                                        width: 3,
                                      ),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 3,
                                      ),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 3,
                                      ),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            16, 24, 16, 24),
                                  ),
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: FlutterFlowTheme.of(context)
                                            .background,
                                        fontSize: 20,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                          child: FFButtonWidget(
                            onPressed: () async {
                              logFirebaseEvent(
                                  'EDIT_PROFILE_SAVE_CHANGES_BTN_ON_TAP');
                              logFirebaseEvent('Button_backend_call');

                              final usersUpdateData = createUsersRecordData(
                                email: textController1?.text ?? '',
                                displayName: textController2?.text ?? '',
                                photoUrl: uploadedFileUrl,
                                userRole: textController3?.text ?? '',
                              );
                              await editProfileUsersRecord.reference
                                  .update(usersUpdateData);
                              logFirebaseEvent('Button_navigate_back');
                              Navigator.pop(context);
                            },
                            text: 'Save Changes',
                            options: FFButtonOptions(
                              width: 200,
                              height: 50,
                              color: FlutterFlowTheme.of(context).tertiaryColor,
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Lexend Deca',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                              elevation: 3,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(40),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
