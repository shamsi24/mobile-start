import 'package:dartz/dartz.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:rht_mobile_template/data/exception/error.dart';
import 'package:rht_mobile_template/presentation/shared/string_x.dart';

typedef RequestDef<T> = Future<Either<HttpException, List<T>>> Function(int args);

class PaginationQuery<T> {
  final PagingController<int, T> pagingController;
  final RequestDef<T> future;

  int nextPageKey = 1;

  PaginationQuery(this.pagingController, this.future) {
    pagingController.addPageRequestListener((pageKey) async {
      final Either<HttpException, List<T>> result = await future(pageKey);
      final isLastPage = result.asRight().isEmpty;
      if (isLastPage && result.isRight()) {
        pagingController.appendLastPage(result.asRight());
      } else {
        if (result.isRight()) {
          ++nextPageKey;
          pagingController.appendPage(result.asRight(), nextPageKey);
        }
      }
    });
  }
}
