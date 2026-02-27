
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_authorize_app/features/authentication/presentation/widgets/sign_in/sign_in_email_widget/sign_in_email_widget_controller.dart';
import 'package:sample_authorize_app/features/authentication/presentation/widgets/sign_in/sign_in_email_widget/sign_in_email_widget_state.dart';

final signInEmailProvider = NotifierProvider<SignInEmailWidgetController, SignInEmailWidgetState>(SignInEmailWidgetController.new);