import 'package:QiYang/servers/common/api/banner_apis.dart';
import 'package:QiYang/servers/common/model/banner_model.dart';
import 'package:QiYang/util/log_utils.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_banner_state.dart';

class HomeBannerCubit extends Cubit<HomeBannerState> {
  HomeBannerCubit() : super(HomeBannerInitial());

  //加载banner
  Future<void> loadHomeBanner() async {
    Log.v(state);
    if (state is HomeBannerInitial) {
      BannerModel bannerModel;
      await BannerServer.cacheBanner(BannerClassify.home)
          .then((value) => bannerModel = value);

      Log.v(1111);
      Log.v(bannerModel);
      emit(HomeBannerLoaded(bannerModel));
    }
  }
}
