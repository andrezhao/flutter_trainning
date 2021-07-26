import 'package:my_test_flutter/generated/json/base/json_convert_content.dart';

class TestEntity with JsonConvert<TestEntity> {
	List<TestData> data;
	int errorCode;
	String errorMsg;
}

class TestData with JsonConvert<TestData> {
	List<TestDataChildren> children;
	int courseId;
	int id;
	String name;
	int order;
	int parentChapterId;
	bool userControlSetTop;
	int visible;
}

class TestDataChildren with JsonConvert<TestDataChildren> {
	List<dynamic> children;
	int courseId;
	int id;
	String name;
	int order;
	int parentChapterId;
	bool userControlSetTop;
	int visible;
}
