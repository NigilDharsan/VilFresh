enum Environment { DEV, STAGING, PROD }

class ConstantApi {
  static Map<String, dynamic> _config = _Config.debugConstants;

  static String loginUrl = SERVER_ONE + "ValidateLogin";
  static String registrationUrl = SERVER_ONE + "authentication/registration";
  static String homeScreenUrl = SERVER_ONE + "Homescreen";
  static String DefaultItemUrl = SERVER_ONE + "DefaultItem";

  // static String homeBannerdUrl = SERVER_ONE + "HomeBanner";
  // static String shopBYCategorydUrl = SERVER_ONE + "ShopByCategory";

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
  static const BUILD_VARIANTS = "Vilfresh-dev";
//http://192.168.1.2/ERP_API/api

//"http://122.178.12.118/Vilfresh_API/api/" - OLD APi URL
  static Map<String, dynamic> debugConstants = {
    SERVER_ONE: "http://122.165.198.198:2024/Vilfresh_API/api/",
    BUILD_VARIANTS: "Vilfresh-dev",
  };

  static Map<String, dynamic> stagingConstants = {
    SERVER_ONE: "http://122.165.198.198:2024/Vilfresh_API/api/",
    BUILD_VARIANTS: "Vilfresh-dev",
  };

  static Map<String, dynamic> prodConstants = {
    SERVER_ONE: "http://122.165.198.198:2024/Vilfresh_API/api/",
    BUILD_VARIANTS: "Vilfresh-dev",
  };
}
// OLD Url http://122.165.210.5/