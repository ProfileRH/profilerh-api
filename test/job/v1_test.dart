library googleapis.job.v1.test;

import "dart:core" as core;
import "dart:collection" as collection;
import "dart:async" as async;
import "dart:convert" as convert;

import 'package:http/http.dart' as http;
import 'package:http/testing.dart' as http_testing;
import 'package:unittest/unittest.dart' as unittest;

import 'package:googleapis/job/v1.dart' as api;

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

buildUnnamed16() {
  var o = new core.List<api.JobEvent>();
  o.add(buildJobEvent());
  o.add(buildJobEvent());
  return o;
}

checkUnnamed16(core.List<api.JobEvent> o) {
  unittest.expect(o, unittest.hasLength(2));
  checkJobEvent(o[0]);
  checkJobEvent(o[1]);
}

core.int buildCounterActivity = 0;
buildActivity() {
  var o = new api.Activity();
  buildCounterActivity++;
  if (buildCounterActivity < 3) {
    o.accountExpense = 42.0;
    o.dayOffDue = 42;
    o.dayOffTaken = 42;
    o.events = buildUnnamed16();
    o.overTime = 42;
    o.rttDue = 42;
    o.rttTaken = 42;
  }
  buildCounterActivity--;
  return o;
}

checkActivity(api.Activity o) {
  buildCounterActivity++;
  if (buildCounterActivity < 3) {
    unittest.expect(o.accountExpense, unittest.equals(42.0));
    unittest.expect(o.dayOffDue, unittest.equals(42));
    unittest.expect(o.dayOffTaken, unittest.equals(42));
    checkUnnamed16(o.events);
    unittest.expect(o.overTime, unittest.equals(42));
    unittest.expect(o.rttDue, unittest.equals(42));
    unittest.expect(o.rttTaken, unittest.equals(42));
  }
  buildCounterActivity--;
}

core.int buildCounterJob = 0;
buildJob() {
  var o = new api.Job();
  buildCounterJob++;
  if (buildCounterJob < 3) {
    o.activity = buildActivity();
    o.annualWage = 42.0;
    o.businessUnit = "foo";
    o.category = buildJobCategory();
    o.companyId = "foo";
    o.contactInformation = buildJobContactInformation();
    o.contractType = buildJobContract();
    o.hourlyCoefficient = 42.0;
    o.id = "foo";
    o.jobTitle = "foo";
    o.refundId = "foo";
    o.startDate = core.DateTime.parse("2002-02-27T14:01:02");
    o.timeSheetId = "foo";
    o.userId = "foo";
  }
  buildCounterJob--;
  return o;
}

checkJob(api.Job o) {
  buildCounterJob++;
  if (buildCounterJob < 3) {
    checkActivity(o.activity);
    unittest.expect(o.annualWage, unittest.equals(42.0));
    unittest.expect(o.businessUnit, unittest.equals('foo'));
    checkJobCategory(o.category);
    unittest.expect(o.companyId, unittest.equals('foo'));
    checkJobContactInformation(o.contactInformation);
    checkJobContract(o.contractType);
    unittest.expect(o.hourlyCoefficient, unittest.equals(42.0));
    unittest.expect(o.id, unittest.equals('foo'));
    unittest.expect(o.jobTitle, unittest.equals('foo'));
    unittest.expect(o.refundId, unittest.equals('foo'));
    unittest.expect(o.startDate, unittest.equals(core.DateTime.parse("2002-02-27T14:01:02")));
    unittest.expect(o.timeSheetId, unittest.equals('foo'));
    unittest.expect(o.userId, unittest.equals('foo'));
  }
  buildCounterJob--;
}

core.int buildCounterJobCategory = 0;
buildJobCategory() {
  var o = new api.JobCategory();
  buildCounterJobCategory++;
  if (buildCounterJobCategory < 3) {
    o.value = 42;
  }
  buildCounterJobCategory--;
  return o;
}

checkJobCategory(api.JobCategory o) {
  buildCounterJobCategory++;
  if (buildCounterJobCategory < 3) {
    unittest.expect(o.value, unittest.equals(42));
  }
  buildCounterJobCategory--;
}

core.int buildCounterJobContactInformation = 0;
buildJobContactInformation() {
  var o = new api.JobContactInformation();
  buildCounterJobContactInformation++;
  if (buildCounterJobContactInformation < 3) {
    o.localisation = "foo";
    o.mail = "foo";
    o.officePhone = "foo";
  }
  buildCounterJobContactInformation--;
  return o;
}

checkJobContactInformation(api.JobContactInformation o) {
  buildCounterJobContactInformation++;
  if (buildCounterJobContactInformation < 3) {
    unittest.expect(o.localisation, unittest.equals('foo'));
    unittest.expect(o.mail, unittest.equals('foo'));
    unittest.expect(o.officePhone, unittest.equals('foo'));
  }
  buildCounterJobContactInformation--;
}

core.int buildCounterJobContract = 0;
buildJobContract() {
  var o = new api.JobContract();
  buildCounterJobContract++;
  if (buildCounterJobContract < 3) {
    o.value = 42;
  }
  buildCounterJobContract--;
  return o;
}

checkJobContract(api.JobContract o) {
  buildCounterJobContract++;
  if (buildCounterJobContract < 3) {
    unittest.expect(o.value, unittest.equals(42));
  }
  buildCounterJobContract--;
}

core.int buildCounterJobEvent = 0;
buildJobEvent() {
  var o = new api.JobEvent();
  buildCounterJobEvent++;
  if (buildCounterJobEvent < 3) {
    o.end = core.DateTime.parse("2002-02-27T14:01:02");
    o.start = core.DateTime.parse("2002-02-27T14:01:02");
    o.type = buildJobEventType();
  }
  buildCounterJobEvent--;
  return o;
}

checkJobEvent(api.JobEvent o) {
  buildCounterJobEvent++;
  if (buildCounterJobEvent < 3) {
    unittest.expect(o.end, unittest.equals(core.DateTime.parse("2002-02-27T14:01:02")));
    unittest.expect(o.start, unittest.equals(core.DateTime.parse("2002-02-27T14:01:02")));
    checkJobEventType(o.type);
  }
  buildCounterJobEvent--;
}

core.int buildCounterJobEventType = 0;
buildJobEventType() {
  var o = new api.JobEventType();
  buildCounterJobEventType++;
  if (buildCounterJobEventType < 3) {
    o.value = 42;
  }
  buildCounterJobEventType--;
  return o;
}

checkJobEventType(api.JobEventType o) {
  buildCounterJobEventType++;
  if (buildCounterJobEventType < 3) {
    unittest.expect(o.value, unittest.equals(42));
  }
  buildCounterJobEventType--;
}

buildListOfJob() {
  var o = new api.ListOfJob();
  o.add(buildJob());
  o.add(buildJob());
  return o;
}

checkListOfJob(api.ListOfJob o) {
  unittest.expect(o, unittest.hasLength(2));
  checkJob(o[0]);
  checkJob(o[1]);
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


main() {
  unittest.group("obj-schema-Activity", () {
    unittest.test("to-json--from-json", () {
      var o = buildActivity();
      var od = new api.Activity.fromJson(o.toJson());
      checkActivity(od);
    });
  });


  unittest.group("obj-schema-Job", () {
    unittest.test("to-json--from-json", () {
      var o = buildJob();
      var od = new api.Job.fromJson(o.toJson());
      checkJob(od);
    });
  });


  unittest.group("obj-schema-JobCategory", () {
    unittest.test("to-json--from-json", () {
      var o = buildJobCategory();
      var od = new api.JobCategory.fromJson(o.toJson());
      checkJobCategory(od);
    });
  });


  unittest.group("obj-schema-JobContactInformation", () {
    unittest.test("to-json--from-json", () {
      var o = buildJobContactInformation();
      var od = new api.JobContactInformation.fromJson(o.toJson());
      checkJobContactInformation(od);
    });
  });


  unittest.group("obj-schema-JobContract", () {
    unittest.test("to-json--from-json", () {
      var o = buildJobContract();
      var od = new api.JobContract.fromJson(o.toJson());
      checkJobContract(od);
    });
  });


  unittest.group("obj-schema-JobEvent", () {
    unittest.test("to-json--from-json", () {
      var o = buildJobEvent();
      var od = new api.JobEvent.fromJson(o.toJson());
      checkJobEvent(od);
    });
  });


  unittest.group("obj-schema-JobEventType", () {
    unittest.test("to-json--from-json", () {
      var o = buildJobEventType();
      var od = new api.JobEventType.fromJson(o.toJson());
      checkJobEventType(od);
    });
  });


  unittest.group("obj-schema-ListOfJob", () {
    unittest.test("to-json--from-json", () {
      var o = buildListOfJob();
      var od = new api.ListOfJob.fromJson(o.toJson());
      checkListOfJob(od);
    });
  });


  unittest.group("obj-schema-MapOfString", () {
    unittest.test("to-json--from-json", () {
      var o = buildMapOfString();
      var od = new api.MapOfString.fromJson(o.toJson());
      checkMapOfString(od);
    });
  });


  unittest.group("resource-Managment_ResourceApi", () {
    unittest.test("method--deleteModel", () {

      var mock = new HttpServerMock();
      api.Managment_ResourceApi res = new api.JobApi(mock).managment_;
      var arg_filter = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 7), unittest.equals("job/v1/"));
        pathOffset += 7;
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
        var resp = convert.JSON.encode(buildJob());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.deleteModel(filter: arg_filter).then(unittest.expectAsync(((api.Job response) {
        checkJob(response);
      })));
    });

    unittest.test("method--deleteModelId", () {

      var mock = new HttpServerMock();
      api.Managment_ResourceApi res = new api.JobApi(mock).managment_;
      var arg_id = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 7), unittest.equals("job/v1/"));
        pathOffset += 7;
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
      api.Managment_ResourceApi res = new api.JobApi(mock).managment_;
      var arg_filter = "foo";
      var arg_limit = 42;
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 7), unittest.equals("job/v1/"));
        pathOffset += 7;
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
        var resp = convert.JSON.encode(buildListOfJob());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.getModel(filter: arg_filter, limit: arg_limit).then(unittest.expectAsync(((api.ListOfJob response) {
        checkListOfJob(response);
      })));
    });

    unittest.test("method--getModelById", () {

      var mock = new HttpServerMock();
      api.Managment_ResourceApi res = new api.JobApi(mock).managment_;
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
        unittest.expect(path.substring(pathOffset, pathOffset + 7), unittest.equals("job/v1/"));
        pathOffset += 7;
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
        var resp = convert.JSON.encode(buildJob());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.getModelById(arg_id, filter: arg_filter, limit: arg_limit).then(unittest.expectAsync(((api.Job response) {
        checkJob(response);
      })));
    });

    unittest.test("method--patchModel", () {

      var mock = new HttpServerMock();
      api.Managment_ResourceApi res = new api.JobApi(mock).managment_;
      var arg_request = buildJob();
      var arg_id = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.Job.fromJson(json);
        checkJob(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 7), unittest.equals("job/v1/"));
        pathOffset += 7;
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
      api.Managment_ResourceApi res = new api.JobApi(mock).managment_;
      var arg_request = buildJob();
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.Job.fromJson(json);
        checkJob(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 7), unittest.equals("job/v1/"));
        pathOffset += 7;
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
        var resp = convert.JSON.encode(buildJob());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.postModel(arg_request).then(unittest.expectAsync(((api.Job response) {
        checkJob(response);
      })));
    });

    unittest.test("method--updateModel", () {

      var mock = new HttpServerMock();
      api.Managment_ResourceApi res = new api.JobApi(mock).managment_;
      var arg_request = buildJob();
      var arg_id = "foo";
      mock.register(unittest.expectAsync((http.BaseRequest req, json) {
        var obj = new api.Job.fromJson(json);
        checkJob(obj);

        var path = (req.url).path;
        var pathOffset = 0;
        var index;
        var subPart;
        unittest.expect(path.substring(pathOffset, pathOffset + 1), unittest.equals("/"));
        pathOffset += 1;
        unittest.expect(path.substring(pathOffset, pathOffset + 7), unittest.equals("job/v1/"));
        pathOffset += 7;
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
        var resp = convert.JSON.encode(buildJob());
        return new async.Future.value(stringResponse(200, h, resp));
      }), true);
      res.updateModel(arg_request, arg_id).then(unittest.expectAsync(((api.Job response) {
        checkJob(response);
      })));
    });

  });


}

