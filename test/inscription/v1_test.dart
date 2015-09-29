library googleapis.inscription.v1.test;

import "dart:core" as core;
import "dart:collection" as collection;
import "dart:async" as async;
import "dart:convert" as convert;

import 'package:http/http.dart' as http;
import 'package:http/testing.dart' as http_testing;
import 'package:unittest/unittest.dart' as unittest;

import 'package:googleapis/inscription/v1.dart' as api;

class HttpServerMock extends http.BaseClient {
  core.Function _callback;
  core.bool _expectJson;

  void register(core.Function callback, core.bool expectJson) {
    _callback = callback;
    _expectJson = expectJson;
  }

  async.Future<http.StreamedResponse> send(http.BaseRequest request) {
    if (_expectJson) {
      return request.finalize()
          .transform(convert.UTF8.decoder)
          .join('')
          .then((core.String jsonString) {
        if (jsonString.isEmpty) {
          return _callback(request, null);
        } else {
          return _callback(request, convert.JSON.decode(jsonString));
        }
      });
    } else {
      var stream = request.finalize();
      if (stream == null) {
        return _callback(request, []);
      } else {
        return stream.toBytes().then((data) {
          return _callback(request, data);
        });
      }
    }
  }
}

http.StreamedResponse stringResponse(
    core.int status, core.Map headers, core.String body) {
  var stream = new async.Stream.fromIterable([convert.UTF8.encode(body)]);
  return new http.StreamedResponse(stream, status, headers: headers);
}

buildUnnamed6() {
  var o = new core.List<api.AccountRight>();
  o.add(buildAccountRight());
  o.add(buildAccountRight());
  return o;
}

checkUnnamed6(core.List<api.AccountRight> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkAccountRight(o[0]);
  checkAccountRight(o[1]);
}

buildUnnamed7() {
  var o = new core.List<api.AccountType>();
  o.add(buildAccountType());
  o.add(buildAccountType());
  return o;
}

checkUnnamed7(core.List<api.AccountType> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkAccountType(o[0]);
  checkAccountType(o[1]);
}

buildUnnamed8() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed8(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

core.int buildCounterAccount = 0;
buildAccount() {
  var o = new api.Account();
  buildCounterAccount++;
  if (buildCounterAccount < 3) {
    o.companyRights = buildUnnamed6();
    o.creationDate = core.DateTime.parse("2002-02-27T14:01:02");
    o.hashedSaltPassword = "foo";
    o.id = "foo";
    o.lastModification = core.DateTime.parse("2002-02-27T14:01:02");
    o.login = "foo";
    o.rights = buildUnnamed7();
    o.salt = "foo";
    o.tokens = buildUnnamed8();
    o.userid = "foo";
  }
  buildCounterAccount--;
  return o;
}

checkAccount(api.Account o) {
  buildCounterAccount++;
  if (buildCounterAccount < 3) {
    checkUnnamed6(o.companyRights);
    unittest.expect(o.creationDate, unittest.equals(core.DateTime.parse("2002-02-27T14:01:02")));
    unittest.expect(o.hashedSaltPassword, unittest.equals('foo'));
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.lastModification, unittest.equals(core.DateTime.parse("2002-02-27T14:01:02")));
    unittest.expect(o.login, unittest.equals('foo'));
    checkUnnamed7(o.rights);
    unittest.expect(o.salt, unittest.equals('foo'));
    checkUnnamed8(o.tokens);
    unittest.expect(o.userid, unittest.equals('foo'));
  }
  buildCounterAccount--;
}

buildUnnamed9() {
  var o = new core.List<api.AccountType>();
  o.add(buildAccountType());
  o.add(buildAccountType());
  return o;
}

checkUnnamed9(core.List<api.AccountType> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkAccountType(o[0]);
  checkAccountType(o[1]);
}

core.int buildCounterAccountRight = 0;
buildAccountRight() {
  var o = new api.AccountRight();
  buildCounterAccountRight++;
  if (buildCounterAccountRight < 3) {
    o.companyId = "foo";
    o.roles = buildUnnamed9();
  }
  buildCounterAccountRight--;
  return o;
}

checkAccountRight(api.AccountRight o) {
  buildCounterAccountRight++;
  if (buildCounterAccountRight < 3) {
    unittest.expect(o.companyId, unittest.equals('foo'));
    checkUnnamed9(o.roles);
  }
  buildCounterAccountRight--;
}

core.int buildCounterAccountType = 0;
buildAccountType() {
  var o = new api.AccountType();
  buildCounterAccountType++;
  if (buildCounterAccountType < 3) {
    o.value = 42;
  }
  buildCounterAccountType--;
  return o;
}

checkAccountType(api.AccountType o) {
  buildCounterAccountType++;
  if (buildCounterAccountType < 3) {
    unittest.expect(o.value, unittest.equals(42));
  }
  buildCounterAccountType--;
}

core.int buildCounterAddress = 0;
buildAddress() {
  var o = new api.Address();
  buildCounterAddress++;
  if (buildCounterAddress < 3) {
    o.additionalInfo = "foo";
    o.city = "foo";
    o.country = "foo";
    o.street = "foo";
    o.streetNumber = 42;
    o.zipCode = "foo";
  }
  buildCounterAddress--;
  return o;
}

checkAddress(api.Address o) {
  buildCounterAddress++;
  if (buildCounterAddress < 3) {
    unittest.expect(o.additionalInfo, unittest.equals('foo'));
    unittest.expect(o.city, unittest.equals('foo'));
    unittest.expect(o.country, unittest.equals('foo'));
    unittest.expect(o.street, unittest.equals('foo'));
    unittest.expect(o.streetNumber, unittest.equals(42));
    unittest.expect(o.zipCode, unittest.equals('foo'));
  }
  buildCounterAddress--;
}

core.int buildCounterChild = 0;
buildChild() {
  var o = new api.Child();
  buildCounterChild++;
  if (buildCounterChild < 3) {
    o.age = 42;
    o.birthDate = core.DateTime.parse("2002-02-27T14:01:02");
    o.status = buildChildStatus();
  }
  buildCounterChild--;
  return o;
}

checkChild(api.Child o) {
  buildCounterChild++;
  if (buildCounterChild < 3) {
    unittest.expect(o.age, unittest.equals(42));
    unittest.expect(o.birthDate, unittest.equals(core.DateTime.parse("2002-02-27T14:01:02")));
    checkChildStatus(o.status);
  }
  buildCounterChild--;
}

core.int buildCounterChildStatus = 0;
buildChildStatus() {
  var o = new api.ChildStatus();
  buildCounterChildStatus++;
  if (buildCounterChildStatus < 3) {
    o.value = 42;
  }
  buildCounterChildStatus--;
  return o;
}

checkChildStatus(api.ChildStatus o) {
  buildCounterChildStatus++;
  if (buildCounterChildStatus < 3) {
    unittest.expect(o.value, unittest.equals(42));
  }
  buildCounterChildStatus--;
}

buildUnnamed10() {
  var o = new core.List<api.Address>();
  o.add(buildAddress());
  o.add(buildAddress());
  return o;
}

checkUnnamed10(core.List<api.Address> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkAddress(o[0]);
  checkAddress(o[1]);
}

buildUnnamed11() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed11(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed12() {
  var o = new core.List<core.String>();
  o.add("foo");
  o.add("foo");
  return o;
}

checkUnnamed12(core.List<core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o[0], unittest.equals('foo'));
  unittest.expect(o[1], unittest.equals('foo'));
}

buildUnnamed13() {
  var o = new core.Map<core.String, core.String>();
  o["x"] = "foo";
  o["y"] = "foo";
  return o;
}

checkUnnamed13(core.Map<core.String, core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o["x"], unittest.equals('foo'));
  unittest.expect(o["y"], unittest.equals('foo'));
}

buildUnnamed14() {
  var o = new core.Map<core.String, core.String>();
  o["x"] = "foo";
  o["y"] = "foo";
  return o;
}

checkUnnamed14(core.Map<core.String, core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o["x"], unittest.equals('foo'));
  unittest.expect(o["y"], unittest.equals('foo'));
}

core.int buildCounterCompany = 0;
buildCompany() {
  var o = new api.Company();
  buildCounterCompany++;
  if (buildCounterCompany < 3) {
    o.address = buildUnnamed10();
    o.countries = buildUnnamed11();
    o.departments = buildUnnamed12();
    o.email = "foo";
    o.id = "foo";
    o.nafCode = "foo";
    o.name = "foo";
    o.nbEmployees = 42;
    o.phones = buildUnnamed13();
    o.socialNetworkLinks = buildUnnamed14();
    o.url = "foo";
  }
  buildCounterCompany--;
  return o;
}

checkCompany(api.Company o) {
  buildCounterCompany++;
  if (buildCounterCompany < 3) {
    checkUnnamed10(o.address);
    checkUnnamed11(o.countries);
    checkUnnamed12(o.departments);
    unittest.expect(o.email, unittest.equals('foo'));
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.nafCode, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.nbEmployees, unittest.equals(42));
    checkUnnamed13(o.phones);
    checkUnnamed14(o.socialNetworkLinks);
    unittest.expect(o.url, unittest.equals('foo'));
  }
  buildCounterCompany--;
}

core.int buildCounterCompanyInscription = 0;
buildCompanyInscription() {
  var o = new api.CompanyInscription();
  buildCounterCompanyInscription++;
  if (buildCounterCompanyInscription < 3) {
    o.acc = buildAccount();
    o.company = buildCompany();
    o.user = buildUser();
  }
  buildCounterCompanyInscription--;
  return o;
}

checkCompanyInscription(api.CompanyInscription o) {
  buildCounterCompanyInscription++;
  if (buildCounterCompanyInscription < 3) {
    checkAccount(o.acc);
    checkCompany(o.company);
    checkUser(o.user);
  }
  buildCounterCompanyInscription--;
}

buildUnnamed15() {
  var o = new core.List<api.Child>();
  o.add(buildChild());
  o.add(buildChild());
  return o;
}

checkUnnamed15(core.List<api.Child> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkChild(o[0]);
  checkChild(o[1]);
}

core.int buildCounterFamily = 0;
buildFamily() {
  var o = new api.Family();
  buildCounterFamily++;
  if (buildCounterFamily < 3) {
    o.children = buildUnnamed15();
    o.maritalStatus = buildMaritalStatus();
  }
  buildCounterFamily--;
  return o;
}

checkFamily(api.Family o) {
  buildCounterFamily++;
  if (buildCounterFamily < 3) {
    checkUnnamed15(o.children);
    checkMaritalStatus(o.maritalStatus);
  }
  buildCounterFamily--;
}

core.int buildCounterGender = 0;
buildGender() {
  var o = new api.Gender();
  buildCounterGender++;
  if (buildCounterGender < 3) {
    o.value = 42;
  }
  buildCounterGender--;
  return o;
}

checkGender(api.Gender o) {
  buildCounterGender++;
  if (buildCounterGender < 3) {
    unittest.expect(o.value, unittest.equals(42));
  }
  buildCounterGender--;
}

buildMapOfString() {
  var o = new api.MapOfString();
  o["a"] = "foo";
  o["b"] = "foo";
  return o;
}

checkMapOfString(api.MapOfString o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o["a"], unittest.equals('foo'));
  unittest.expect(o["b"], unittest.equals('foo'));
}

core.int buildCounterMaritalStatus = 0;
buildMaritalStatus() {
  var o = new api.MaritalStatus();
  buildCounterMaritalStatus++;
  if (buildCounterMaritalStatus < 3) {
    o.value = 42;
  }
  buildCounterMaritalStatus--;
  return o;
}

checkMaritalStatus(api.MaritalStatus o) {
  buildCounterMaritalStatus++;
  if (buildCounterMaritalStatus < 3) {
    unittest.expect(o.value, unittest.equals(42));
  }
  buildCounterMaritalStatus--;
}

core.int buildCounterUser = 0;
buildUser() {
  var o = new api.User();
  buildCounterUser++;
  if (buildCounterUser < 3) {
    o.address = buildAddress();
    o.email = "foo";
    o.familyStatus = buildFamily();
    o.firstName = "foo";
    o.gender = buildGender();
    o.id = "foo";
    o.lastName = "foo";
    o.phoneNumber = "foo";
    o.socialSecurity = "foo";
  }
  buildCounterUser--;
  return o;
}

checkUser(api.User o) {
  buildCounterUser++;
  if (buildCounterUser < 3) {
    checkAddress(o.address);
    unittest.expect(o.email, unittest.equals('foo'));
    checkFamily(o.familyStatus);
    unittest.expect(o.firstName, unittest.equals('foo'));
    checkGender(o.gender);
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.lastName, unittest.equals('foo'));
    unittest.expect(o.phoneNumber, unittest.equals('foo'));
    unittest.expect(o.socialSecurity, unittest.equals('foo'));
  }
  buildCounterUser--;
}

core.int buildCounterUserInscription = 0;
buildUserInscription() {
  var o = new api.UserInscription();
  buildCounterUserInscription++;
  if (buildCounterUserInscription < 3) {
    o.acc = buildAccount();
    o.user = buildUser();
  }
  buildCounterUserInscription--;
  return o;
}

checkUserInscription(api.UserInscription o) {
  buildCounterUserInscription++;
  if (buildCounterUserInscription < 3) {
    checkAccount(o.acc);
    checkUser(o.user);
  }
  buildCounterUserInscription--;
}


main() {
  unittest.group("obj-schema-Account", () {
    unittest.test("to-json--from-json", () {
      var o = buildAccount();
      var od = new api.Account.fromJson(o.toJson());
      checkAccount(od);
    });
  });


  unittest.group("obj-schema-AccountRight", () {
    unittest.test("to-json--from-json", () {
      var o = buildAccountRight();
      var od = new api.AccountRight.fromJson(o.toJson());
      checkAccountRight(od);
    });
  });


  unittest.group("obj-schema-AccountType", () {
    unittest.test("to-json--from-json", () {
      var o = buildAccountType();
      var od = new api.AccountType.fromJson(o.toJson());
      checkAccountType(od);
    });
  });


  unittest.group("obj-schema-Address", () {
    unittest.test("to-json--from-json", () {
      var o = buildAddress();
      var od = new api.Address.fromJson(o.toJson());
      checkAddress(od);
    });
  });


  unittest.group("obj-schema-Child", () {
    unittest.test("to-json--from-json", () {
      var o = buildChild();
      var od = new api.Child.fromJson(o.toJson());
      checkChild(od);
    });
  });


  unittest.group("obj-schema-ChildStatus", () {
    unittest.test("to-json--from-json", () {
      var o = buildChildStatus();
      var od = new api.ChildStatus.fromJson(o.toJson());
      checkChildStatus(od);
    });
  });


  unittest.group("obj-schema-Company", () {
    unittest.test("to-json--from-json", () {
      var o = buildCompany();
      var od = new api.Company.fromJson(o.toJson());
      checkCompany(od);
    });
  });


  unittest.group("obj-schema-CompanyInscription", () {
    unittest.test("to-json--from-json", () {
      var o = buildCompanyInscription();
      var od = new api.CompanyInscription.fromJson(o.toJson());
      checkCompanyInscription(od);
    });
  });


  unittest.group("obj-schema-Family", () {
    unittest.test("to-json--from-json", () {
      var o = buildFamily();
      var od = new api.Family.fromJson(o.toJson());
      checkFamily(od);
    });
  });


  unittest.group("obj-schema-Gender", () {
    unittest.test("to-json--from-json", () {
      var o = buildGender();
      var od = new api.Gender.fromJson(o.toJson());
      checkGender(od);
    });
  });


  unittest.group("obj-schema-MapOfString", () {
    unittest.test("to-json--from-json", () {
      var o = buildMapOfString();
      var od = new api.MapOfString.fromJson(o.toJson());
      checkMapOfString(od);
    });
  });


  unittest.group("obj-schema-MaritalStatus", () {
    unittest.test("to-json--from-json", () {
      var o = buildMaritalStatus();
      var od = new api.MaritalStatus.fromJson(o.toJson());
      checkMaritalStatus(od);
    });
  });


  unittest.group("obj-schema-User", () {
    unittest.test("to-json--from-json", () {
      var o = buildUser();
      var od = new api.User.fromJson(o.toJson());
      checkUser(od);
    });
  });


  unittest.group("obj-schema-UserInscription", () {
    unittest.test("to-json--from-json", () {
      var o = buildUserInscription();
      var od = new api.UserInscription.fromJson(o.toJson());
      checkUserInscription(od);
    });
  });


  unittest.group("resource-InscriptionApi", () {
    unittest.test("method--companyInscription", () {

      var mock = new HttpServerMock();
      api.InscriptionApi res = new api.InscriptionApi(mock);
      var arg_request = buildCompanyInscription();
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.CompanyInscription.fromJson(json);
        checkCompanyInscription(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 15), unittest.equals("inscription/v1/"));
        pathOffset += 15;
        unittest.expect(path.substring(pathOffset, pathOffset + 7), unittest.equals("company"));
        pathOffset += 7;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildMapOfString());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.companyInscription(arg_request).then(unittest.expectAsync(((api.MapOfString response) {
        checkMapOfString(response);
      })));
    });

    unittest.test("method--userInscription", () {

      var mock = new HttpServerMock();
      api.InscriptionApi res = new api.InscriptionApi(mock);
      var arg_request = buildUserInscription();
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.UserInscription.fromJson(json);
        checkUserInscription(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 15), unittest.equals("inscription/v1/"));
        pathOffset += 15;
        unittest.expect(path.substring(pathOffset, pathOffset + 4), unittest.equals("user"));
        pathOffset += 4;

        var query = (req.url).query;
        var queryOffset = 0;
        var queryMap = {};
        addQueryParam(n, v) => queryMap.putIfAbsent(n, () => []).add(v);
        parseBool(n) {
          if (n == "true") return true;
          if (n == "false") return false;
          if (n == null) return null;
          throw new core.ArgumentError("Invalid boolean: $n");
        }
        if (query.length > 0) {
          for (var part in query.split("&")) {
            var keyvalue = part.split("=");
            addQueryParam(core.Uri.decodeQueryComponent(keyvalue[0]), core.Uri.decodeQueryComponent(keyvalue[1]));
          }
        }


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildMapOfString());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.userInscription(arg_request).then(unittest.expectAsync(((api.MapOfString response) {
        checkMapOfString(response);
      })));
    });

  });


}

