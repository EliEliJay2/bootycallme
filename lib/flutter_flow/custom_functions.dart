import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import '../backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../auth/auth_util.dart';

bool? hasNoChats(List<ChatsRecord>? allChats) {
  return allChats?.isEmpty ?? true;
}

List<String> combineLists(
  List<String>? matches,
  List<String>? rejected,
) {
  // combine two Lists
  final finalList = matches ?? [];
  finalList.addAll(rejected ?? []);
  return finalList;
}

List<DocumentReference> createChatUserList(
  DocumentReference userRef1,
  DocumentReference userRef2,
) {
  // Create Chat User List
  List<DocumentReference> chatUserRef = [];
  chatUserRef.add(userRef1);
  chatUserRef.add(userRef2);
  return chatUserRef;
}
