import 'package:chec_nest/core/error/failures.dart';
import 'package:chec_nest/features/home/data/models/product_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, ProductModel>> fetchOneProduct({required int id});
  Future<Either<Failure, List<ProductModel>>> fetchAllProduct();
  Future<Either<Failure, List<ProductModel>>> fetchCategorizedProduct(
      {required String category});
}