// This is a generated file (see the discoveryapis_generator project).

library googleapis.company.v1;

import 'dart:core' as core;
import 'dart:collection' as collection;
import 'dart:async' as async;
import 'dart:convert' as convert;

import 'package:_discoveryapis_commons/_discoveryapis_commons.dart' as commons;
import 'package:http/http.dart' as http;

export 'package:_discoveryapis_commons/_discoveryapis_commons.dart' show
    ApiRequestError, DetailedApiRequestError;

const core.String USER_AGENT = 'dart-api-client company/v1';

class CompanyApi {

  final commons.ApiRequester _requester;

  Managment_ResourceApi get managment_ => new Managment_ResourceApi(_requester);

  CompanyApi(http.Client client, {core.String rootUrl: "http://192.168.251.222:8081/", core.String servicePath: "company/v1/"}) :
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
   * Completes with a [Company].
   *
   * Completes with a [commons.ApiRequestError] if the API endpoint returned an
   * error.
   *
   * If the used [http.Client] completes with an error when making a REST call,
   * this method will complete with the same error.
   */
  async.Future<Company> deleteModel({core.String filter}) {
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
    return _response.then((data) => new Company.fromJson(data));
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
   * Completes with a [ListOfCompany].
   *
   * Completes with a [commons.ApiRequestError] if the API endpoint returned an
   * error.
   *
   * If the used [http.Client] completes with an error when making a REST call,
   * this method will complete with the same error.
   */
  async.Future<ListOfCompany> getModel({core.String filter, core.int limit}) {
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
    return _response.then((data) => new ListOfCompany.fromJson(data));
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
   * Completes with a [Company].
   *
   * Completes with a [commons.ApiRequestError] if the API endpoint returned an
   * error.
   *
   * If the used [http.Client] completes with an error when making a REST call,
   * this method will complete with the same error.
   */
  async.Future<Company> getModelById(core.String id, {core.String filter, core.int limit}) {
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
    return _response.then((data) => new Company.fromJson(data));
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
  async.Future patchModel(Company request, core.String id) {
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
   * Completes with a [Company].
   *
   * Completes with a [commons.ApiRequestError] if the API endpoint returned an
   * error.
   *
   * If the used [http.Client] completes with an error when making a REST call,
   * this method will complete with the same error.
   */
  async.Future<Company> postModel(Company request) {
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
    return _response.then((data) => new Company.fromJson(data));
  }

  /**
   * [request] - The metadata request object.
   *
   * Request parameters:
   *
   * [id] - Path parameter: 'id'.
   *
   * Completes with a [Company].
   *
   * Completes with a [commons.ApiRequestError] if the API endpoint returned an
   * error.
   *
   * If the used [http.Client] completes with an error when making a REST call,
   * this method will complete with the same error.
   */
  async.Future<Company> updateModel(Company request, core.String id) {
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
    return _response.then((data) => new Company.fromJson(data));
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

class Company {
  core.List<Address> address;
  core.List<core.String> countries;
  core.List<core.String> departments;
  core.String email;
  core.String id;
  core.String nafCode;
  core.String name;
  core.int nbEmployees;
  core.Map<core.String, core.String> phones;
  core.Map<core.String, core.String> socialNetworkLinks;
  core.String url;

  Company();

  Company.fromJson(core.Map _json) {
    if (_json.containsKey("address")) {
      address = _json["address"].map((value) => new Address.fromJson(value)).toList();
    }
    if (_json.containsKey("countries")) {
      countries = _json["countries"];
    }
    if (_json.containsKey("departments")) {
      departments = _json["departments"];
    }
    if (_json.containsKey("email")) {
      email = _json["email"];
    }
    if (_json.containsKey("id")) {
      id = _json["id"];
    }
    if (_json.containsKey("nafCode")) {
      nafCode = _json["nafCode"];
    }
    if (_json.containsKey("name")) {
      name = _json["name"];
    }
    if (_json.containsKey("nbEmployees")) {
      nbEmployees = _json["nbEmployees"];
    }
    if (_json.containsKey("phones")) {
      phones = _json["phones"];
    }
    if (_json.containsKey("socialNetworkLinks")) {
      socialNetworkLinks = _json["socialNetworkLinks"];
    }
    if (_json.containsKey("url")) {
      url = _json["url"];
    }
  }

  core.Map toJson() {
    var _json = new core.Map();
    if (address != null) {
      _json["address"] = address.map((value) => (value).toJson()).toList();
    }
    if (countries != null) {
      _json["countries"] = countries;
    }
    if (departments != null) {
      _json["departments"] = departments;
    }
    if (email != null) {
      _json["email"] = email;
    }
    if (id != null) {
      _json["id"] = id;
    }
    if (nafCode != null) {
      _json["nafCode"] = nafCode;
    }
    if (name != null) {
      _json["name"] = name;
    }
    if (nbEmployees != null) {
      _json["nbEmployees"] = nbEmployees;
    }
    if (phones != null) {
      _json["phones"] = phones;
    }
    if (socialNetworkLinks != null) {
      _json["socialNetworkLinks"] = socialNetworkLinks;
    }
    if (url != null) {
      _json["url"] = url;
    }
    return _json;
  }
}

class ListOfCompany
    extends collection.ListBase<Company> {
  final core.List<Company> _inner;

  ListOfCompany() : _inner = [];

  ListOfCompany.fromJson(core.List json)
      : _inner = json.map((value) => new Company.fromJson(value)).toList();

  core.List toJson() {
    return _inner.map((value) => (value).toJson()).toList();
  }

  Company operator [](core.int key) => _inner[key];

  void operator []=(core.int key, Company value) {
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
