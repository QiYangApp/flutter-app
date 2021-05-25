import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'guide_page_event.dart';
part 'guide_page_state.dart';

class GuidePageBloc extends Bloc<GuidePageEvent, GuidePageState> {
  GuidePageBloc(bool readingStatus) : super(GuidePageInitial(readingStatus));

  @override
  Stream<GuidePageState> mapEventToState(
    GuidePageEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
