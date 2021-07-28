class TreeEntity {
  List<TreeData>? data;
  int? errorCode;
  String? errorMsg;

  TreeEntity({this.data, this.errorCode, this.errorMsg});

  TreeEntity.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <TreeData>[];(json['data'] as List).forEach((v) { data!.add(new TreeData.fromJson(v)); });
    }
    errorCode = json['errorCode'];
    errorMsg = json['errorMsg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] =  this.data!.map((v) => v.toJson()).toList();
    }
    data['errorCode'] = this.errorCode;
    data['errorMsg'] = this.errorMsg;
    return data;
  }
}

class TreeData {
  late int visible;
  late List<TreeDatachild> children;
 late  String name;
  late bool userControlSetTop;
 late  int id;
  late int courseId;
  late int parentChapterId;
  late int order;
   bool? isExpanded;//标识是否初始化

  TreeData({required this.visible, required this.children, required this.name, required this.userControlSetTop, required this.id, required this.courseId, required this.parentChapterId, required this.order,required this.isExpanded});

  TreeData.fromJson(Map<String, dynamic> json) {
    visible = json['visible'];
    if (json['children'] != null) {
      children = <TreeDatachild>[];(json['children'] as List).forEach((v) { children.add(new TreeDatachild.fromJson(v)); });
    }
    name = json['name'];
    userControlSetTop = json['userControlSetTop'];
    id = json['id'];
    courseId = json['courseId'];
    parentChapterId = json['parentChapterId'];
    order = json['order'];
    isExpanded = json['isExpanded'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['visible'] = this.visible;
    if (this.children != null) {
      data['children'] =  this.children.map((v) => v.toJson()).toList();
    }
    data['name'] = this.name;
    data['userControlSetTop'] = this.userControlSetTop;
    data['id'] = this.id;
    data['courseId'] = this.courseId;
    data['parentChapterId'] = this.parentChapterId;
    data['order'] = this.order;
    data['isExpanded'] = this.isExpanded;
    return data;
  }
}

class TreeDatachild {
  late int visible;
  late List<Null> children;
  late String name;
  late bool userControlSetTop;
  late int id;
  late int courseId;
  late int parentChapterId;
  late int order;

  TreeDatachild({required this.visible, required this.children, required this.name, required this.userControlSetTop, required this.id, required this.courseId, required this.parentChapterId, required this.order});

  TreeDatachild.fromJson(Map<String, dynamic> json) {
    visible = json['visible'];
    if (json['children'] != null) {
      children = <Null>[];
    }
    name = json['name'];
    userControlSetTop = json['userControlSetTop'];
    id = json['id'];
    courseId = json['courseId'];
    parentChapterId = json['parentChapterId'];
    order = json['order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['visible'] = this.visible;
    if (this.children != null) {
      data['children'] =  [];
    }
    data['name'] = this.name;
    data['userControlSetTop'] = this.userControlSetTop;
    data['id'] = this.id;
    data['courseId'] = this.courseId;
    data['parentChapterId'] = this.parentChapterId;
    data['order'] = this.order;
    return data;
  }
}
