// This is a generated file (see the discoveryapis_generator project).

library googleapis.user.v1;

import 'dart:core' as core;
import 'dart:collection' as collection;
import 'dart:async' as async;
import 'dart:convert' as convert;

import 'package:_discoveryapis_commons/_discoveryapis_commons.dart' as commons;
import 'package:http/http.dart' as http;

export 'package:_discoveryapis_commons/_discoveryapis_commons.dart' show
    ApiRequestError, DetailedApiRequestError;

const core.String USER_AGENT = 'dart-api-client user/v1';

class UserApi {

  final commons.ApiRequester _requester;

  Managment_ResourceApi get managment_ => new Managment_ResourceApi(_requester);

  UserApi(http.Client client, {core.String rootUrl: "http://192.168.251.222:8080/", core.String servicePath: "user/v1/"}) :
      _requester = new commons.ApiRequester(client, rootUrl, servicePath, USER_AGENT);
}


class Managment_ResourceApi {
  final commons.ApiRequester _requester;

  Managment_ResourceApi(commons.ApiRequester client) : 
      _requester = client;

  /**
   * Request parameters:
   *
   * [filter] - Query parameter: 'filter'.
   *
   * Completes with a [User].
   *
   * Completes with a [commons.ApiRequestError] if the API endpoint returned an
   * error.
   *
   * If the used [http.Client] completes with an error when making a REST call,
   * this method will complete with the same error.
   */
  async.Future<User> deleteModel({core.String filter}) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (filter != null) {
      _queryParams["filter"] = [filter];
    }

    _url = 'data';

    var _response = _requester.request(_url,
                                       "DELETE",
                                       body: _body,
                                       queryParams: _queryParams,
                                       uploadOptions: _uploadOptions,
                                       uploadMedia: _uploadMedia,
                                       downloadOptions: _downloadOptions);
    return _response.then((data) => new User.fromJson(data));
  }

  /**
   * Request parameters:
   *
   * [id] - Path parameter: 'id'.
   *
   * Completes with a [MapOfString].
   *
   * Completes with a [commons.ApiRequestError] if the API endpoint returned an
   * error.
   *
   * If the used [http.Client] completes with an error when making a REST call,
   * this method will complete with the same error.
   */
  async.Future<MapOfString> deleteModelId(core.String id) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (id == null) {
      throw new core.ArgumentError("Parameter id is required.");
    }

    _url = 'data/' + commons.Escaper.ecapeVariable('$id');

    var _response = _requester.request(_url,
                                       "DELETE",
                                       body: _body,
                                       queryParams: _queryParams,
                                       uploadOptions: _uploadOptions,
                                       uploadMedia: _uploadMedia,
                                       downloadOptions: _downloadOptions);
    return _response.then((data) => new MapOfString.fromJson(data));
  }

  /**
   * Request parameters:
   *
   * [filter] - Query parameter: 'filter'.
   *
   * [limit] - Query parameter: 'limit'.
   *
   * Completes with a [ListOfUser].
   *
   * Completes with a [commons.ApiRequestError] if the API endpoint returned an
   * error.
   *
   * If the used [http.Client] completes with an error when making a REST call,
   * this method will complete with the same error.
   */
  async.Future<ListOfUser> getModel({core.String filter, core.int limit}) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (filter != null) {
      _queryParams["filter"] = [filter];
    }
    if (limit != null) {
      _queryParams["limit"] = ["${limit}"];
    }

    _url = 'data';

    var _response = _requester.request(_url,
                                       "GET",
                                       body: _body,
                                       queryParams: _queryParams,
                                       uploadOptions: _uploadOptions,
                                       uploadMedia: _uploadMedia,
                                       downloadOptions: _downloadOptions);
    return _response.then((data) => new ListOfUser.fromJson(data));
  }

  /**
   * Request parameters:
   *
   * [id] - Path parameter: 'id'.
   *
   * [filter] - Query parameter: 'filter'.
   *
   * [limit] - Query parameter: 'limit'.
   *
   * Completes with a [User].
   *
   * Completes with a [commons.ApiRequestError] if the API endpoint returned an
   * error.
   *
   * If the used [http.Client] completes with an error when making a REST call,
   * this method will complete with the same error.
   */
  async.Future<User> getModelById(core.String id, {core.String filter, core.int limit}) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (id == null) {
      throw new core.ArgumentError("Parameter id is required.");
    }
    if (filter != null) {
      _queryParams["filter"] = [filter];
    }
    if (limit != null) {
      _queryParams["limit"] = ["${limit}"];
    }

    _url = 'data/' + commons.Escaper.ecapeVariable('$id');

    var _response = _requester.request(_url,
                                       "GET",
                                       body: _body,
                                       queryParams: _queryParams,
                                       uploadOptions: _uploadOptions,
                                       uploadMedia: _uploadMedia,
                                       downloadOptions: _downloadOptions);
    return _response.then((data) => new User.fromJson(data));
  }

  /**
   * [request] - The metadata request object.
   *
   * Request parameters:
   *
   * [id] - Path parameter: 'id'.
   *
   * Completes with a [commons.ApiRequestError] if the API endpoint returned an
   * error.
   *
   * If the used [http.Client] completes with an error when making a REST call,
   * this method will complete with the same error.
   */
  async.Future patchModel(User request, core.String id) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (request != null) {
      _body = convert.JSON.encode((request).toJson());
    }
    if (id == null) {
      throw new core.ArgumentError("Parameter id is required.");
    }

    _downloadOptions = null;

    _url = 'data/' + commons.Escaper.ecapeVariable('$id');

    var _response = _requester.request(_url,
                                       "PATCH",
                                       body: _body,
                                       queryParams: _queryParams,
                                       uploadOptions: _uploadOptions,
                                       uploadMedia: _uploadMedia,
                                       downloadOptions: _downloadOptions);
    return _response.then((data) => null);
  }

  /**
   * [request] - The metadata request object.
   *
   * Request parameters:
   *
   * Completes with a [User].
   *
   * Completes with a [commons.ApiRequestError] if the API endpoint returned an
   * error.
   *
   * If the used [http.Client] completes with an error when making a REST call,
   * this method will complete with the same error.
   */
  async.Future<User> postModel(User request) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (request != null) {
      _body = convert.JSON.encode((request).toJson());
    }

    _url = 'data';

    var _response = _requester.request(_url,
                                       "POST",
                                       body: _body,
                                       queryParams: _queryParams,
                                       uploadOptions: _uploadOptions,
                                       uploadMedia: _uploadMedia,
                                       downloadOptions: _downloadOptions);
    return _response.then((data) => new User.fromJson(data));
  }

  /**
   * [request] - The metadata request object.
   *
   * Request parameters:
   *
   * [id] - Path parameter: 'id'.
   *
   * Completes with a [User].
   *
   * Completes with a [commons.ApiRequestError] if the API endpoint returned an
   * error.
   *
   * If the used [http.Client] completes with an error when making a REST call,
   * this method will complete with the same error.
   */
  async.Future<User> updateModel(User request, core.String id) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (request != null) {
      _body = convert.JSON.encode((request).toJson());
    }
    if (id == null) {
      throw new core.ArgumentError("Parameter id is required.");
    }

    _url = 'data/' + commons.Escaper.ecapeVariable('$id');

    var _response = _requester.request(_url,
                                       "PUT",
                                       body: _body,
                                       queryParams: _queryParams,
                                       uploadOptions: _uploadOptions,
                                       uploadMedia: _uploadMedia,
                                       downloadOptions: _downloadOptions);
    return _response.then((data) => new User.fromJson(data));
  }

}



class Address {
  core.String additionalInfo;
  core.String city;
  core.String country;
  core.String street;
  core.int streetNumber;
  core.String zipCode;

  Address();

  Address.fromJson(core.Map _json) {
    if (_json.containsKey("additionalInfo")) {
      additionalInfo = _json["additionalInfo"];
    }
    if (_json.containsKey("city")) {
      city = _json["city"];
    }
    if (_json.containsKey("country")) {
      country = _json["country"];
    }
    if (_json.containsKey("street")) {
      street = _json["street"];
    }
    if (_json.containsKey("streetNumber")) {
      streetNumber = _json["streetNumber"];
    }
    if (_json.containsKey("zipCode")) {
      zipCode = _json["zipCode"];
    }
  }

  core.Map toJson() {
    var _json = new core.Map();
    if (additionalInfo != null) {
      _json["additionalInfo"] = additionalInfo;
    }
    if (city != null) {
      _json["city"] = city;
    }
    if (country != null) {
      _json["country"] = country;
    }
    if (street != null) {
      _json["street"] = street;
    }
    if (streetNumber != null) {
      _json["streetNumber"] = streetNumber;
    }
    if (zipCode != null) {
      _json["zipCode"] = zipCode;
    }
    return _json;
  }
}

class Child {
  core.int age;
  core.DateTime birthDate;
  ChildStatus status;

  Child();

  Child.fromJson(core.Map _json) {
    if (_json.containsKey("age")) {
      age = _json["age"];
    }
    if (_json.containsKey("birthDate")) {
      birthDate = core.DateTime.parse(_json["birthDate"]);
    }
    if (_json.containsKey("status")) {
      status = new ChildStatus.fromJson(_json["status"]);
    }
  }

  core.Map toJson() {
    var _json = new core.Map();
    if (age != null) {
      _json["age"] = age;
    }
    if (birthDate != null) {
      _json["birthDate"] = (birthDate).toIso8601String();
    }
    if (status != null) {
      _json["status"] = (status).toJson();
    }
    return _json;
  }
}

class ChildStatus {
  core.int value;

  ChildStatus();

  ChildStatus.fromJson(core.Map _json) {
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

class Family {
  core.List<Child> children;
  MaritalStatus maritalStatus;

  Family();

  Family.fromJson(core.Map _json) {
    if (_json.containsKey("children")) {
      children = _json["children"].map((value) => new Child.fromJson(value)).toList();
    }
    if (_json.containsKey("maritalStatus")) {
      maritalStatus = new MaritalStatus.fromJson(_json["maritalStatus"]);
    }
  }

  core.Map toJson() {
    var _json = new core.Map();
    if (children != null) {
      _json["children"] = children.map((value) => (value).toJson()).toList();
    }
    if (maritalStatus != null) {
      _json["maritalStatus"] = (maritalStatus).toJson();
    }
    return _json;
  }
}

class Gender {
  core.int value;

  Gender();

  Gender.fromJson(core.Map _json) {
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

class ListOfUser
    extends collection.ListBase<User> {
  final core.List<User> _inner;

  ListOfUser() : _inner = [];

  ListOfUser.fromJson(core.List json)
      : _inner = json.map((value) => new User.fromJson(value)).toList();

  core.List toJson() {
    return _inner.map((value) => (value).toJson()).toList();
  }

  User operator [](core.int key) => _inner[key];

  void operator []=(core.int key, User value) {
    _inner[key] = value;
  }

  core.int get length => _inner.length;

  void set length(core.int newLength) {
    _inner.length = newLength;
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

class MaritalStatus {
  core.int value;

  MaritalStatus();

  MaritalStatus.fromJson(core.Map _json) {
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

class User {
  Address address;
  core.String email;
  Family familyStatus;
  core.String firstName;
  Gender gender;
  core.String id;
  core.String lastName;
  core.String phoneNumber;
  core.String socialSecurity;

  User();

  User.fromJson(core.Map _json) {
    if (_json.containsKey("address")) {
      address = new Address.fromJson(_json["address"]);
    }
    if (_json.containsKey("email")) {
      email = _json["email"];
    }
    if (_json.containsKey("familyStatus")) {
      familyStatus = new Family.fromJson(_json["familyStatus"]);
    }
    if (_json.containsKey("firstName")) {
      firstName = _json["firstName"];
    }
    if (_json.containsKey("gender")) {
      gender = new Gender.fromJson(_json["gender"]);
    }
    if (_json.containsKey("id")) {
      id = _json["id"];
    }
    if (_json.containsKey("lastName")) {
      lastName = _json["lastName"];
    }
    if (_json.containsKey("phoneNumber")) {
      phoneNumber = _json["phoneNumber"];
    }
    if (_json.containsKey("socialSecurity")) {
      socialSecurity = _json["socialSecurity"];
    }
  }

  core.Map toJson() {
    var _json = new core.Map();
    if (address != null) {
      _json["address"] = (address).toJson();
    }
    if (email != null) {
      _json["email"] = email;
    }
    if (familyStatus != null) {
      _json["familyStatus"] = (familyStatus).toJson();
    }
    if (firstName != null) {
      _json["firstName"] = firstName;
    }
    if (gender != null) {
      _json["gender"] = (gender).toJson();
    }
    if (id != null) {
      _json["id"] = id;
    }
    if (lastName != null) {
      _json["lastName"] = lastName;
    }
    if (phoneNumber != null) {
      _json["phoneNumber"] = phoneNumber;
    }
    if (socialSecurity != null) {
      _json["socialSecurity"] = socialSecurity;
    }
    return _json;
  }
}
