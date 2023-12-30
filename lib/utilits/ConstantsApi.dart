enum Environment { DEV, STAGING, PROD }

class ConstantApi {
  static Map<String, dynamic> _config = _Config.debugConstants;

  static String loginUrl = SERVER_ONE + "authentication/login";
  static String registrationUrl = SERVER_ONE + "authentication/registration";
  static String otpVerificationUrl = SERVER_ONE + "authentication/otp_verification";
  static String resentOtpVerificationUrl = SERVER_ONE + "authentication/resend_otp";
  static String homeDashBoardUrl = SERVER_ONE + "home/home_dashboard";
  static String onlineListUrl = SERVER_ONE + "task/online_category_task_list";
  static String doorStepListUrl = SERVER_ONE + "task/doorstep_category_task_list";
  static String emergencyTaskListUrl = SERVER_ONE + "task/emergency_category_task_list";
  static String taskDetailUrl = SERVER_ONE + "task/task_detail";
  static String bookingStep1Url = SERVER_ONE + "bookings/step1";
  static String bookingStep2Url = SERVER_ONE + "bookings/step2";
  static String profileUrl = SERVER_ONE + "profile/get_profile";
  static String createTaskUrl = SERVER_ONE + "task/create_customer_task";
  static String reviewListUrl = SERVER_ONE + "review/reviews_list";
  static String doorStepBookingUrl = SERVER_ONE + "bookings/door_step_booking_list";
  static String emegencyBookingUrl = SERVER_ONE + "bookings/emergency_booking_list";
  static String onlineBookingUrl = SERVER_ONE + "bookings/online_booking_list";
  static String bookingRejectionUrl = SERVER_ONE + "bookings/booking_rejection";
  static String addReviewUrl = SERVER_ONE + "review/add_review";
  static String reviewDetailUrl = SERVER_ONE + "review/add_review_page";
  static String bookingRecheduleUrl = SERVER_ONE + "bookings/reschedule_booking";
  static String favouriteListUrl = SERVER_ONE + "favorites/favorite_list";
  static String addFavouriteUrl = SERVER_ONE + "favorites/add_favorite";
  static String notificationListUrl = SERVER_ONE + "notification/notification_list";

  static String SOMETHING_WRONG = "Some thing wrong";
  static String NO_INTERNET = "No internet Connection";
  static String BAD_RESPONSE = "Bad Response";
  static String UNAUTHORIZED = "Un Athurized";

  static void setEnvironment(Environment env) {
    switch (env) {
      case Environment.DEV:
        _config = _Config.debugConstants;
        break;
      case Environment.STAGING:
        _config = _Config.stagingConstants;
        break;
      case Environment.PROD:
        _config = _Config.prodConstants;
        break;
    }
  }

  static get SERVER_ONE {
    return _config[_Config.SERVER_ONE];
  }

  static get BUILD_VARIANTS {
    return _config[_Config.BUILD_VARIANTS];
  }
}

class _Config {
  static const SERVER_ONE = "";
  static const BUILD_VARIANTS = "Taskers-dev";

  static Map<String, dynamic> debugConstants = {
    SERVER_ONE: "https://wetaskers.spaaztech.in/api/",
    BUILD_VARIANTS: "Taskers-dev",
  };

  static Map<String, dynamic> stagingConstants = {
    SERVER_ONE: "https://wetaskers.spaaztech.in/api/",
    BUILD_VARIANTS: "Taskers-dev",
  };

  static Map<String, dynamic> prodConstants = {
    SERVER_ONE: "https://wetaskers.spaaztech.in/api/",
    BUILD_VARIANTS: "Taskers-dev",
  };
}
