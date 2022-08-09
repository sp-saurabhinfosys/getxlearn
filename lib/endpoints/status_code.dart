import 'dart:developer';

apiResponseStatus(int status) {
  switch (status) {
    case 200:
      log("Success");
      break;
    case 201:
      log("Created Success");
      break;
    case 404:
      log("Page not Found");
      break;
    case 500:
      log("Internal Server Error");
      break;
    default:
      log("Something went wrong");
  }
}
