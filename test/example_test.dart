import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:matcher/matcher.dart' as matcher;

void main() {
  group(
    "Title",
    () {
      test(
        "should return Failure wehen value is emty",
        () {
          // arrange
          var title = Title.create('').fold((err) => err, (title) => title);
          // assert
          expect(title, const matcher.TypeMatcher<Failure>());
        },
      );
    },
  );
}

class Title extends Equatable {
  String? value;

  Title._(this.value);

  static Either<Failure, Title> create(String value) {
    if (value.isEmpty) {
      return Left(Failure("Title cannot be emty of null"));
    } else {
      return Right(Title._(value));
    }
  }

  Title(this.value);
  @override
  List<Object?> get props => [value];
}

class Failure {
  String? message;

  Failure(this.message);
}
