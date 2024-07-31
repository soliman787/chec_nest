
import 'package:chec_nest/core/error/failures.dart';
import 'package:chec_nest/core/utils/api_service.dart';
import 'package:chec_nest/features/home/data/models/product_model.dart';
import 'package:chec_nest/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<ProductModel>>> fetchAllProduct() async {
    try {
      final response = await apiService.get(endPoint: 'products');
      List<ProductModel> products = (response as List)
          .map((json) => ProductModel.fromJson(json))
          .toList();
      return Right(products);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  // You would need to implement the other methods in a similar fashion
  @override
  Future<Either<Failure, ProductModel>> fetchOneProduct({required int id}) async {
    try {
      final response = await apiService.get(endPoint: 'products/$id');
      ProductModel product = ProductModel.fromJson(response);
      return Right(product);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }

  @override
  Future<Either<Failure, List<ProductModel>>> fetchCategorizedProduct({required String category}) async {
    try {
      final response = await apiService.get(endPoint: 'products/category/$category');
      List<ProductModel> products = (response as List)
          .map((json) => ProductModel.fromJson(json))
          .toList();
      return Right(products);
    } catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioError(e));
      } else {
        return Left(ServerFailure(e.toString()));
      }
    }
  }
}
