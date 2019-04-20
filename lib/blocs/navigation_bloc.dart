import 'package:bloc/bloc.dart';

enum NavigationEvent { toMainStart, toDetail, toMainDone }

class NavigationBloc extends Bloc<NavigationEvent, NavigationEvent> {
  @override
  NavigationEvent get initialState => NavigationEvent.toMainDone;

  @override
  Stream<NavigationEvent> mapEventToState(NavigationEvent event) async* {
    yield event;
  }
}
