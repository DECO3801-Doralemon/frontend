import 'package:dio/dio.dart';
import 'package:mockito/mockito.dart';

class MockHttpClient extends Mock implements Dio {}

var dio;

void getDioInstance(String env) {
  dio = env == 'build' ? Dio() : MockHttpClient();
}

// void mockLokasiDependencies() {
//   when(dio.get(
//     any,
//   )).thenAnswer((_) async {
//     final expected = Future<Response<List<Map<String, dynamic>>>>.value(
//         Response<List<Map<String, dynamic>>>(statusCode: 200, data: [
//       {
//         'id': 1,
//         'name': 'Soppeng',
//         'latitude': 100039203300.0,
//         'longitude': 100000000000.0,
//         'alamat': 'Jalan Margonda Raya',
//         'no_telp': '081111111111',
//         'image': 'test.jpg'
//       }
//     ]));
//     return expected;
//   });
// }
//
// void mockFasilitasDependencies(Map<String, dynamic> mockFasilitas) {
//   when(dio.get(
//     any,
//   )).thenAnswer((_) async {
//     final expected = Future<Response<Map<String, dynamic>>>.value(
//         Response<Map<String, dynamic>>(statusCode: 200, data: mockFasilitas));
//     return expected;
//   });
// }
