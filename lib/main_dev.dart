import 'core/flavors/flavor_config.dart';
import 'app.dart';

void main() {
  bootstrap(FlavorConfig(baseUrl: 'www.google.com', flavor: AppFlavor.dev));
}
