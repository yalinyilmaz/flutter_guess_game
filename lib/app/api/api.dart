import 'package:flutter_guess_game/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiClientProvider = Provider<ApiClient>((ref) {
  return ApiClient(ref);
});

ApiClient get api => container.read(apiClientProvider);

class ApiClient {
  ApiClient(this.ref);

  final Ref ref;


  //late final UserAuthClient firbaseAuth = UserAuthClient();



}
