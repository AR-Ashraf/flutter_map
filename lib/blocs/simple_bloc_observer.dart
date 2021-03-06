import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(Cubit cubit, Object error, StackTrace stackTrace) {
    if (cubit is Bloc) {
      // it's a bloc!
    } else {
      // it's just a cubit!
    }

    super.onError(cubit, error, stackTrace);
    print(error);
  }
}
