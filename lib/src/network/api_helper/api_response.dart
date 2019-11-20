class DataResponse<T> {
  Status status;

  T data;

  String message;

  DataResponse.loading(this.message) : status = Status.LOADING;

  DataResponse.completed(this.data) : status = Status.COMPLETED;

  DataResponse.error(this.message) : status = Status.ERROR;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}

enum Status { LOADING, COMPLETED, ERROR }
