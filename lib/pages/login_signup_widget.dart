import '/components/button_widget.dart';
import '/components/text_field_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';

class LoginSignupWidget extends StatefulWidget {
  const LoginSignupWidget({super.key});

  @override
  State<LoginSignupWidget> createState() => _LoginSignupWidgetState();
}

class _LoginSignupWidgetState extends State<LoginSignupWidget> {
  late LoginSignupModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginSignupModel());
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = FlutterFlowTheme.of(context);
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: theme.primaryBackground,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),
              Text('Welcome Back', style: theme.displayMedium),
              Text('Login to continue your musical journey', style: theme.bodyMedium),
              const SizedBox(height: 48),
              const TextFieldWidget(
                hint: 'Email Address',
                variant: 'filled',
                leading_icon_present: true,
                leading_icon: Icon(Icons.email_outlined, size: 20),
              ),
              const SizedBox(height: 16),
              const TextFieldWidget(
                hint: 'Password',
                variant: 'filled',
                leading_icon_present: true,
                leading_icon: Icon(Icons.lock_outline_rounded, size: 20),
                trailing_icon_present: true,
                trailing_icon: Icon(Icons.visibility_off_outlined, size: 20),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text('Forgot Password?', style: theme.bodySmall.override(color: theme.primary)),
                ),
              ),
              const SizedBox(height: 32),
              ButtonWidget(
                content: 'Login',
                full_width: true,
                onPressed: () => Navigator.pushNamed(context, '/home'),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(child: Divider(color: theme.alternate)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text('OR', style: theme.labelSmall),
                  ),
                  Expanded(child: Divider(color: theme.alternate)),
                ],
              ),
              const SizedBox(height: 24),
              ButtonWidget(
                content: 'Continue with Google',
                variant: 'secondary',
                full_width: true,
                icon_present: true,
                icon: const Icon(Icons.g_mobiledata_rounded, size: 24),
                onPressed: () {},
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don\'t have an account?', style: theme.bodyMedium),
                  TextButton(
                    onPressed: () {},
                    child: Text('Sign Up', style: theme.bodyMedium.override(color: theme.primary, fontWeight: FontWeight.w700)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class LoginSignupModel extends FlutterFlowModel<LoginSignupWidget> {
  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
