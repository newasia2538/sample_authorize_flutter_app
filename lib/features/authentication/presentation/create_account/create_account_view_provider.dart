import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'create_account_view_controller.dart';
import 'create_account_view_state.dart';

final createAccountViewProvider = NotifierProvider<CreateAccountViewController, CreateAccountViewState>(CreateAccountViewController.new);