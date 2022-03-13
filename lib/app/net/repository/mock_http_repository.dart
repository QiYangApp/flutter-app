import 'package:qi_yang/app/net/const/response_format.dart';
import 'package:qi_yang/app/net/entity/base_entity.dart';
import 'package:qi_yang/models/request/refresh_token_request.dart';
import 'package:qi_yang/models/response/refresh_token_response_entity.dart';
import 'package:qi_yang/models/response/test_entity.dart';

import 'abstract_http_repository.dart';

//模拟网络请求
class MockHttpRepository extends AbstractHttpRepository {
  static MockHttpRepository get instance => MockHttpRepository();

  BaseEntity<T> _getBaseEntity<T>(T data) {
    return BaseEntity.fromJson({
      ResponseFormat.code: 200,
      ResponseFormat.data: data,
      ResponseFormat.message: "success"
    });
  }

  Future<BaseEntity<T>> _format<T>(dynamic data) {
    return Future.value(_getBaseEntity(data));
  }

  @override
  Future<BaseEntity<TestEntity>> test() {
    return _format<TestEntity>(TestEntity.fromJson({"test":1}));
  }

  @override
  Future<BaseEntity<RefreshTokenResponseEntity>> refreshToken() {
    return _format<RefreshTokenResponseEntity>(RefreshTokenRequest().toJson());
  }
}
