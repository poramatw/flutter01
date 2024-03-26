class HomeModel {
  final String image;
  final String header;
  final String detail;
  final String comment;
  late bool isFav;
  late bool isBook;

  HomeModel({
    required this.image,
    required this.header,
    required this.detail,
    required this.comment,
    required this.isFav,
    required this.isBook,
  });

  static List<HomeModel> addModel() {
    List<HomeModel> getModel = [];

    getModel.add(
      HomeModel(
          image:
              'https://storage.googleapis.com/cms-storage-bucket/70760bf1e88b184bb1bc.png',
          header: 'header',
          detail: 'detail',
          comment: 'comment',
          isFav: true,
          isBook: true),
    );

    getModel.add(
      HomeModel(
          image:
              'https://storage.googleapis.com/cms-storage-bucket/70760bf1e88b184bb1bc.png',
          header: 'header',
          detail: 'detail',
          comment: 'comment',
          isFav: true,
          isBook: true),
    );

    getModel.add(
      HomeModel(
          image:
              'https://storage.googleapis.com/cms-storage-bucket/70760bf1e88b184bb1bc.png',
          header: 'header',
          detail: 'detail',
          comment: 'comment',
          isFav: true,
          isBook: true),
    );

    getModel.add(
      HomeModel(
          image:
              'https://storage.googleapis.com/cms-storage-bucket/70760bf1e88b184bb1bc.png',
          header: 'header',
          detail: 'detail',
          comment: 'comment',
          isFav: true,
          isBook: true),
    );
    getModel.add(
      HomeModel(
          image:
              'https://storage.googleapis.com/cms-storage-bucket/70760bf1e88b184bb1bc.png',
          header: 'header',
          detail: 'detail',
          comment: 'comment',
          isFav: true,
          isBook: true),
    );
    getModel.add(
      HomeModel(
          image:
              'https://storage.googleapis.com/cms-storage-bucket/70760bf1e88b184bb1bc.png',
          header: 'header',
          detail: 'detail',
          comment: 'comment',
          isFav: true,
          isBook: true),
    );
    getModel.add(
      HomeModel(
          image:
              'https://storage.googleapis.com/cms-storage-bucket/70760bf1e88b184bb1bc.png',
          header: 'header',
          detail: 'detail',
          comment: 'comment',
          isFav: true,
          isBook: true),
    );
    getModel.add(
      HomeModel(
          image:
              'https://storage.googleapis.com/cms-storage-bucket/70760bf1e88b184bb1bc.png',
          header: 'header',
          detail: 'detail',
          comment: 'comment',
          isFav: true,
          isBook: true),
    );
    getModel.add(
      HomeModel(
          image:
              'https://storage.googleapis.com/cms-storage-bucket/70760bf1e88b184bb1bc.png',
          header: 'header',
          detail: 'detail',
          comment: 'comment',
          isFav: true,
          isBook: true),
    );
    getModel.add(
      HomeModel(
          image:
              'https://storage.googleapis.com/cms-storage-bucket/70760bf1e88b184bb1bc.png',
          header: 'header',
          detail: 'detail',
          comment: 'comment',
          isFav: true,
          isBook: true),
    );

    return getModel;
  }
}
