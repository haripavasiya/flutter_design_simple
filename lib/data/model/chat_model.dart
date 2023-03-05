class ChatModel {
  ChatModel({
    required this.success,
    required this.message,
    required this.chatList,
  });
  late final bool success;
  late final String message;
  late final List<ChatList> chatList;

  ChatModel.fromJson(Map<String, dynamic> json){
    success = json['success'];
    message = json['message'];
    chatList = List.from(json['chat_list']).map((e)=>ChatList.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['message'] = message;
    _data['chat_list'] = chatList.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class ChatList {
  ChatList({
    required this.chatId,
    required this.userId,
    required this.message,
    required this.type,
    required this.chatCreated,
  });
  late final int chatId;
  late final int userId;
  late final String message;
  late final int type;
  late final String chatCreated;

  ChatList.fromJson(Map<String, dynamic> json){
    chatId = json['chat_id'];
    userId = json['user_id'];
    message = json['message'];
    type = json['type'];
    chatCreated = json['chat_created'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['chat_id'] = chatId;
    _data['user_id'] = userId;
    _data['message'] = message;
    _data['type'] = type;
    _data['chat_created'] = chatCreated;
    return _data;
  }
}