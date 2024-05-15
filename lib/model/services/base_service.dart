abstract class BaseService {
  final String mediaBaseUrl = "https://fakestoreapi.com/";

  Future<dynamic> getResponse(String url);

}