import 'package:flutter/material.dart';

import '../themes/chanhub_colors.dart';
import './enums.dart';

const Map<String, ReactionType> reactionType = {
  'like': ReactionType.like,
  'love': ReactionType.love,
  'haha': ReactionType.haha,
  'seen': ReactionType.seen,
  'completed': ReactionType.completed,
  'dislike': ReactionType.dislike,
};

const Map<ReactionType, String> reactionTypeString = {
  ReactionType.like: 'like',
  ReactionType.love: 'love',
  ReactionType.haha: 'haha',
  ReactionType.seen: 'seen',
  ReactionType.completed: 'completed',
  ReactionType.dislike: 'dislike',
};

const Map<TaskStatus, String> taskStatusString = {
  TaskStatus.inProgress: 'In Progress',
  TaskStatus.completed: 'Completed',
  TaskStatus.overdue: 'Overdue',
  TaskStatus.overdueCompleted: 'Overdue Completed',
};

const String defaultUserAvatarUrl =
    'https://cdn.icon-icons.com/icons2/1378/PNG/512/avatardefault_92824.png';

const Map<SearchThreadFilter, String> searchThreadFilterString = {
  SearchThreadFilter.all: 'All Threads',
  // SearchThreadFilter.unread: 'Unread',
  SearchThreadFilter.myThreads: 'My Threads',
  // SearchThreadFilter.tagged: 'Tagged',
};

const Map<StatusType, Color> statusColor = {
  StatusType.error: ChanHubColors.error,
  StatusType.info: ChanHubColors.secondary,
  StatusType.warning: Colors.orange,
  StatusType.success: ChanHubColors.primary,
};

const Map<ChannelPrivacy, String> channelPrivacyString = {
  ChannelPrivacy.public: 'public',
  ChannelPrivacy.private: 'private',
};

const Map<String, ChannelPrivacy> channelPrivacyFromString = {
  'public': ChannelPrivacy.public,
  'private': ChannelPrivacy.private,
};

const Map<ThreadType, String> threadTypeString = {
  ThreadType.message: 'message',
  ThreadType.event: 'event',
  ThreadType.milestone: 'milestone',
};

const Map<String, ThreadType> threadTypeFromString = {
  'message': ThreadType.message,
  'event': ThreadType.event,
  'milestone': ThreadType.milestone,
};
