/// Class that is used to store the personal access token or oAuthToken.
class FigmaKey {
  /// Returns the personal access token or OAuth token.
  late String keyStr;

  /// Indicates what [FIGMA_KEY_TYPE] this key is.
  FIGMA_KEY_TYPE? type;
  FigmaKey({
    String? personalAccessToken,
    String? oAuthToken,
  }) {
    /// If both personalAccessToken and oAuthToken are provided,
    /// oAuthToken will be used.
    ///
    /// If neither personalAccessToken nor oAuthToken are provided,
    /// or they are both empty, an exception will be thrown.
    if (oAuthToken != null && oAuthToken.isNotEmpty) {
      keyStr =
          oAuthToken.contains('Bearer') ? oAuthToken : 'Bearer $oAuthToken';
      type = FIGMA_KEY_TYPE.OAUTH_TOKEN;
    } else if (personalAccessToken != null && personalAccessToken.isNotEmpty) {
      keyStr = personalAccessToken;
      type = FIGMA_KEY_TYPE.PERSONAL_ACCESS_TOKEN;
    } else {
      throw Exception(
        'Either personalAccessToken or oAuthToken must be provided.',
      );
    }
  }
}

enum FIGMA_KEY_TYPE {
  PERSONAL_ACCESS_TOKEN,
  OAUTH_TOKEN,
}
