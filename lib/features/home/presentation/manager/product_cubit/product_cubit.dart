import 'package:bloc/bloc.dart';
import 'package:chec_nest/features/home/data/models/product_model.dart';
import 'package:chec_nest/features/home/data/repos/home_repo.dart';
import 'package:meta/meta.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {

  final HomeRepo homeRepo;

  ProductCubit(this.homeRepo) : super(ProductInitial());

  Future<void> fetchAProduct({required int id}) async {
    emit(ProductLoading());
    var result = await homeRepo.fetchOneProduct(id: id);
    result.fold((failure){
      emit(ProductFailure(failure.errMessage));
    }, (product){
      emit(ProductSuccess(product));
    });

  }

}
