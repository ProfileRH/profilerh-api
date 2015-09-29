// This is a generated file (see the discoveryapis_generator project).

library googleapis.job.v1;

import 'dart:core' as core;
import 'dart:collection' as collection;
import 'dart:async' as async;
import 'dart:convert' as convert;

import 'package:_discoveryapis_commons/_discoveryapis_commons.dart' as commons;
import 'package:http/http.dart' as http;

export 'package:_discoveryapis_commons/_discoveryapis_commons.dart' show
    ApiRequestError, DetailedApiRequestError;

const core.String USER_AGENT = 'dart-api-client job/v1';

class JobApi {

  final commons.ApiRequester _requester;

  Managment_ResourceApi get managment_ => new Managment_ResourceApi(_requester);

  JobApi(http.Client client, {core.String rootUrl: "http://192.168.251.222:8082/", core.String servicePath: "job/v1/"}) :
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
   * Completes with a [Job].
   *
   * Completes with a [commons.ApiRequestError] if the API endpoint returned an
   * error.
   *
   * If the used [http.Client] completes with an error when making a REST call,
   * this method will complete with the same error.
   */
  async.Future<Job> deleteModel({core.String filter}) {
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
    return _response.then((data) => new Job.fromJson(data));
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
   * Completes with a [ListOfJob].
   *
   * Completes with a [commons.ApiRequestError] if the API endpoint returned an
   * error.
   *
   * If the used [http.Client] completes with an error when making a REST call,
   * this method will complete with the same error.
   */
  async.Future<ListOfJob> getModel({core.String filter, core.int limit}) {
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
    return _response.then((data) => new ListOfJob.fromJson(data));
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
   * Completes with a [Job].
   *
   * Completes with a [commons.ApiRequestError] if the API endpoint returned an
   * error.
   *
   * If the used [http.Client] completes with an error when making a REST call,
   * this method will complete with the same error.
   */
  async.Future<Job> getModelById(core.String id, {core.String filter, core.int limit}) {
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
    return _response.then((data) => new Job.fromJson(data));
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
  async.Future patchModel(Job request, core.String id) {
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
   * Completes with a [Job].
   *
   * Completes with a [commons.ApiRequestError] if the API endpoint returned an
   * error.
   *
   * If the used [http.Client] completes with an error when making a REST call,
   * this method will complete with the same error.
   */
  async.Future<Job> postModel(Job request) {
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
    return _response.then((data) => new Job.fromJson(data));
  }

  /**
   * [request] - The metadata request object.
   *
   * Request parameters:
   *
   * [id] - Path parameter: 'id'.
   *
   * Completes with a [Job].
   *
   * Completes with a [commons.ApiRequestError] if the API endpoint returned an
   * error.
   *
   * If the used [http.Client] completes with an error when making a REST call,
   * this method will complete with the same error.
   */
  async.Future<Job> updateModel(Job request, core.String id) {
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
    return _response.then((data) => new Job.fromJson(data));
  }

}



class Activity {
  core.double accountExpense;
  core.int dayOffDue;
  core.int dayOffTaken;
  core.List<JobEvent> events;
  core.int overTime;
  core.int rttDue;
  core.int rttTaken;

  Activity();

  Activity.fromJson(core.Map _json) {
    if (_json.containsKey("accountExpense")) {
      accountExpense = _json["accountExpense"];
    }
    if (_json.containsKey("dayOffDue")) {
      dayOffDue = _json["dayOffDue"];
    }
    if (_json.containsKey("dayOffTaken")) {
      dayOffTaken = _json["dayOffTaken"];
    }
    if (_json.containsKey("events")) {
      events = _json["events"].map((value) => new JobEvent.fromJson(value)).toList();
    }
    if (_json.containsKey("overTime")) {
      overTime = _json["overTime"];
    }
    if (_json.containsKey("rttDue")) {
      rttDue = _json["rttDue"];
    }
    if (_json.containsKey("rttTaken")) {
      rttTaken = _json["rttTaken"];
    }
  }

  core.Map toJson() {
    var _json = new core.Map();
    if (accountExpense != null) {
      _json["accountExpense"] = accountExpense;
    }
    if (dayOffDue != null) {
      _json["dayOffDue"] = dayOffDue;
    }
    if (dayOffTaken != null) {
      _json["dayOffTaken"] = dayOffTaken;
    }
    if (events != null) {
      _json["events"] = events.map((value) => (value).toJson()).toList();
    }
    if (overTime != null) {
      _json["overTime"] = overTime;
    }
    if (rttDue != null) {
      _json["rttDue"] = rttDue;
    }
    if (rttTaken != null) {
      _json["rttTaken"] = rttTaken;
    }
    return _json;
  }
}

class Job {
  Activity activity;
  core.double annualWage;
  core.String businessUnit;
  JobCategory category;
  core.String companyId;
  JobContactInformation contactInformation;
  JobContract contractType;
  core.double hourlyCoefficient;
  core.String id;
  core.String jobTitle;
  core.String refundId;
  core.DateTime startDate;
  core.String timeSheetId;
  core.String userId;

  Job();

  Job.fromJson(core.Map _json) {
    if (_json.containsKey("activity")) {
      activity = new Activity.fromJson(_json["activity"]);
    }
    if (_json.containsKey("annualWage")) {
      annualWage = _json["annualWage"];
    }
    if (_json.containsKey("businessUnit")) {
      businessUnit = _json["businessUnit"];
    }
    if (_json.containsKey("category")) {
      category = new JobCategory.fromJson(_json["category"]);
    }
    if (_json.containsKey("companyId")) {
      companyId = _json["companyId"];
    }
    if (_json.containsKey("contactInformation")) {
      contactInformation = new JobContactInformation.fromJson(_json["contactInformation"]);
    }
    if (_json.containsKey("contractType")) {
      contractType = new JobContract.fromJson(_json["contractType"]);
    }
    if (_json.containsKey("hourlyCoefficient")) {
      hourlyCoefficient = _json["hourlyCoefficient"];
    }
    if (_json.containsKey("id")) {
      id = _json["id"];
    }
    if (_json.containsKey("jobTitle")) {
      jobTitle = _json["jobTitle"];
    }
    if (_json.containsKey("refundId")) {
      refundId = _json["refundId"];
    }
    if (_json.containsKey("startDate")) {
      startDate = core.DateTime.parse(_json["startDate"]);
    }
    if (_json.containsKey("timeSheetId")) {
      timeSheetId = _json["timeSheetId"];
    }
    if (_json.containsKey("userId")) {
      userId = _json["userId"];
    }
  }

  core.Map toJson() {
    var _json = new core.Map();
    if (activity != null) {
      _json["activity"] = (activity).toJson();
    }
    if (annualWage != null) {
      _json["annualWage"] = annualWage;
    }
    if (businessUnit != null) {
      _json["businessUnit"] = businessUnit;
    }
    if (category != null) {
      _json["category"] = (category).toJson();
    }
    if (companyId != null) {
      _json["companyId"] = companyId;
    }
    if (contactInformation != null) {
      _json["contactInformation"] = (contactInformation).toJson();
    }
    if (contractType != null) {
      _json["contractType"] = (contractType).toJson();
    }
    if (hourlyCoefficient != null) {
      _json["hourlyCoefficient"] = hourlyCoefficient;
    }
    if (id != null) {
      _json["id"] = id;
    }
    if (jobTitle != null) {
      _json["jobTitle"] = jobTitle;
    }
    if (refundId != null) {
      _json["refundId"] = refundId;
    }
    if (startDate != null) {
      _json["startDate"] = (startDate).toIso8601String();
    }
    if (timeSheetId != null) {
      _json["timeSheetId"] = timeSheetId;
    }
    if (userId != null) {
      _json["userId"] = userId;
    }
    return _json;
  }
}

class JobCategory {
  core.int value;

  JobCategory();

  JobCategory.fromJson(core.Map _json) {
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

class JobContactInformation {
  core.String localisation;
  core.String mail;
  core.String officePhone;

  JobContactInformation();

  JobContactInformation.fromJson(core.Map _json) {
    if (_json.containsKey("localisation")) {
      localisation = _json["localisation"];
    }
    if (_json.containsKey("mail")) {
      mail = _json["mail"];
    }
    if (_json.containsKey("officePhone")) {
      officePhone = _json["officePhone"];
    }
  }

  core.Map toJson() {
    var _json = new core.Map();
    if (localisation != null) {
      _json["localisation"] = localisation;
    }
    if (mail != null) {
      _json["mail"] = mail;
    }
    if (officePhone != null) {
      _json["officePhone"] = officePhone;
    }
    return _json;
  }
}

class JobContract {
  core.int value;

  JobContract();

  JobContract.fromJson(core.Map _json) {
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

class JobEvent {
  core.DateTime end;
  core.DateTime start;
  JobEventType type;

  JobEvent();

  JobEvent.fromJson(core.Map _json) {
    if (_json.containsKey("end")) {
      end = core.DateTime.parse(_json["end"]);
    }
    if (_json.containsKey("start")) {
      start = core.DateTime.parse(_json["start"]);
    }
    if (_json.containsKey("type")) {
      type = new JobEventType.fromJson(_json["type"]);
    }
  }

  core.Map toJson() {
    var _json = new core.Map();
    if (end != null) {
      _json["end"] = (end).toIso8601String();
    }
    if (start != null) {
      _json["start"] = (start).toIso8601String();
    }
    if (type != null) {
      _json["type"] = (type).toJson();
    }
    return _json;
  }
}

class JobEventType {
  core.int value;

  JobEventType();

  JobEventType.fromJson(core.Map _json) {
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

class ListOfJob
    extends collection.ListBase<Job> {
  final core.List<Job> _inner;

  ListOfJob() : _inner = [];

  ListOfJob.fromJson(core.List json)
      : _inner = json.map((value) => new Job.fromJson(value)).toList();

  core.List toJson() {
    return _inner.map((value) => (value).toJson()).toList();
  }

  Job operator [](core.int key) => _inner[key];

  void operator []=(core.int key, Job value) {
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
