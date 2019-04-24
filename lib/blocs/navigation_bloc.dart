import 'package:bloc/bloc.dart';

enum NavigationAction { toMainStart, toDetail, toMainDone }

class NavigationEvent {
  final NavigationAction action;
  final int targetFolderIndex;

  const NavigationEvent({
    this.action,
    this.targetFolderIndex,
  });
}

class NavigationBloc extends Bloc<NavigationEvent, int> {
  @override
  int get initialState => -1;

  @override
  Stream<int> mapEventToState(NavigationEvent event) async* {
    switch (event.action) {
      case NavigationAction.toDetail:
        yield event.targetFolderIndex;
        break;
      case NavigationAction.toMainDone:
        yield -1;
        break;
      case NavigationAction.toMainStart:
        yield event.targetFolderIndex;
        break;
    }
  }
}
