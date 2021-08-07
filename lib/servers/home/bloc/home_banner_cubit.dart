import 'package:QiYang/apis/api_servers.dart';
import 'package:QiYang/model/request/banner_request_model.dart';
import 'package:QiYang/model/response/banner_response_model.dart';
import 'package:QiYang/util/log_utils.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_banner_state.dart';

class HomeBannerCubit extends Cubit<HomeBannerState> {
  HomeBannerCubit() : super(HomeBannerInitial());

  //加载banner
  Future<void> loadHomeBanner() async {
    Log.v(state, tag: "load Home Banner");
    if (state is HomeBannerInitial) {
      emit(HomeBannerLoaded(await ApiServers().banner(BannerClassify.home)));
    }
  }
}
