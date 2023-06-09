part of 'category_bloc.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategorySuccess extends CategoryState {
  final List<Category> categories;

  const CategorySuccess(this.categories);

  @override
  List<Object> get props => [categories];
}

class CategoryFailure extends CategoryState {
  final Failure failure;

  const CategoryFailure(this.failure);

  @override
  List<Object> get props => [failure];
}
