import '/components/button_widget.dart';
import '/components/text_field_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class LoginSignupWidget extends StatefulWidget {
  const LoginSignupWidget({super.key});

  @override
  State<LoginSignupWidget> createState() => _LoginSignupWidgetState();
}

class _LoginSignupWidgetState extends State<LoginSignupWidget> {
  late LoginSignupModel _model;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  bool isLogin = true;
  bool isLoading = false;
  String email = '';
  String password = '';
  final _authService = AuthService();

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

  Future<void> _submit() async {
    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all fields')),
      );
      return;
    }

    setState(() => isLoading = true);
    try {
      if (isLogin) {
        await _authService.signInWithEmailAndPassword(email.trim(), password);
      } else {
        await _authService.signUpWithEmailAndPassword(email.trim(), password);
      }
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/home');
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString())),
        );
      }
    } finally {
      if (mounted) {
        setState(() => isLoading = false);
      }
    }
  }

  Future<void> _googleSignIn() async {
    setState(() => isLoading = true);
    try {
      final user = await _authService.signInWithGoogle();
      if (user != null && mounted) {
        Navigator.pushReplacementNamed(context, '/home');
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Google Sign In Failed')),
        );
      }
    } finally {
      if (mounted) {
        setState(() => isLoading = false);
      }
    }
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
              Text(isLogin ? 'Welcome Back' : 'Create Account', style: theme.displayMedium),
              Text(isLogin ? 'Login to continue your musical journey' : 'Sign up to start your musical journey', style: theme.bodyMedium),
              const SizedBox(height: 48),
              TextFieldWidget(
                hint: 'Email Address',
                variant: 'filled',
                leading_icon_present: true,
                leading_icon: const Icon(Icons.email_outlined, size: 20),
                onChanged: (val) => email = val,
              ),
              const SizedBox(height: 16),
              TextFieldWidget(
                hint: 'Password',
                variant: 'filled',
                obscureText: true,
                leading_icon_present: true,
                leading_icon: const Icon(Icons.lock_outline_rounded, size: 20),
                onChanged: (val) => password = val,
              ),
              if (isLogin)
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: Text('Forgot Password?', style: theme.bodySmall.override(color: theme.primary)),
                  ),
                ),
              SizedBox(height: isLogin ? 16 : 32),
              isLoading 
                ? const Center(child: CircularProgressIndicator())
                : ButtonWidget(
                    content: isLogin ? 'Login' : 'Sign Up',
                    full_width: true,
                    onPressed: _submit,
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
                onPressed: _googleSignIn,
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(isLogin ? 'Don\'t have an account?' : 'Already have an account?', style: theme.bodyMedium),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        isLogin = !isLogin;
                      });
                    },
                    child: Text(isLogin ? 'Sign Up' : 'Login', style: theme.bodyMedium.override(color: theme.primary, fontWeight: FontWeight.w700)),
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
