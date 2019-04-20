import 'package:bloc/bloc.dart';

enum AppBarEvent { hide, show }

class AppBarBloc extends Bloc<AppBarEvent, AppBarEvent> {
  @override
  AppBarEvent get initialState => AppBarEvent.show;

  @override
  Stream<AppBarEvent> mapEventToState(AppBarEvent event) async* {
    yield event;
  }
}
