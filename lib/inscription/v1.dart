// This is a generated file (see the discoveryapis_generator project).

library googleapis.inscription.v1;

import 'dart:core' as core;
import 'dart:collection' as collection;
import 'dart:async' as async;
import 'dart:convert' as convert;

import 'package:_discoveryapis_commons/_discoveryapis_commons.dart' as commons;
import 'package:http/http.dart' as http;

export 'package:_discoveryapis_commons/_discoveryapis_commons.dart' show
    ApiRequestError, DetailedApiRequestError;

const core.String USER_AGENT = 'dart-api-client inscription/v1';

class InscriptionApi {

  final commons.ApiRequester _requester;

  InscriptionApi(http.Client client, {core.String rootUrl: "http://192.168.251.222:8084/", core.String servicePath: "inscription/v1/"}) :
      _requester = new commons.ApiRequester(client, rootUrl, servicePath, USER_AGENT);

  /**
   * [request] - The metadata request object.
   *
   * Request parameters:
   *
   * Completes with a [MapOfString].
   *
   * Completes with a [commons.ApiRequestError] if the API endpoint returned an
   * error.
   *
   * If the used [http.Client] completes with an error when making a REST call,
   * this method will complete with the same error.
   */
  async.Future<MapOfString> companyInscription(CompanyInscription request) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (request != null) {
      _body = convert.JSON.encode((request).toJson());
    }

    _url = 'company';

    var _response = _requester.request(_url,
                                       "POST",
                                       body: _body,
                                       queryParams: _queryParams,
                                       uploadOptions: _uploadOptions,
                                       uploadMedia: _uploadMedia,
                                       downloadOptions: _downloadOptions);
    return _response.then((data) => new MapOfString.fromJson(data));
  }

  /**
   * [request] - The metadata request object.
   *
   * Request parameters:
   *
   * Completes with a [MapOfString].
   *
   * Completes with a [commons.ApiRequestError] if the API endpoint returned an
   * error.
   *
   * If the used [http.Client] completes with an error when making a REST call,
   * this method will complete with the same error.
   */
  async.Future<MapOfString> userInscription(UserInscription request) {
    var _url = null;
    var _queryParams = new core.Map();
    var _uploadMedia = null;
    var _uploadOptions = null;
    var _downloadOptions = commons.DownloadOptions.Metadata;
    var _body = null;

    if (request != null) {
      _body = convert.JSON.encode((request).toJson());
    }

    _url = 'user';

    var _response = _requester.request(_url,
                                       "POST",
                                       body: _body,
                                       queryParams: _queryParams,
                                       uploadOptions: _uploadOptions,
                                       uploadMedia: _uploadMedia,
                                       downloadOptions: _downloadOptions);
    return _response.then((data) => new MapOfString.fromJson(data));
  }

}



class Account {
  core.List<AccountRight> companyRights;
  core.DateTime creationDate;
  core.String hashedSaltPassword;
  core.String id;
  core.DateTime lastModification;
  core.String login;
  core.List<AccountType> rights;
  core.String salt;
  core.List<core.String> tokens;
  core.String userid;

  Account();

  Account.fromJson(core.Map _json) {
    if (_json.containsKey("companyRights")) {
      companyRights = _json["companyRights"].map((value) => new AccountRight.fromJson(value)).toList();
    }
    if (_json.containsKey("creationDate")) {
      creationDate = core.DateTime.parse(_json["creationDate"]);
    }
    if (_json.containsKey("hashedSaltPassword")) {
      hashedSaltPassword = _json["hashedSaltPassword"];
    }
    if (_json.containsKey("id")) {
      id = _json["id"];
    }
    if (_json.containsKey("lastModification")) {
      lastModification = core.DateTime.parse(_json["lastModification"]);
    }
    if (_json.containsKey("login")) {
      login = _json["login"];
    }
    if (_json.containsKey("rights")) {
      rights = _json["rights"].map((value) => new AccountType.fromJson(value)).toList();
    }
    if (_json.containsKey("salt")) {
      salt = _json["salt"];
    }
    if (_json.containsKey("tokens")) {
      tokens = _json["tokens"];
    }
    if (_json.containsKey("userid")) {
      userid = _json["userid"];
    }
  }

  core.Map toJson() {
    var _json = new core.Map();
    if (companyRights != null) {
      _json["companyRights"] = companyRights.map((value) => (value).toJson()).toList();
    }
    if (creationDate != null) {
      _json["creationDate"] = (creationDate).toIso8601String();
    }
    if (hashedSaltPassword != null) {
      _json["hashedSaltPassword"] = hashedSaltPassword;
    }
    if (id != null) {
      _json["id"] = id;
    }
    if (lastModification != null) {
      _json["lastModification"] = (lastModification).toIso8601String();
    }
    if (login != null) {
      _json["login"] = login;
    }
    if (rights != null) {
      _json["rights"] = rights.map((value) => (value).toJson()).toList();
    }
    if (salt != null) {
      _json["salt"] = salt;
    }
    if (tokens != null) {
      _json["tokens"] = tokens;
    }
    if (userid != null) {
      _json["userid"] = userid;
    }
    return _json;
  }
}

class AccountRight {
  core.String companyId;
  core.List<AccountType> roles;

  AccountRight();

  AccountRight.fromJson(core.Map _json) {
    if (_json.containsKey("companyId")) {
      companyId = _json["companyId"];
    }
    if (_json.containsKey("roles")) {
      roles = _json["roles"].map((value) => new AccountType.fromJson(value)).toList();
    }
  }

  core.Map toJson() {
    var _json = new core.Map();
    if (companyId != null) {
      _json["companyId"] = companyId;
    }
    if (roles != null) {
      _json["roles"] = roles.map((value) => (value).toJson()).toList();
    }
    return _json;
  }
}

class AccountType {
  core.int value;

  AccountType();

  AccountType.fromJson(core.Map _json) {
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

class CompanyInscription {
  Account acc;
  Company company;
  User user;

  CompanyInscription();

  CompanyInscription.fromJson(core.Map _json) {
    if (_json.containsKey("acc")) {
      acc = new Account.fromJson(_json["acc"]);
    }
    if (_json.containsKey("company")) {
      company = new Company.fromJson(_json["company"]);
    }
    if (_json.containsKey("user")) {
      user = new User.fromJson(_json["user"]);
    }
  }

  core.Map toJson() {
    var _json = new core.Map();
    if (acc != null) {
      _json["acc"] = (acc).toJson();
    }
    if (company != null) {
      _json["company"] = (company).toJson();
    }
    if (user != null) {
      _json["user"] = (user).toJson();
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

class UserInscription {
  Account acc;
  User user;

  UserInscription();

  UserInscription.fromJson(core.Map _json) {
    if (_json.containsKey("acc")) {
      acc = new Account.fromJson(_json["acc"]);
    }
    if (_json.containsKey("user")) {
      user = new User.fromJson(_json["user"]);
    }
  }

  core.Map toJson() {
    var _json = new core.Map();
    if (acc != null) {
      _json["acc"] = (acc).toJson();
    }
    if (user != null) {
      _json["user"] = (user).toJson();
    }
    return _json;
  }
}
