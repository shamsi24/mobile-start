import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:shamsi_mobile_template/presentation/shared/string_x.dart';

typedef RequestDef<T> = Future<Either<HttpException, List<T>>> Function(
    int args);

class PaginationQuery<T> {
  final PagingController<int, T> pagingController;
  final RequestDef<T> future;

  int nextPageKey = 1;

  PaginationQuery(this.pagingController, this.future) {
    (pagingController as dynamic).addPageRequestListener((pageKey) async {
      final Either<HttpException, List<T>> result = await future(pageKey);

      if (result.isRight()) {
        final items = result.asRight();
        final isLastPage = items.isEmpty;
        if (isLastPage) {
          (pagingController as dynamic).appendLastPage(items);
        } else {
          ++nextPageKey;
          (pagingController as dynamic).appendPage(items, nextPageKey);
        }
      }
    });
  }
}
