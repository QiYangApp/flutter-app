import 'package:qi_yang/apis/api_servers.dart';
import 'package:qi_yang/model/response/article_detail_response_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'article_detail_state.dart';

class ArticleDetailCubit extends Cubit<ArticleDetailState> {
  ArticleDetailCubit(String id) : super(ArticleDetailInitial(id));

  //加载数据
  void load() async {
    if (state is ArticleDetailInitial) {
      //todo 想要调整兼容文章不存在情况
      dynamic model =
          await ApiServers().articleDetail((state as ArticleDetailInitial).id);
      emit(ArticleDetailLoadedState(model));
    }
  }
}
