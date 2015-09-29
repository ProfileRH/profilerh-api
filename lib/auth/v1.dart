// This is a generated file (see the discoveryapis_generator project).

library googleapis.auth.v1;

import 'dart:core' as core;
import 'dart:collection' as collection;
import 'dart:async' as async;
import 'dart:convert' as convert;

import 'package:_discoveryapis_commons/_discoveryapis_commons.dart' as commons;
import 'package:http/http.dart' as http;

export 'package:_discoveryapis_commons/_discoveryapis_commons.dart' show
    ApiRequestError, DetailedApiRequestError;

const core.String USER_AGENT = 'dart-api-client auth/v1';

class AuthApi {

  final commons.ApiRequester _requester;

  AuthApi(http.Client client, {core.String rootUrl: "http://192.168.251.222:8083/", core.String servicePath: "auth/v1/"}) :
      _requester = new commons.ApiRequester(client, rootUrl, servicePath, USER_AGENT);

  /**
   * Request parameters:
   *
   * [username] - Query parameter: 'username'.
   *
   * [password] - Query parameter: 'password'.
   *
   * [authId] - Query parameter: 'authId'.
   *
   * [requiredAccesLevel] - Query parameter: 'requiredAccesLevel'.
   *
   * [askRight] - Query parameter: 'askRight'.
   *
   * [resources] - Query parameter: 'resources'.
   *
   * [companyId] - Query parameter: 'companyId'.
   *
   * Completes with a [StatusMessage].
   *
   * Completes with a [commons.ApiRequestError] if the API endpoint returned an
   * error.
   *
   * If the used [http.Client] completes with an error when making a REST call,
   * this method will complete with the same error.
   */
  async.Future<StatusMessage> check({core.String username, core.String password, core.String authId, core.int requiredAccesLevel, core.String askRight, core.String resources, core.String companyId}) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (username != null) {
      _queryParams["username"] = [username];
    }
    if (password != null) {
      _queryParams["password"] = [password];
    }
    if (authId != null) {
      _queryParams["authId"] = [authId];
    }
    if (requiredAccesLevel != null) {
      _queryParams["requiredAccesLevel"] = ["${requiredAccesLevel}"];
    }
    if (askRight != null) {
      _queryParams["askRight"] = [askRight];
    }
    if (resources != null) {
      _queryParams["resources"] = [resources];
    }
    if (companyId != null) {
      _queryParams["companyId"] = [companyId];
    }

    _url = 'check';

    var _response = _requester.request(_url,
                                       "GET",
                                       body: _body,
                                       queryParams: _queryParams,
                                       uploadOptions: _uploadOptions,
                                       uploadMedia: _uploadMedia,
                                       downloadOptions: _downloadOptions);
    return _response.then((data) => new StatusMessage.fromJson(data));
  }

  /**
   * Request parameters:
   *
   * [username] - Query parameter: 'username'.
   *
   * [password] - Query parameter: 'password'.
   *
   * [authId] - Query parameter: 'authId'.
   *
   * Completes with a [StatusMessage].
   *
   * Completes with a [commons.ApiRequestError] if the API endpoint returned an
   * error.
   *
   * If the used [http.Client] completes with an error when making a REST call,
   * this method will complete with the same error.
   */
  async.Future<StatusMessage> login({core.String username, core.String password, core.String authId}) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (username != null) {
      _queryParams["username"] = [username];
    }
    if (password != null) {
      _queryParams["password"] = [password];
    }
    if (authId != null) {
      _queryParams["authId"] = [authId];
    }

    _url = 'login';

    var _response = _requester.request(_url,
                                       "GET",
                                       body: _body,
                                       queryParams: _queryParams,
                                       uploadOptions: _uploadOptions,
                                       uploadMedia: _uploadMedia,
                                       downloadOptions: _downloadOptions);
    return _response.then((data) => new StatusMessage.fromJson(data));
  }

  /**
   * Request parameters:
   *
   * [authId] - Query parameter: 'authId'.
   *
   * Completes with a [MapOfString].
   *
   * Completes with a [commons.ApiRequestError] if the API endpoint returned an
   * error.
   *
   * If the used [http.Client] completes with an error when making a REST call,
   * this method will complete with the same error.
   */
  async.Future<MapOfString> logout({core.String authId}) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (authId != null) {
      _queryParams["authId"] = [authId];
    }

    _url = 'logout';

    var _response = _requester.request(_url,
                                       "GET",
                                       body: _body,
                                       queryParams: _queryParams,
                                       uploadOptions: _uploadOptions,
                                       uploadMedia: _uploadMedia,
                                       downloadOptions: _downloadOptions);
    return _response.then((data) => new MapOfString.fromJson(data));
  }

}



class MapOfString
    extends collection.MapBase<core.String, core.String> {
  final core.Map _innerMap = {};

  MapOfString();

  MapOfString.fromJson(core.Map _json) {
    _json.forEach((core.String key, value) {
      this[key] = value;
    });
  }

  core.Map toJson() {
    var _json = {};
    this.forEach((core.String key, value) {
      _json[key] = value;
    });
    return _json;
  }

  core.String operator [](core.Object key)
      => _innerMap[key];

  operator []=(core.String key, core.String value) {
    _innerMap[key] = value;
  }

  void clear() {
    _innerMap.clear();
  }

  core.Iterable<core.String> get keys => _innerMap.keys;

  core.String remove(core.Object key) => _innerMap.remove(key);
}

class StatusCode {
  core.int value;

  StatusCode();

  StatusCode.fromJson(core.Map _json) {
    if (_json.containsKey("value")) {
      value = _json["value"];
    }
  }

  core.Map toJson() {
    var _json = new core.Map();
    if (value != null) {
      _json["value"] = value;
    }
    return _json;
  }
}

class StatusMessage {
  StatusCode code;
  core.Map<core.String, core.String> info;
  core.String message;
  core.String name;
  core.bool valid;

  StatusMessage();

  StatusMessage.fromJson(core.Map _json) {
    if (_json.containsKey("code")) {
      code = new StatusCode.fromJson(_json["code"]);
    }
    if (_json.containsKey("info")) {
      info = _json["info"];
    }
    if (_json.containsKey("message")) {
      message = _json["message"];
    }
    if (_json.containsKey("name")) {
      name = _json["name"];
    }
    if (_json.containsKey("valid")) {
      valid = _json["valid"];
    }
  }

  core.Map toJson() {
    var _json = new core.Map();
    if (code != null) {
      _json["code"] = (code).toJson();
    }
    if (info != null) {
      _json["info"] = info;
    }
    if (message != null) {
      _json["message"] = message;
    }
    if (name != null) {
      _json["name"] = name;
    }
    if (valid != null) {
      _json["valid"] = valid;
    }
    return _json;
  }
}
