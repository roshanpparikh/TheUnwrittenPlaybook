import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_core/flutter_chat_core.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:intl/intl.dart';
import 'package:upwork_the_unwritten_playbook/core/bloc/app_bloc.dart';
import 'package:upwork_the_unwritten_playbook/core/bloc/app_event.dart';
import 'package:upwork_the_unwritten_playbook/core/navigation/navigation_action.dart';
import 'package:upwork_the_unwritten_playbook/core/navigation/page_configuration.dart';
import 'package:upwork_the_unwritten_playbook/core/ui/context_utils.dart';
import 'package:upwork_the_unwritten_playbook/di/dependency_provider.dart';
import 'package:upwork_the_unwritten_playbook/domain/repositories/book_repository.dart';
import 'package:upwork_the_unwritten_playbook/isar/app_isar.dart';
import 'package:uuid/uuid.dart';

import 'chat_page_cubit.dart';
import 'isar_chat_controller.dart';

const _kTypingMessageId = "BookAssistantReplyLoadingCustomMessage";

class ChatPage extends StatelessWidget {
  const ChatPage._({super.key, this.chapterId});

  final String? chapterId;

  factory ChatPage({ Key? key}) => ChatPage._(key: key,);

  factory ChatPage.chapter({Key? key, required String id}) => ChatPage._(key: key, chapterId: id,);


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ChatPageCubit(chapterId,
      DependencyProvider.get<BookRepository>()
      ),
      child: _ChatPageView(),
    );
  }
}

class _ChatPageView extends StatefulWidget {
  const _ChatPageView();

  @override
  State<_ChatPageView> createState() => _ChatPageViewState();
}

class _ChatPageViewState extends State<_ChatPageView> {
  final _user = const User(id: 'user', name: 'You');
  final _bookAssistant = const User(
    id: 'bookAssistant',
    name: 'Book Assistant',
  );
  IsarChatController? _chatController;
  final _timeFormatter = DateFormat('HH:mm');
  String? _lastBookAssistantMessageId;

  Message? _loadingMessage;

  @override
  void initState() {
    super.initState();
    AppIsar.instance().then((isar) {
      if (!mounted) return;
      final cubit = context.read<ChatPageCubit>();
      final controller = IsarChatController(isar, cubit.state.chapterId);
      setState(() => _chatController = controller);

      final history = controller.messages
          .whereType<TextMessage>()
          .map(
            (m) => {
              'role': m.authorId == 'bookAssistant' ? 'assistant' : 'user',
              'content': m.text,
            },
          )
          .toList();
      cubit.loadHistory(history);
    });
  }

  @override
  void dispose() {
    _chatController?.dispose();
    super.dispose();
  }

  void _onSendPressed(String message) async {
    FocusScope.of(context).unfocus();
    final createdAt = DateTime.now();
    final userMessage = TextMessage(
      id: const Uuid().v4(),
      authorId: _user.id,
      text: message,
      createdAt: createdAt,
    );
    await _chatController?.insertMessage(userMessage);
    context.read<ChatPageCubit>().sendMessage(message);
     _loadingMessage = TextMessage(
      authorId: _bookAssistant.id,
      id: _kTypingMessageId + createdAt.toIso8601String(),
      text: '',
      createdAt: DateTime.now(),
    );
    await _chatController?.toggleLoadingMessage(_loadingMessage!);
  }

  void _handleNewReply(String aiText) {
    _lastBookAssistantMessageId = const Uuid().v4();
    final bookAssistantMessage = TextMessage(
      id: _lastBookAssistantMessageId!,
      authorId: _bookAssistant.id,
      text: aiText,
      createdAt: DateTime.now(),
    );

    if (_loadingMessage != null) {
      _chatController?.toggleLoadingMessage(
        _loadingMessage!,
        resultMessage: bookAssistantMessage,
      );
    } else {
      _chatController?.insertMessage(bookAssistantMessage);
    }

    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cubit = context.read<ChatPageCubit>();

    if (_chatController == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return MultiBlocListener(
      listeners: [
        BlocListener<ChatPageCubit, ChatPageState>(
          listenWhen: (prev, curr) =>
              curr.latestReply != null &&
              curr.latestReply?.id != prev.latestReply?.id,
          listener: (context, state) {
            if (state.latestReply != null) {
              _handleNewReply(state.latestReply!.text);
            }
          },
        ),
      ],
      child: Container(
        color: theme.scaffoldBackgroundColor,
        padding: EdgeInsets.only(
          top: context.read<ChatPageCubit>().state.chapterId != null ? 0 : 48,
          bottom:
              (MediaQuery.of(context).viewInsets.bottom -
                      kBottomNavigationBarHeight)
                  .clamp(0, 200),
        ),
        child: Chat(
          currentUserId: _user.id,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          resolveUser: (userId) async =>
              userId == _user.id ? _user : _bookAssistant,
          chatController: _chatController!,
          onMessageSend: _onSendPressed,
          builders: Builders(
            textMessageBuilder: (context, message, index,
                {required isSentByMe, groupStatus}) =>
                _textMessageBuilder(context ,message, index, isSentByMe: isSentByMe, groupStatus: groupStatus, getChapterNameById: cubit.state.chapterId != null ? null : cubit.getChapterName),
            composerBuilder: (c) => Composer(
              hintText: 'Type a message...',
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              sendIconColor: theme.colorScheme.primary,
              emptyFieldSendIconColor: theme.colorScheme.primary.withValues(
                alpha: 0.5,
              ),
            ),
          ),
        ),
      ),
    );
  }



  Widget _textMessageBuilder(
    BuildContext context,
    TextMessage message,
    int index, {
    required bool isSentByMe,
    MessageGroupStatus? groupStatus,
        String? Function(int number)? getChapterNameById
  }) {
    final bodyStyle = Theme.of(context).textTheme.bodyMedium!;
    final color = (context.isDarkMode ? Colors.white : Colors.black).withValues(
      alpha: 0.5,
    );
    if (message.id.contains(_kTypingMessageId)) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        alignment: isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
        child: Row(
          spacing: 16,
          children: [
            Text(
              "Thinking",
              style: bodyStyle.copyWith(fontSize: 14, color: color),
            ),
            IsTypingIndicator(size: 14, color: color),
          ],
        ),
      );
    }

    final isLastAviMessage =
        message.authorId == _bookAssistant.id &&
        message.id == _lastBookAssistantMessageId;
    final bgColor = getMessageBgColor(isSentByMe, isLastAviMessage);

    final time = _timeFormatter.format(message.createdAt ?? DateTime.now());

    final chapterId = int.tryParse(message.metadata?['chapterId'] ?? "");
    final chapterName = chapterId != null && getChapterNameById != null ?  getChapterNameById(chapterId) : null;
    return Align(
      alignment: isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if(chapterName != null)
              GestureDetector(
                onTap: () {
                  context.read<AppBloc>().add(AppEvent.setNavigationAction(NavigationAction.add(
                      PageConfiguration.chapter(number: chapterId!)))
                  );
                },
                child: Text(
                  chapterName,
                  style: bodyStyle.copyWith(
                      fontSize: 10,
                      color: Colors.blue.shade900,
                    decoration: TextDecoration.underline,decorationColor: Colors.blue.shade900
                  ),
                ),
              ),
            SizedBox(height: 4,),
            Text(
              message.text,
              style: bodyStyle.copyWith(
                fontSize: 14,
                color: isLastAviMessage
                    ? Colors.blue.shade900
                    : Colors.black87,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              time,
              style: bodyStyle.copyWith(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Color getMessageBgColor(bool isMy, bool isLast) => isMy
      ? Colors.green.shade100
      : isLast
      ? Colors.lightBlue.shade50
      : Colors.grey.shade200;
}
