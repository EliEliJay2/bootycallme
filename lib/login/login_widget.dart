import '../auth/auth_util.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../forgot_password/forgot_password_widget.dart';
import '../main.dart';
import '../register/register_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  TextEditingController? emailTextController;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    emailTextController = TextEditingController();
    passwordTextController = TextEditingController();
    passwordVisibility = false;
    logFirebaseEvent('screen_view', parameters: {'screen_name': 'Login'});
  }

  @override
  void dispose() {
    emailTextController?.dispose();
    passwordTextController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).black600,
      body: Align(
        alignment: AlignmentDirectional(-0.14, -0.08),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fitWidth,
              image: Image.asset(
                'assets/images/Asset_6@4x.png',
              ).image,
            ),
            gradient: LinearGradient(
              colors: [Color(0xFF393EEF), Color(0xFF3E0259)],
              stops: [0, 1],
              begin: AlignmentDirectional(0, -1),
              end: AlignmentDirectional(0, 1),
            ),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 90),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 24),
                    child: Image.asset(
                      'assets/images/bootycallme.png',
                      width: 360,
                      height: 140,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 24),
                    child: Image.asset(
                      'assets/images/peach_logo.png',
                      width: 360,
                      height: 140,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(48, 0, 48, 20),
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).illuminatingEmerald,
                        width: 3,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 0, 20, 0),
                      child: TextFormField(
                        controller: emailTextController,
                        obscureText: false,
                        decoration: InputDecoration(
                          labelText: 'Email Address',
                          labelStyle: FlutterFlowTheme.of(context).bodyText1,
                          hintText: 'Email Address',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                        ),
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Lexend Deca',
                              color: FlutterFlowTheme.of(context).gray200,
                              fontSize: 20,
                            ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(48, 0, 48, 20),
                  child: Container(
                    width: double.infinity,
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).illuminatingEmerald,
                        width: 3,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(12, 0, 20, 0),
                      child: TextFormField(
                        controller: passwordTextController,
                        obscureText: !passwordVisibility,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: FlutterFlowTheme.of(context).bodyText1,
                          hintText: 'Password',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4.0),
                              topRight: Radius.circular(4.0),
                            ),
                          ),
                          suffixIcon: InkWell(
                            onTap: () => setState(
                              () => passwordVisibility = !passwordVisibility,
                            ),
                            focusNode: FocusNode(skipTraversal: true),
                            child: Icon(
                              passwordVisibility
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: FlutterFlowTheme.of(context).grayDark,
                              size: 24,
                            ),
                          ),
                        ),
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Lexend Deca',
                              color: FlutterFlowTheme.of(context).gray200,
                              fontSize: 20,
                            ),
                      ),
                    ),
                  ),
                ),
                FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent('LOGIN_PAGE_LOG_IN_BTN_ON_TAP');
                    logFirebaseEvent('Button_auth');

                    final user = await signInWithEmail(
                      context,
                      emailTextController!.text,
                      passwordTextController!.text,
                    );
                    if (user == null) {
                      return;
                    }

                    logFirebaseEvent('Button_navigate_to');
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            NavBarPage(initialPage: 'MainPage'),
                      ),
                    );
                  },
                  text: 'Log In',
                  options: FFButtonOptions(
                    width: 300,
                    height: 55,
                    color: FlutterFlowTheme.of(context).spaceCadet,
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Lexend Deca',
                          color: FlutterFlowTheme.of(context).gray200,
                          fontSize: 20,
                        ),
                    elevation: 4,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 0, 12, 0),
                        child: Text(
                          'Don\'t have an account?',
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Lexend Deca',
                                    color: FlutterFlowTheme.of(context).flax,
                                    fontSize: 20,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
                FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent('LOGIN_PAGE_CREATE_ACCOUNT_BTN_ON_TAP');
                    logFirebaseEvent('Button_navigate_to');
                    await Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.fade,
                        duration: Duration(milliseconds: 150),
                        reverseDuration: Duration(milliseconds: 150),
                        child: RegisterWidget(),
                      ),
                    );
                  },
                  text: 'Create Account',
                  options: FFButtonOptions(
                    width: 200,
                    height: 48,
                    color: Color(0x004B39EF),
                    textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                          fontFamily: 'Lexend Deca',
                          color: FlutterFlowTheme.of(context).grayDark,
                          fontSize: 20,
                        ),
                    elevation: 0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 0,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(48, 24, 48, 6),
                  child: FFButtonWidget(
                    onPressed: () async {
                      logFirebaseEvent(
                          'LOGIN_PAGE_FORGOT_PASSWORD?_BTN_ON_TAP');
                      logFirebaseEvent('Button_navigate_to');
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ForgotPasswordWidget(),
                        ),
                      );
                    },
                    text: 'Forgot Password?',
                    options: FFButtonOptions(
                      width: 200,
                      height: 55,
                      color: FlutterFlowTheme.of(context).grayDark,
                      textStyle:
                          FlutterFlowTheme.of(context).subtitle2.override(
                                fontFamily: 'Lexend Deca',
                                color: FlutterFlowTheme.of(context).black600,
                                fontSize: 20,
                              ),
                      elevation: 0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
