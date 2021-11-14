import 'package:qi_yang/app/net/const/response_format.dart';
import 'package:qi_yang/app/net/entity/base_entity.dart';

import 'package:qi_yang/models/response/test_entity.dart';

import 'abstract_http_repository.dart';

//模拟网络请求
class MockHttpRepository extends AbstractHttpRepository {

  static MockHttpRepository get instance => MockHttpRepository();

  BaseEntity<T> _getBaseEntity<T>(dynamic data) {
    return BaseEntity.fromJson({
      ResponseFormat.code: 200,
      ResponseFormat.data: data,
      ResponseFormat.message: "success"
    });
  }

  @override
  Future<BaseEntity<TestEntity>> test() {
    return Future.value(_getBaseEntity(TestEntity().toJson()));
  }
}
