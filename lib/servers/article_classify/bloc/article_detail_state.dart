part of 'article_detail_cubit.dart';

abstract class ArticleDetailState extends Equatable {
  const ArticleDetailState();

  @override
  List<Object> get props => [];
}

class ArticleDetailInitial extends ArticleDetailState {
  final String id;

  ArticleDetailInitial(this.id);

  @override
  List<Object> get props => [id];
}

//加载完成
class ArticleDetailLoadedState extends ArticleDetailState {

  final ArticleDetailResponseModel model;

  ArticleDetailLoadedState(this.model);

  @override
  List<Object> get props => [model];
}

//不存在
class ArticleDetailNotFundState extends ArticleDetailState {

}
