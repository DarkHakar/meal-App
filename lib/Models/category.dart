// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Category {
  final id;
  final title;
  final Color color;
  const Category({
    required this.color,
    required this.id,
    required this.title,
  });
}
