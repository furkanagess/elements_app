import 'package:elements_app/feature/provider/admob_provider.dart';
import 'package:elements_app/feature/provider/localization_provider.dart';
import 'package:elements_app/feature/service/network_service.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

/// The `ApplicationProvider` class is a singleton provider for managing
/// various application-level providers in your Flutter application. It provides
/// a central location to initialize and access these providers.
class ApplicationProvider {
  static ApplicationProvider? _instance;

  /// Singleton instance getter for accessing the `ApplicationProvider`.
  static ApplicationProvider get instance {
    _instance ??= ApplicationProvider._init();
    return _instance!;
  }

  /// Private constructor for initializing the `ApplicationProvider`.
  ApplicationProvider._init();

  /// Represents the type of API being used by the application.
  late String apiType;

  /// List of application-level providers that can be used within the app.
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
