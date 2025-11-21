import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:m_one/core/constants/vectors.dart';
import 'package:m_one/core/extension/build_context.dart';
import 'package:m_one/core/providers/theme_provider.dart';
import 'package:m_one/core/theme/app_sizes.dart';
import 'package:m_one/features/auth/presentation/stores/auth_store.dart';
import 'package:m_one/features/auth/presentation/widgets/login_header_clipper.dart';
import 'package:m_one/features/auth/presentation/widgets/login_page.dart';
import 'package:m_one/features/auth/presentation/widgets/login_sing_up_button.dart';
import 'package:m_one/features/auth/presentation/widgets/sign_in_page.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final PageController _pageController = PageController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  AuthStore? _authStore;
  int _page = 0;

  @override
  void initState() {
    super.initState();

    _authStore = context.read<AuthStore>();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _authStore = context.read<AuthStore>();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _onLoginPressedLogin() async {
    FocusScope.of(context).unfocus();
    if (_authStore == null) return;

    try {
      await _authStore!.login(
        _usernameController.text.trim(),
        _passwordController.text,
      );
      if (_authStore!.isAuthenticated) {
        if (context.mounted && mounted) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Login successful')));
        }
      } else {
        final msg = _authStore!.errorMessage ?? 'Login failed';
        if (context.mounted && mounted) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(msg)));
        }
      }
    } catch (e) {
      final msg = _authStore!.errorMessage ?? 'Login failed';
      if (context.mounted && mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(msg)));
      }
    }
    clearControllers();
  }

  Future<void> _onLoginPressedSignUp() async {
    FocusScope.of(context).unfocus();
    if (_authStore == null) return;
    try {
      await _authStore!.register(
        _usernameController.text.trim(),
        _emailController.text.trim(),
        _passwordController.text,
      );
      if (_authStore!.isAuthenticated) {
        if (context.mounted && mounted) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Registration successful')));
        }
      }
    } catch (e) {
      final msg = _authStore!.errorMessage ?? 'Registration failed';
      if (context.mounted && mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(msg)));
      }
    }
    clearControllers();
  }

  @override
  Widget build(BuildContext context) {
    final colorTheme = context.colorTheme;
    final screenHeight = context.screenSize.height;

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () => context.read<ThemeProvider>().toggleTheme(),
            child: SvgPicture.asset(logo)),
        leadingWidth: 120,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: colorTheme.foregroundPrimaryColor,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: ClipPath(
              clipper: LoginHeaderClipper(),
              child: Container(
                height: screenHeight * 0.35,
                color: colorTheme.backgroundPrimaryColor,
              ),
            ),
          ),
          Positioned(
            top: context.screenSize.height * 0.4,
            left: 0,
            right: 0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Observer(builder: (_) {
                  return AnimatedContainer(
                    padding: EdgeInsets.zero,
                    curve: Curves.easeInOut,
                    duration: const Duration(milliseconds: 400),
                    height: 180,
                    child: _authStore!.isLoading
                        ? CircularProgressIndicator()
                        : PageView(
                            controller: _pageController,
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              LoginPage(
                                userNameController: _usernameController,
                                passwordController: _passwordController,
                              ),
                              SignInPage(
                                userNameController: _usernameController,
                                emailController: _emailController,
                                passwordController: _passwordController,
                              ),
                            ],
                          ),
                  );
                }),
                const SizedBox(height: AppSizes.xxl),
                Observer(builder: (_) {
                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    child: _authStore!.isLoading
                        ? CircularProgressIndicator()
                        : LoginSingUpButton(
                            pageController: _pageController,
                            currentPage: _page,
                            onLongPressLogin: _onLoginPressedLogin,
                            onLongPressSignUp: _onLoginPressedSignUp,
                            onAnimated: (int page) {
                              setState(() {
                                _page = page;
                              });
                              clearControllers();
                            },
                          ),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void clearControllers() {
    _usernameController.clear();
    _emailController.clear();
    _passwordController.clear();
  }
}
