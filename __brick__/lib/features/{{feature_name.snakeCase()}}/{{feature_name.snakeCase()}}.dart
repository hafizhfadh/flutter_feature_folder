export 'screens/screens.dart';
export 'widgets/widgets.dart';{{#isModel}}
export 'package:{{{fullPath}}}/domains/models/models.dart';{{/isModel}}{{#isProvider}}
export 'package:{{{fullPath}}}/provider/providers.dart';{{/isProvider}}{{#isRiverpod}}
export 'package:{{{fullPath}}}/provider/providers.dart';{{/isRiverpod}}
