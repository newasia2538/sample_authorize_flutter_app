import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sample_authorize_app/core/services/app_secure_storage_service.dart';
import 'package:sample_authorize_app/data/enum/auth_enum.dart';
import 'package:sample_authorize_app/features/authentication/auth_controller.dart';
import 'package:sample_authorize_app/features/authentication/data/firebase_auth_repository_impl.dart';
import 'package:sample_authorize_app/features/authentication/domain/firebase_auth_repository.dart';

final appSecureStorageProvider = Provider<AppSecureStorageService>((ref){
  return AppSecureStorageService(
      storage: FlutterSecureStorage(
          aOptions: const AndroidOptions(
            encryptedSharedPreferences: true,
          )
      )
  );
});

final authControlerProvider = AsyncNotifierProvider<AuthController, AuthenticateStatus>(AuthController.new);

final fireBaseAuth = Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);
final authRepositoryProvider = Provider<FirebaseAuthRepository>((ref) =>
   FireBaseAuthRepositoryImpl(firebaseAuth: ref.read(fireBaseAuth))
);