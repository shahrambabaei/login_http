class LoginData {
  late Result result;
  late bool isSuccess;
  late int statusCode;
  late List<String> messages;

  LoginData(this.result, this.isSuccess, this.statusCode, this.messages);

  LoginData.fromJson(Map<String, dynamic> json) {
    result = Result.fromJson(json['result']);
    isSuccess = json['isSuccess'];
    statusCode = json['statusCode'];
    messages = json['messages'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['result'] = result.toJson();
    data['isSuccess'] = isSuccess;
    data['statusCode'] = statusCode;
    data['messages'] = messages;
    return data;
  }
}

class Result {
  late int id;
  late String userName;
  late String password;
  late String email;
  late String firstName;
  late String lastName;
  late String fullName;
  late String selfPhone1;
  late String selfPhone2;
  late String tokenAccess;
  late List<Pages> pages;
  late int roleId;
  late String roleName;

  Result(
      this.id,
      this.userName,
      this.password,
      this.email,
      this.firstName,
      this.lastName,
      this.fullName,
      this.selfPhone1,
      this.selfPhone2,
      this.tokenAccess,
      this.pages,
      this.roleId,
      this.roleName);

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    password = json['password'];
    email = json['email'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    fullName = json['fullName'];
    selfPhone1 = json['selfPhone1'];
    selfPhone2 = json['selfPhone2'];
    tokenAccess = json['tokenAccess'];
    if (json['pages'] != null) {
      pages = <Pages>[];
      json['pages'].forEach((v) {
        pages.add( Pages.fromJson(v));
      });
    }
    roleId = json['roleId'];
    roleName = json['roleName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userName'] = userName;
    data['password'] = password;
    data['email'] = email;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['fullName'] = fullName;
    data['selfPhone1'] = selfPhone1;
    data['selfPhone2'] = selfPhone2;
    data['tokenAccess'] = tokenAccess;
    data['pages'] = pages.map((v) => v.toJson()).toList();
    data['roleId'] = roleId;
    data['roleName'] = roleName;
    return data;
  }
}

class Pages {
  late int pageId;
  late String name;
  late String address;
  late String description;
  late int pageOrder;
  late int pageCategoryOrder;
  late String pageCategoryName;

  Pages(this.pageId, this.name, this.address, this.description, this.pageOrder,
      this.pageCategoryOrder, this.pageCategoryName);

  Pages.fromJson(Map<String, dynamic> json) {
    pageId = json['pageId'];
    name = json['name'];
    address = json['address'];
    description = json['description'];
    pageOrder = json['pageOrder'];
    pageCategoryOrder = json['pageCategoryOrder'];
    pageCategoryName = json['pageCategoryName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['pageId'] = pageId;
    data['name'] = name;
    data['address'] = address;
    data['description'] = description;
    data['pageOrder'] = pageOrder;
    data['pageCategoryOrder'] =pageCategoryOrder;
    data['pageCategoryName'] = pageCategoryName;
    return data;
  }
}
