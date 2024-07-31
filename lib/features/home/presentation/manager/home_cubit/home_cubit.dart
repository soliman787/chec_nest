import 'package:bloc/bloc.dart';
import 'package:chec_nest/features/home/data/models/product_model.dart';
import 'package:chec_nest/features/home/data/repos/home_repo.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo homeRepo;

  HomeCubit(this.homeRepo) : super(HomeInitial());

  Future<void> fetchAllProducts() async {
    emit(HomeLoading());
    var result = await homeRepo.fetchAllProduct();
    result.fold((failure) {
      emit(HomeFailure(failure.errMessage));
    }, (products) {
      emit(HomeSuccess(products));
    });
  }
}
