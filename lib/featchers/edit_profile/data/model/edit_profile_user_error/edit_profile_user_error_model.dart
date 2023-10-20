import 'message.dart';

class EditProfileUserErrorModel {
	String? status;
	Message? message;
	dynamic list;
	int? code;

	EditProfileUserErrorModel({this.status, this.message, this.list, this.code});

	factory EditProfileUserErrorModel.fromJson(Map<String, dynamic> json) {
		return EditProfileUserErrorModel(
			status: json['Status'] as String?,
			message: json['Message'] == null
						? null
						: Message.fromJson(json['Message'] as Map<String, dynamic>),
			list: json['List'] as dynamic,
			code: json['Code'] as int?,
		);
	}



	Map<String, dynamic> toJson() => {
				'Status': status,
				'Message': message?.toJson(),
				'List': list,
				'Code': code,
			};
}
