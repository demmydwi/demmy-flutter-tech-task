import 'package:home_credit_flutter_task/provider/home_provider.dart';
import 'package:test/test.dart';

void main() {
  group('Home Provider', () {
    final homeProvider = new HomeProvider();

    test("on init state", () async {
      expect(homeProvider.state, HomeState.onLoading);
      expect(homeProvider.responseApi, null);
      expect(homeProvider.errMessage, null);
    });


    test("on complete request", () async {
      final isError = await  homeProvider.getContent();
      expect(isError, false);
      expect(homeProvider.state, HomeState.onLoaded);
      expect(homeProvider.responseApi != null, true);
      expect(homeProvider.errMessage, null);
    });

    test("on error request", () async {
      final isError = await homeProvider.getContent(
          path: "https://private-a8e48-hcidtest.apiary-mock.com/hom");
      expect(isError, true);
      expect(homeProvider.state, HomeState.onError);
      expect(homeProvider.errMessage != null, true);
    });

    test("on no internet request", () async {
      final isError = await homeProvider.getContent(
          path: "No Internet Simulation");
      expect(isError, true);
      expect(homeProvider.state, HomeState.onNoInternet);
      expect(homeProvider.errMessage != null, true);
    });

  });
}
