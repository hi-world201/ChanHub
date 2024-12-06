import 'package:flutter/material.dart';

import '../../../models/index.dart';
import '../utils/index.dart';
import './index.dart';

class ThreadCard extends StatelessWidget {
  const ThreadCard({
    super.key,
    required this.creator,
    required this.createdAt,
    this.content,
    this.mediaUrls,
    this.tasks,
    this.reactions,
    this.comments,
    this.updatedAt,
    required this.onReactionPressed,
    required this.onChangeTaskStatus,
  });

  final User creator;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final String? content;
  final List<String>? mediaUrls;
  final List<Task>? tasks;
  final List<Reaction>? reactions;
  final List<Comment>? comments;
  final Future<void> Function(Reaction) onReactionPressed;
  final Future<void> Function(Task task) onChangeTaskStatus;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Avatar
          UserAvatar(creator),
          const SizedBox(width: 10.0),

          // Content
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Header
                ThreadTitle(
                  creator,
                  createdAt,
                  updatedAt: updatedAt,
                ),

                // Body (Content, Media, Reaction)
                if (content != null) ThreadContent(content!),

                if (mediaUrls != null && mediaUrls!.isNotEmpty) ...[
                  const SizedBox(height: 5.0),
                  MediaPreview(
                    mediaUrls!,
                    height: 150,
                    width: 150,
                  ),
                ],

                if (tasks != null && tasks!.isNotEmpty) ...[
                  const SizedBox(height: 5.0),
                  TaskPreview(
                    tasks!,
                    onTaskStatusChanged: onChangeTaskStatus,
                  ),
                ],

                if (reactions != null) ...[
                  const SizedBox(height: 5.0),
                  ThreadReaction(
                    reactions!,
                    onReactionPressed: onReactionPressed,
                  ),
                ],

                // Footer
                if (comments != null && comments!.isNotEmpty) ...[
                  const SizedBox(height: 5.0),
                  ThreadComment(comments!.length),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ThreadTitle extends StatelessWidget {
  const ThreadTitle(
    this.user,
    this.createdAt, {
    super.key,
    this.updatedAt,
  });

  final User user;
  final DateTime createdAt;
  final DateTime? updatedAt;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Username
          Text(
            user.fullname,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const Spacer(),

          // Timestamp
          if (updatedAt?.isAfter(createdAt) ?? false) ...[
            const Icon(Icons.update_outlined, size: 15.0),
            const SizedBox(width: 5.0),
          ],

          Text(
            formatTime(createdAt),
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ],
      ),
    );
  }
}

class ThreadContent extends StatelessWidget {
  const ThreadContent(
    this.content, {
    super.key,
  });

  final String content;

  @override
  Widget build(BuildContext context) {
    return Text(content);
  }
}

class ThreadComment extends StatelessWidget {
  const ThreadComment(
    this.totalReplies, {
    super.key,
  });

  final int totalReplies;

  @override
  Widget build(BuildContext context) {
    return Text(
      formatTotalReplies(totalReplies),
      style: Theme.of(context).textTheme.titleMedium,
    );
  }
}
