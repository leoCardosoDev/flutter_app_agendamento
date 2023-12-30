import '../core/flavor/flavor_config.dart';
import 'app.dart';

void main() {
  bootstrap(FlavorConfig(baseUrl: 'www.google.com', flavor: AppFlavor.prod));
}
