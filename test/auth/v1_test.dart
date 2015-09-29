library googleapis.auth.v1.test;

import "dart:core" as core;
import "dart:collection" as collection;
import "dart:async" as async;
import "dart:convert" as convert;

import 'package:http/http.dart' as http;
import 'package:http/testing.dart' as http_testing;
import 'package:unittest/unittest.dart' as unittest;

import 'package:googleapis/auth/v1.dart' as api;

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

core.int buildCounterStatusCode = 0;
buildStatusCode() {
  var o = new api.StatusCode();
  buildCounterStatusCode++;
  if (buildCounterStatusCode < 3) {
    o.value = 42;
  }
  buildCounterStatusCode--;
  return o;
}

checkStatusCode(api.StatusCode o) {
  buildCounterStatusCode++;
  if (buildCounterStatusCode < 3) {
    unittest.expect(o.value, unittest.equals(42));
  }
  buildCounterStatusCode--;
}

buildUnnamed0() {
  var o = new core.Map<core.String, core.String>();
  o["x"] = "foo";
  o["y"] = "foo";
  return o;
}

checkUnnamed0(core.Map<core.String, core.String> o) {
  unittest.expect(o, unittest.hasLength(2));
  unittest.expect(o["x"], unittest.equals('foo'));
  unittest.expect(o["y"], unittest.equals('foo'));
}

core.int buildCounterStatusMessage = 0;
buildStatusMessage() {
  var o = new api.StatusMessage();
  buildCounterStatusMessage++;
  if (buildCounterStatusMessage < 3) {
    o.code = buildStatusCode();
    o.info = buildUnnamed0();
    o.message = "foo";
    o.name = "foo";
    o.valid = true;
  }
  buildCounterStatusMessage--;
  return o;
}

checkStatusMessage(api.StatusMessage o) {
  buildCounterStatusMessage++;
  if (buildCounterStatusMessage < 3) {
    checkStatusCode(o.code);
    checkUnnamed0(o.info);
    unittest.expect(o.message, unittest.equals('foo'));
    unittest.expect(o.name, unittest.equals('foo'));
    unittest.expect(o.valid, unittest.isTrue);
  }
  buildCounterStatusMessage--;
}


main() {
  unittest.group("obj-schema-MapOfString", () {
    unittest.test("to-json--from-json", () {
      var o = buildMapOfString();
      var od = new api.MapOfString.fromJson(o.toJson());
      checkMapOfString(od);
    });
  });


  unittest.group("obj-schema-StatusCode", () {
    unittest.test("to-json--from-json", () {
      var o = buildStatusCode();
      var od = new api.StatusCode.fromJson(o.toJson());
      checkStatusCode(od);
    });
  });


  unittest.group("obj-schema-StatusMessage", () {
    unittest.test("to-json--from-json", () {
      var o = buildStatusMessage();
      var od = new api.StatusMessage.fromJson(o.toJson());
      checkStatusMessage(od);
    });
  });


  unittest.group("resource-AuthApi", () {
    unittest.test("method--check", () {

      var mock = new HttpServerMock();
      api.AuthApi res = new api.AuthApi(mock);
      var arg_username = "foo";
      var arg_password = "foo";
      var arg_authId = "foo";
      var arg_requiredAccesLevel = 42;
      var arg_askRight = "foo";
      var arg_resources = "foo";
      var arg_companyId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 8), unittest.equals("auth/v1/"));
        pathOffset += 8;
        unittest.expect(path.substring(pathOffset, pathOffset + 5), unittest.equals("check"));
        pathOffset += 5;

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
        unittest.expect(queryMap["username"].first, unittest.equals(arg_username));
        unittest.expect(queryMap["password"].first, unittest.equals(arg_password));
        unittest.expect(queryMap["authId"].first, unittest.equals(arg_authId));
        unittest.expect(core.int.parse(queryMap["requiredAccesLevel"].first), unittest.equals(arg_requiredAccesLevel));
        unittest.expect(queryMap["askRight"].first, unittest.equals(arg_askRight));
        unittest.expect(queryMap["resources"].first, unittest.equals(arg_resources));
        unittest.expect(queryMap["companyId"].first, unittest.equals(arg_companyId));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildStatusMessage());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.check(username: arg_username, password: arg_password, authId: arg_authId, requiredAccesLevel: arg_requiredAccesLevel, askRight: arg_askRight, resources: arg_resources, companyId: arg_companyId).then(unittest.expectAsync(((api.StatusMessage response) {
        checkStatusMessage(response);
      })));
    });

    unittest.test("method--login", () {

      var mock = new HttpServerMock();
      api.AuthApi res = new api.AuthApi(mock);
      var arg_username = "foo";
      var arg_password = "foo";
      var arg_authId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 8), unittest.equals("auth/v1/"));
        pathOffset += 8;
        unittest.expect(path.substring(pathOffset, pathOffset + 5), unittest.equals("login"));
        pathOffset += 5;

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
        unittest.expect(queryMap["username"].first, unittest.equals(arg_username));
        unittest.expect(queryMap["password"].first, unittest.equals(arg_password));
        unittest.expect(queryMap["authId"].first, unittest.equals(arg_authId));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildStatusMessage());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.login(username: arg_username, password: arg_password, authId: arg_authId).then(unittest.expectAsync(((api.StatusMessage response) {
        checkStatusMessage(response);
      })));
    });

    unittest.test("method--logout", () {

      var mock = new HttpServerMock();
      api.AuthApi res = new api.AuthApi(mock);
      var arg_authId = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 8), unittest.equals("auth/v1/"));
        pathOffset += 8;
        unittest.expect(path.substring(pathOffset, pathOffset + 6), unittest.equals("logout"));
        pathOffset += 6;

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
        unittest.expect(queryMap["authId"].first, unittest.equals(arg_authId));


        var h = {
          "content-type" : "application/json; charset=utf-8",
        };
        var resp = convert.JSON.encode(buildMapOfString());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.logout(authId: arg_authId).then(unittest.expectAsync(((api.MapOfString response) {
        checkMapOfString(response);
      })));
    });

  });


}

