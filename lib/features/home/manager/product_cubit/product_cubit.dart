import 'package:ecommerceapp/core/utils/app_assets.dart';
import 'package:ecommerceapp/features/home/manager/product_cubit/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/products_model.dart';
import '../../data/repo/product_repo.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final ProductsRepository repository;

  ProductsCubit({required this.repository}) : super(ProductsInitial());

  final List<Product> _mockProducts = [
    Product(
      categoryId: '1',
      name: "Mens Starry",
      price: '99.99',
      image: AppAssets.tShirt,
      description: 'Mens Starry Sky Printed Shirt 100% Cotton Fabric',
      rating: '1,52,344',
    ),
    Product(
      categoryId: '2',
      name: "Mens Starry",
      price: '149.99',
      image: AppAssets.tShirt,
      description: 'Mens Starry Sky Printed Shirt 100% Cotton Fabric',
      rating: '1,52,344',
    ),
    Product(
      categoryId: '3',
      name: "Mens Starry",
      price: '79.99',
      image: AppAssets.tShirt,
      description: 'Mens Starry Sky Printed Shirt 100% Cotton Fabric',
      rating: '1,52,344',
    ),
    Product(
      categoryId: '3',
      name: "Mens Starry",
      price: '79.99',
      image: AppAssets.tShirt,
      description: 'Mens Starry Sky Printed Shirt 100% Cotton Fabric',
      rating: '1,52,344',
    ),
    Product(
      categoryId: '3',
      name: "Mens Starry",
      price: '79.99',
      image: AppAssets.tShirt,
      description: 'Mens Starry Sky Printed Shirt 100% Cotton Fabric',
      rating: '1,52,344',
    ),
    Product(
      categoryId: '3',
      name: "Mens Starry",
      price: '79.99',
      image: AppAssets.tShirt,
      description: 'Mens Starry Sky Printed Shirt 100% Cotton Fabric',
      rating: '1,52,344',
    ),
    Product(
      categoryId: '3',
      name: "Mens Starry",
      price: '79.99',
      image: AppAssets.tShirt,
      description: 'Mens Starry Sky Printed Shirt 100% Cotton Fabric',
      rating: '1,52,344',
    ),
    Product(
      categoryId: '3',
      name: "Mens Starry",
      price: '79.99',
      image: AppAssets.tShirt,
      description: 'Mens Starry Sky Printed Shirt 100% Cotton Fabric',
      rating: '1,52,344',
    ),
  ];

  Future<void> getAllProducts() async {
    emit(ProductsLoading());
    await Future.delayed(const Duration(seconds: 1));
    emit(ProductsLoaded(_mockProducts));
  }
}
