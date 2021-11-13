//https://stackoverflow.com/questions/65307103/how-to-mock-database-in-flutter
//https://github.com/simplezhli/flutter_deer/blob/master/lib/net/base_entity.dart
//部分设计以上设计
import 'dart:io';
import 'package:qi_yang/app/net/entity/base_entity.dart';
import 'package:qi_yang/models/response/test_entity.dart';
import 'package:retrofit/retrofit.dart';


abstract class AbstractHttpRepository {
  const AbstractHttpRepository();

  @GET("/test")
  Future<BaseEntity<TestEntity>> test();
}