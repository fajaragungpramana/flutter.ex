import 'package:flutter_ex/core/data/local/hive_service.dart';
import 'package:flutter_ex/core/data/remote/app/app_remote_service.dart';
import 'package:flutter_ex/core/data/remote/auth/auth_repository.dart';
import 'package:flutter_ex/core/data/remote/auth/auth_repository_impl.dart';
import 'package:flutter_ex/core/data/remote/auth/auth_service.dart';
import 'package:flutter_ex/core/data/remote/user/user_repository.dart';
import 'package:flutter_ex/core/data/remote/user/user_repository_impl.dart';
import 'package:flutter_ex/core/data/remote/user/user_service.dart';
import 'package:get/get.dart';

class DataModule {
  const DataModule._();

  static void onInit() async {
    Get.put(HiveService(), permanent: true);
    Get.put(AppRemoteService(Get.find()), permanent: true);

    Get.put(AuthService(Get.find()), permanent: true);
    Get.put<AuthRepository>(AuthRepositoryImpl(Get.find(), Get.find()), permanent: true);

    Get.put(UserService(Get.find()), permanent: true);
    Get.put<UserRepository>(UserRepositoryImpl(Get.find()), permanent: true);
  }

}