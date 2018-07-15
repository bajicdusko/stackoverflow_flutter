import 'dart:async';

abstract class UseCase<M>{
  Future<Stream<M>> build(List<String> filters);
}