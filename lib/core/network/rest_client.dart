import 'package:dio/dio.dart';
import 'package:rentee/core/network/constants.dart';
import 'package:rentee/core/network/interceptors/endpoints.dart';
import 'package:rentee/data/models/room/room_model.dart';
import 'package:retrofit/http.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  // @GET(EndPoints.allRooms)
  // Future<List<RoomModel>> getAllRoomsList();
}
