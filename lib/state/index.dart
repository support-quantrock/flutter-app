/// Stream-based State Management
///
/// Usage:
/// ```dart
/// import 'package:myapp/state/index.dart';
///
/// // Access current state
/// final qp = appStore.userProgress.totalQP;
///
/// // Update state
/// appStore.addQP(50);
/// appStore.setCurrentTab(2);
///
/// // Use stream builders in widgets
/// UserProgressBuilder(
///   builder: (context, state) => Text('QP: ${state.totalQP}'),
/// )
/// ```
library;

export 'app_state.dart';
export 'app_store.dart';
export 'stream_builder_widgets.dart';
