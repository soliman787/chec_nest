import 'package:bloc/bloc.dart';
import 'package:chec_nest/features/home/data/models/product_model.dart';
import 'package:chec_nest/features/home/data/repos/home_repo.dart';
import 'package:meta/meta.dart';

part 'category_product_state.dart';

class CategoryProductCubit extends Cubit<CategoryProductState> {
  final HomeRepo homeRepo;

  CategoryProductCubit(this.homeRepo) : super(CategoryProductInitial());

  Future<void> fetchCategorizedProducts({required String category}) async {
    emit(CategoryProductLoading());
    var result = await homeRepo.fetchCategorizedProduct(category: category);
    result.fold((failure) {
      emit(CategoryProductFailure(failure.errMessage));
    }, (products) {
      emit(CategoryProductSuccess(products));
    });
  }
}
