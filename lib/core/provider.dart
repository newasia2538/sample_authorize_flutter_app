import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_authorize_app/core/services/app_secure_storage_service.dart';

final secureStorageProvider = Provider<AppSecureStorageService>((ref) {
  return AppSecureStorageService();
});