import 'package:flutter/material.dart';
import 'app_state.dart';
import 'app_store.dart';

/// StreamBuilder wrapper for UserProgressState
class UserProgressBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, UserProgressState state) builder;
  final Widget? loading;

  const UserProgressBuilder({
    super.key,
    required this.builder,
    this.loading,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UserProgressState>(
      stream: appStore.userProgressStream,
      initialData: appStore.userProgress,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return loading ?? const SizedBox.shrink();
        }
        return builder(context, snapshot.data!);
      },
    );
  }
}

/// StreamBuilder wrapper for NavigationState
class NavigationBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, NavigationState state) builder;
  final Widget? loading;

  const NavigationBuilder({
    super.key,
    required this.builder,
    this.loading,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<NavigationState>(
      stream: appStore.navigationStream,
      initialData: appStore.navigation,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return loading ?? const SizedBox.shrink();
        }
        return builder(context, snapshot.data!);
      },
    );
  }
}

/// StreamBuilder wrapper for ChallengeState
class ChallengeBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, ChallengeState state) builder;
  final Widget? loading;

  const ChallengeBuilder({
    super.key,
    required this.builder,
    this.loading,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ChallengeState>(
      stream: appStore.challengeStream,
      initialData: appStore.challenge,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return loading ?? const SizedBox.shrink();
        }
        return builder(context, snapshot.data!);
      },
    );
  }
}

/// StreamBuilder wrapper for QuestionnaireState
class QuestionnaireBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, QuestionnaireState state) builder;
  final Widget? loading;

  const QuestionnaireBuilder({
    super.key,
    required this.builder,
    this.loading,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuestionnaireState>(
      stream: appStore.questionnaireStream,
      initialData: appStore.questionnaire,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return loading ?? const SizedBox.shrink();
        }
        return builder(context, snapshot.data!);
      },
    );
  }
}

/// StreamBuilder wrapper for LoadingState
class LoadingBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, LoadingState state) builder;

  const LoadingBuilder({
    super.key,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<LoadingState>(
      stream: appStore.loadingStream,
      initialData: appStore.loading,
      builder: (context, snapshot) {
        return builder(context, snapshot.data ?? const LoadingState());
      },
    );
  }
}

/// StreamBuilder wrapper for ErrorState
class ErrorBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, ErrorState state) builder;

  const ErrorBuilder({
    super.key,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ErrorState>(
      stream: appStore.errorStream,
      initialData: appStore.error,
      builder: (context, snapshot) {
        return builder(context, snapshot.data ?? const ErrorState());
      },
    );
  }
}

/// StreamBuilder wrapper for full AppState
class AppStateBuilder extends StatelessWidget {
  final Widget Function(BuildContext context, AppState state) builder;
  final Widget? loading;

  const AppStateBuilder({
    super.key,
    required this.builder,
    this.loading,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AppState>(
      stream: appStore.appStateStream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return loading ?? const Center(child: CircularProgressIndicator());
        }
        return builder(context, snapshot.data!);
      },
    );
  }
}

/// Multi-stream builder for combining multiple streams
class MultiStreamBuilder extends StatelessWidget {
  final List<Stream<dynamic>> streams;
  final Widget Function(BuildContext context, List<AsyncSnapshot<dynamic>> snapshots) builder;
  final Widget? loading;

  const MultiStreamBuilder({
    super.key,
    required this.streams,
    required this.builder,
    this.loading,
  });

  @override
  Widget build(BuildContext context) {
    return _buildNestedStreamBuilders(context, 0, []);
  }

  Widget _buildNestedStreamBuilders(
    BuildContext context,
    int index,
    List<AsyncSnapshot<dynamic>> snapshots,
  ) {
    if (index >= streams.length) {
      return builder(context, snapshots);
    }

    return StreamBuilder<dynamic>(
      stream: streams[index],
      builder: (context, snapshot) {
        final newSnapshots = [...snapshots, snapshot];

        if (!snapshot.hasData && loading != null) {
          // Check if any previous snapshots don't have data
          if (newSnapshots.any((s) => !s.hasData)) {
            return loading!;
          }
        }

        return _buildNestedStreamBuilders(context, index + 1, newSnapshots);
      },
    );
  }
}

/// Mixin for StatefulWidgets that use streams
mixin StreamStateMixin<T extends StatefulWidget> on State<T> {
  final List<dynamic> _subscriptions = [];

  /// Subscribe to a stream and automatically dispose
  void subscribe<S>(Stream<S> stream, void Function(S) onData) {
    final subscription = stream.listen(onData);
    _subscriptions.add(subscription);
  }

  @override
  void dispose() {
    for (final subscription in _subscriptions) {
      subscription.cancel();
    }
    super.dispose();
  }
}

/// Extension methods for easy stream access in widgets
extension StreamContextExtension on BuildContext {
  /// Get current user progress state
  UserProgressState get userProgress => appStore.userProgress;

  /// Get current navigation state
  NavigationState get navigation => appStore.navigation;

  /// Get current challenge state
  ChallengeState get challenge => appStore.challenge;

  /// Get current questionnaire state
  QuestionnaireState get questionnaire => appStore.questionnaire;

  /// Get current loading state
  LoadingState get loading => appStore.loading;

  /// Get current error state
  ErrorState get error => appStore.error;
}
