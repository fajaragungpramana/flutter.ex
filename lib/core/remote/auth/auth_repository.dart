import 'package:flutter_ex/core/app/app_response.dart';
import 'package:flutter_ex/core/remote/auth/request/login_request.dart';
import 'package:flutter_ex/core/remote/auth/response/login_response.dart';

abstract class AuthRepository {

  Future<AppResponse<LoginResponse>> login(LoginRequest loginRequest);

}