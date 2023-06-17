import 'package:dartz/dartz.dart';
import 'package:fic5_ecatalog_asrafilll/features/authentication/data/models/login_request_model.dart';
import 'package:fic5_ecatalog_asrafilll/features/authentication/data/models/login_response_model.dart';
import 'package:fic5_ecatalog_asrafilll/features/authentication/data/models/register_request_model.dart';
import 'package:fic5_ecatalog_asrafilll/features/authentication/data/models/register_response_model.dart';
import 'package:fic5_ecatalog_asrafilll/shared/common/api.dart';
import 'package:http/http.dart' as http;

class AuthDataSource {
  Future<Either<String, RegisterResponseModel>> register(
      RegisterRequestModel model) async {
    final response = await http.post(
        Uri.parse(
          '${API.url}/users',
        ),
        body: model.toJson(),
        headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 201) {
      return Right(RegisterResponseModel.fromJson(response.body));
    } else {
      return const Left('Register Error');
    }
  }

  Future<Either<String, LoginResponseModel>> login(
      LoginRequestModel model) async {
    final response = await http.post(Uri.parse('${API.url}/auth/login'),
        body: model.toJson(), headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 201) {
      return Right(LoginResponseModel.fromJson(response.body));
    } else {
      return const Left('Login Failed');
    }
  }
}
