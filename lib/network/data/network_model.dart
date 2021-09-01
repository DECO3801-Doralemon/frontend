class NetworkModel<T> {
  Status status;
  T? data;
  String? message;

  NetworkModel.loading(this.message) : status = Status.LOADING;
  NetworkModel.completed(this.data) : status = Status.COMPLETED;
  NetworkModel.error(this.message) : status = Status.ERROR;

  @override
  String toString() {
    return 'Status : $status \n Message : $message \n Data : $data';
  }
}

enum Status { LOADING, COMPLETED, ERROR }
