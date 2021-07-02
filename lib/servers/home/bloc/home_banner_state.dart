// part of 'home_banner_bloc.dart';
part of 'home_banner_cubit.dart';


abstract class HomeBannerState extends Equatable {
  const HomeBannerState();

  @override
  List<Object> get props => [];
}

class HomeBannerInitial extends HomeBannerState {

}

//加载完成事件
class HomeBannerLoaded extends HomeBannerState {
  final BannerModel bannerModel;

  HomeBannerLoaded(this.bannerModel);

  @override
  List<Object> get props => [bannerModel];
}


