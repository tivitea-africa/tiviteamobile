import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:tivi_tea/core/config/extensions/build_context_extensions.dart';
import 'package:tivi_tea/core/const/app_colors.dart';
import 'package:tivi_tea/core/router/app_routes.dart';
import 'package:tivi_tea/core/theme/extensions/theme_extensions.dart';
import 'package:tivi_tea/core/utils/enums.dart';
import 'package:tivi_tea/core/utils/logger.dart';
import 'package:tivi_tea/core/utils/validators.dart';
import 'package:tivi_tea/features/common/app_button.dart';
import 'package:tivi_tea/features/common/app_onboarding_scaffold.dart';
import 'package:tivi_tea/features/common/app_svg_widget.dart';
import 'package:tivi_tea/features/common/app_text_field.dart';
import 'package:tivi_tea/features/login/model/general/login_request_object.dart';
import 'package:tivi_tea/features/login/view_model/login_notifier.dart';
import 'package:tivi_tea/features/login/view_model/login_state.dart';
import 'package:tivi_tea/gen/assets.gen.dart';
import 'package:tivi_tea/l10n/extensions/l10n_extensions.dart';
import 'package:tivi_tea/models/enums/enums.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController emailNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  final _formKey = GlobalKey<FormState>();
  bool isEnabled = false;
  bool obscurePass = true;
  bool rememberMe = false;

  @override
  void initState() {
    super.initState();
    // Give focus to the first text field when the page initializes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      emailFocusNode.requestFocus();
    });
    
    // Listen to focus changes to detect keyboard visibility
    emailFocusNode.addListener(() {
      setState(() {});
    });
    passwordFocusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    emailNameController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  void _obscurePass() {
    obscurePass = !obscurePass;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return OnboardingScaffold(
      showActionButtons: (showBackButton: false, showSkip: false),
      body: Form(
        key: _formKey,
        onChanged: () {
          setState(() {
            isEnabled = _formKey.currentState!.validate();
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.l10n.login,
              textAlign: TextAlign.center,
              style: context.theme.textTheme.displayLarge,
            ),
            10.verticalSpace,
            Text(
              context.l10n.provideCredentials,
              textAlign: TextAlign.center,
              style: context.theme.textTheme.displaySmall?.copyWith(
                color: const Color(0xFF737380),
              ),
            ),
            20.verticalSpace,
            AppTextField(
              controller: emailNameController,
              focusNode: emailFocusNode,
              label: context.l10n.email,
              hintText: context.l10n.emailHintText,
              suffixIcon: AppSvgWidget(
                path: Assets.svgs.envelope,
                fit: BoxFit.scaleDown,
              ),
              validateFunction: Validators.email(),
            ),
            AppTextField(
              controller: passwordController,
              focusNode: passwordFocusNode,
              label: context.l10n.password,
              hintText: context.l10n.enterPass,
              obscureText: obscurePass,
              suffixIcon: InkWell(
                onTap: _obscurePass,
                child: AppSvgWidget(
                  path: obscurePass ? Assets.svgs.eye : Assets.svgs.eyeSlash,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // AppCheckbox(
                //   onChanged: (value) {
                //     rememberMe = value;
                //     setState(() {});
                //   },
                // ),
                // 5.horizontalSpace,
                // Text(
                //   context.l10n.rememberMe,
                //   style: context.theme.textTheme.labelSmall,
                // ),
                // const Spacer(),
                InkWell(
                  onTap: () => context.push(AppRoutes.forgotPasswordView),
                  child: Text(
                    '${context.l10n.forgotPassword}?',
                    style: context.theme.textTheme.labelSmall?.copyWith(
                      color: AppColors.danger,
                    ),
                  ),
                ),
              ],
            ),
            40.verticalSpace,
            Consumer(
              builder: (context, ref, _) {
                final loadState = ref.watch(
                  loginNotifierProvider.select(
                    (value) => value.loadState,
                  ),
                );
                final isLoading = loadState == LoadState.loading;
                return AppButton(
                  buttonText: context.l10n.logIntoAccount,
                  isLoading: isLoading,
                  isEnabled: isEnabled,
                  onPressed: () => _login(ref),
                );
              },
            ),
            10.verticalSpace,
            Consumer(
              builder: (context, ref, _) {
                final loadState = ref.watch(
                  loginNotifierProvider.select(
                    (value) => value.signInWithGoogleLoadState,
                  ),
                );
                final isLoading = loadState == LoadState.loading;
                return AppButton(
                  buttonText: context.l10n.googleContinue,
                  isLoading: isLoading,
                  backgroundColor: Colors.white,
                  borderColor: const Color(0xFFD8D8DD),
                  textStyle: context.theme.textTheme.displaySmall?.copyWith(
                    color: const Color(0xFF737380),
                  ),
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(right: 10.w),
                    child: Assets.images.google.image(
                      fit: BoxFit.scaleDown,
                      width: 20,
                    ),
                  ),
                  onPressed: () => _signInWithGoogle(ref),
                );
              },
            ),
            10.verticalSpace,
            Consumer(
              builder: (context, ref, _) {
                final loadState = ref.watch(
                  loginNotifierProvider.select(
                    (value) => value.signInWithAppleLoadState,
                  ),
                );
                final isLoading = loadState == LoadState.loading;
                return AppButton(
                  buttonText: 'Continue with Apple',
                  isLoading: isLoading,
                  backgroundColor: Colors.black,
                  borderColor: Colors.black,
                  textStyle: context.theme.textTheme.displaySmall?.copyWith(
                    color: Colors.white,
                  ),
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(right: 10.w),
                    child: Icon(
                      Icons.apple,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  onPressed: () => _signInWithApple(ref),
                );
              },
            ),
            10.verticalSpace,
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: context.l10n.dontHaveAccount,
                style: context.theme.textTheme.displaySmall,
                children: [
                  TextSpan(
                    text: context.l10n.signUp,
                    style: context.theme.textTheme.displaySmall?.copyWith(
                      color: const Color(0xFFEC8305),
                      fontWeight: FontWeight.w700,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap =
                          () => context.push(AppRoutes.selectUserTypeView),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomChildren: Consumer(
        builder: (context, ref, _) {
          // Check if any text field has focus (keyboard is visible)
          final isKeyboardVisible = emailFocusNode.hasFocus || passwordFocusNode.hasFocus;
          
          // Hide the guest login button when keyboard is visible
          if (isKeyboardVisible) {
            return const SizedBox.shrink();
          }
          
          return Padding(
            padding: const EdgeInsets.only(bottom: 32.0),
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () => _onGuestLoginSuccess(ref),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  'Continue as a Guest',
                  style: context.theme.textTheme.displaySmall?.copyWith(
                    color: const Color(0xFFEC8305),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _login(WidgetRef ref) {
    final data = LoginRequestObject(
      email: emailNameController.text,
      password: passwordController.text,
    );

    final notifier = ref.read(loginNotifierProvider.notifier);
    notifier.login(
      data,
      onSuccess: (entityType) => _onLoginSuccess(ref, entityType),
      onError: (error) => context.showError(error),
    );
  }

  void _signInWithGoogle(WidgetRef ref) {
    final notifier = ref.read(loginNotifierProvider.notifier);
    notifier.signInWithGoogle(
      onSuccess: (entityType) => _onLoginSuccess(ref, entityType),
      onError: (error) => context.showError(error),
    );
  }

  void _signInWithApple(WidgetRef ref) {
    final notifier = ref.read(loginNotifierProvider.notifier);
    notifier.signInWithApple(
      onSuccess: (entityType) => _onLoginSuccess(ref, entityType),
      onError: (error) {
        debugLog(error);
        context.showError(error);
      },
    );
  }

  void _onLoginSuccess(WidgetRef ref, EntityType? entityType) {
    final notifier = ref.read(loginNotifierProvider.notifier);
    notifier.setAppAccessState(AppAccessState.user);
    context.go(AppRoutes.homeView, extra: entityType);
  }

  void _onGuestLoginSuccess(WidgetRef ref) {
    final notifier = ref.read(loginNotifierProvider.notifier);
    notifier.setAppAccessState(AppAccessState.guest);
    context.go(AppRoutes.homeView);
  }
}
