library googleapis.user.v1.test;

import "dart:core" as core;
import "dart:collection" as collection;
import "dart:async" as async;
import "dart:convert" as convert;

import 'package:http/http.dart' as http;
import 'package:http/testing.dart' as http_testing;
import 'package:unittest/unittest.dart' as unittest;

import 'package:googleapis/user/v1.dart' as api;

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

buildUnnamed19() {
  var o = new core.List<api.Child>();
  o.add(buildChild());
  o.add(buildChild());
  return o;
}

checkUnnamed19(core.List<api.Child> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkChild(o[0]);
  checkChild(o[1]);
}

core.int buildCounterFamily = 0;
buildFamily() {
  var o = new api.Family();
  buildCounterFamily++;
  if (buildCounterFamily < 3) {
    o.children = buildUnnamed19();
    o.maritalStatus = buildMaritalStatus();
  }
  buildCounterFamily--;
  return o;
}

checkFamily(api.Family o) {
  buildCounterFamily++;
  if (buildCounterFamily < 3) {
    checkUnnamed19(o.children);
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

buildListOfUser() {
  var o = new api.ListOfUser();
  o.add(buildUser());
  o.add(buildUser());
  return o;
}

checkListOfUser(api.ListOfUser o) {
  unittest.expect(o, unittest.hasLength(2));
  checkUser(o[0]);
  checkUser(o[1]);
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


main() {
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


  unittest.group("obj-schema-ListOfUser", () {
    unittest.test("to-json--from-json", () {
      var o = buildListOfUser();
      var od = new api.ListOfUser.fromJson(o.toJson());
      checkListOfUser(od);
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


  unittest.group("resource-Managment_ResourceApi", () {
    unittest.test("method--deleteModel", () {

      var mock = new HttpServerMock();
      api.Managment_ResourceApi res = new api.UserApi(mock).managment_;
      var arg_filter = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 8), unittest.equals("user/v1/"));
        pathOffset += 8;
        unittest.expect(path.substring(pathOffset, pathOffset + 4), unittest.equals("data"));
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
        unittest.expect(queryMap["filter"].first, unittest.equals(arg_filter));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildUser());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.deleteModel(filter: arg_filter).then(unittest.expectAsync(((api.User response) {
        checkUser(response);
      })));
    });

    unittest.test("method--deleteModelId", () {

      var mock = new HttpServerMock();
      api.Managment_ResourceApi res = new api.UserApi(mock).managment_;
      var arg_id = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 8), unittest.equals("user/v1/"));
        pathOffset += 8;
        unittest.expect(path.substring(pathOffset, pathOffset + 5), unittest.equals("data/"));
        pathOffset += 5;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_id"));

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
      res.deleteModelId(arg_id).then(unittest.expectAsync(((api.MapOfString response) {
        checkMapOfString(response);
      })));
    });

    unittest.test("method--getModel", () {

      var mock = new HttpServerMock();
      api.Managment_ResourceApi res = new api.UserApi(mock).managment_;
      var arg_filter = "foo";
      var arg_limit = 42;
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 8), unittest.equals("user/v1/"));
        pathOffset += 8;
        unittest.expect(path.substring(pathOffset, pathOffset + 4), unittest.equals("data"));
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
        unittest.expect(queryMap["filter"].first, unittest.equals(arg_filter));
        unittest.expect(core.int.parse(queryMap["limit"].first), unittest.equals(arg_limit));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildListOfUser());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.getModel(filter: arg_filter, limit: arg_limit).then(unittest.expectAsync(((api.ListOfUser response) {
        checkListOfUser(response);
      })));
    });

    unittest.test("method--getModelById", () {

      var mock = new HttpServerMock();
      api.Managment_ResourceApi res = new api.UserApi(mock).managment_;
      var arg_id = "foo";
      var arg_filter = "foo";
      var arg_limit = 42;
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 8), unittest.equals("user/v1/"));
        pathOffset += 8;
        unittest.expect(path.substring(pathOffset, pathOffset + 5), unittest.equals("data/"));
        pathOffset += 5;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_id"));

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
        unittest.expect(queryMap["filter"].first, unittest.equals(arg_filter));
        unittest.expect(core.int.parse(queryMap["limit"].first), unittest.equals(arg_limit));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildUser());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.getModelById(arg_id, filter: arg_filter, limit: arg_limit).then(unittest.expectAsync(((api.User response) {
        checkUser(response);
      })));
    });

    unittest.test("method--patchModel", () {

      var mock = new HttpServerMock();
      api.Managment_ResourceApi res = new api.UserApi(mock).managment_;
      var arg_request = buildUser();
      var arg_id = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.User.fromJson(json);
        checkUser(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 8), unittest.equals("user/v1/"));
        pathOffset += 8;
        unittest.expect(path.substring(pathOffset, pathOffset + 5), unittest.equals("data/"));
        pathOffset += 5;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_id"));

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
        var resp = "";
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.patchModel(arg_request, arg_id).then(unittest.expectAsync((_) {}));
    });

    unittest.test("method--postModel", () {

      var mock = new HttpServerMock();
      api.Managment_ResourceApi res = new api.UserApi(mock).managment_;
      var arg_request = buildUser();
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.User.fromJson(json);
        checkUser(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 8), unittest.equals("user/v1/"));
        pathOffset += 8;
        unittest.expect(path.substring(pathOffset, pathOffset + 4), unittest.equals("data"));
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
        var resp = convert.JSON.encode(buildUser());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.postModel(arg_request).then(unittest.expectAsync(((api.User response) {
        checkUser(response);
      })));
    });

    unittest.test("method--updateModel", () {

      var mock = new HttpServerMock();
      api.Managment_ResourceApi res = new api.UserApi(mock).managment_;
      var arg_request = buildUser();
      var arg_id = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.User.fromJson(json);
        checkUser(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 8), unittest.equals("user/v1/"));
        pathOffset += 8;
        unittest.expect(path.substring(pathOffset, pathOffset + 5), unittest.equals("data/"));
        pathOffset += 5;
        subPart = core.Uri.decodeQueryComponent(path.substring(pathOffset));
        pathOffset = path.length;
        unittest.expect(subPart, unittest.equals("$arg_id"));

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
        var resp = convert.JSON.encode(buildUser());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.updateModel(arg_request, arg_id).then(unittest.expectAsync(((api.User response) {
        checkUser(response);
      })));
    });

  });


}

