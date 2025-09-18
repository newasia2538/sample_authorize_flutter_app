import 'package:flutter_riverpod/legacy.dart';
import 'package:sample_authorize_app/presentation/create_account/create_account_view_controller.dart';
import 'package:sample_authorize_app/presentation/create_account/create_account_view_state.dart';

final createAccountViewProvider = StateNotifierProvider<CreateAccountViewController, CreateAccountViewState>((ref) => CreateAccountViewController());