class APIUrl {
  // static const String baseURL = "http://192.168.1.6:19991"; //ip router home2
  // static String baseURL = "https://way-go.vercel.app";
  static const String baseURL = "http://192.168.1.10:19991"; //ip router home
  // static const String baseURL = "http://172.20.10.2:19991"; //ip labtop mobile
  // static const String baseURL = "http://192.168.45.129:19991"; //yaser

  static String register = '$baseURL/customer/register';

  static String login = "$baseURL/customer/login";

  static String removeBook =
      "$baseURL/customer/removeBook/:/:"; //here you have to put number of set and number of the user

  static String updateProfile =
      "$baseURL/customer/updateProfile"; //here you have to put the id of the user in the link

  static String search =
      "$baseURL/customer/searchForTrips"; //read drow.io you have to send some information

  static String refresh =
      "$baseURL/customer/home/:"; //you have to put goFrom in the link as a variable

  static String bookChear = "$baseURL/customer/bookChear";

  static String getChear = "$baseURL/customer/getChear";

  static String saveBooking = "$baseURL/customer/submitBooking";

  static String myReservation = "$baseURL/customer/reservation";

  static String myHistory = "$baseURL/customer/myHistory";


// payment using fatora
  static String createPayment = "https://egate-t.fatora.me/api/create-payment"; //post to create

  static String PaymentStatus = "https://egate-t.fatora.me/api/get-payment-status";// GET: here you have to put the id of the create payment in privios url

  static String revaersal = "https://egate-t.fatora.me/api/cancel-payment";// POST: to cancele payment

}
