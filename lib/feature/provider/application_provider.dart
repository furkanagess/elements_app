import 'package:elements_app/feature/provider/admob_provider.dart';
import 'package:elements_app/feature/provider/localization_provider.dart';
import 'package:elements_app/feature/service/network_service.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

// Uygulamada kullanılan provider'ların tek bir instance'a indirgenerek main.dart'ta initialize edilmesi sağlanır
final class ApplicationProvider {
  static ApplicationProvider? _instance;
  static ApplicationProvider get instance {
    _instance ??= ApplicationProvider._init();
    return _instance!;
  }

  ApplicationProvider._init();
  late String apiType;
  List<SingleChildWidget> appProviders = [
    StreamProvider(
      create: (context) => NetworkService().controller.stream,
      initialData: NetworkStatus.online,
    ),
    ChangeNotifierProvider<LocalizationProvider>(
      create: (context) => LocalizationProvider(),
    ),
    ChangeNotifierProvider<AdmobProvider>(
      create: (context) => AdmobProvider(),
    ),
  ];
}
