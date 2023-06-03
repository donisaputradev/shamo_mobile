part of 'popular_bloc.dart';

abstract class PopularState extends Equatable {
  const PopularState();

  @override
  List<Object> get props => [];
}

class PopularInitial extends PopularState {}

class PopularLoading extends PopularState {}

class PopularSuccess extends PopularState {
  final List<Product> products;

  const PopularSuccess(this.products);

  @override
  List<Object> get props => [products];
}

class PopularFailure extends PopularState {
  final Failure failure;

  const PopularFailure(this.failure);

  @override
  List<Object> get props => [failure];
}
