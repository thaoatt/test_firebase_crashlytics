enum HTTPRequestMethods { get, post, patch, delete, put, download }

enum ApiURL {
  getZingChart,
  getSongInfo,
  getRelatedSong,
  search,
  streamAudio,
}

extension ApiURLState on ApiURL {
  String get path {
    switch (this) {
      case ApiURL.getSongInfo:
        return '';
      case ApiURL.search:
        return '';
      case ApiURL.getRelatedSong:
        return '';
      case ApiURL.getZingChart:
        return '';
      case ApiURL.streamAudio:
        return '';
      default:
        return '';
    }
  }


  HTTPRequestMethods? get methods{
    switch(this){
      case ApiURL.getZingChart:
      case ApiURL.getRelatedSong:
      case ApiURL.getSongInfo:
      case ApiURL.search:
      case ApiURL.streamAudio:
        return HTTPRequestMethods.get;
      default:
        return null;
    }
  }
}
