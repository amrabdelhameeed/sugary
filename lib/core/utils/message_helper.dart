import 'package:flutter/material.dart';
import 'package:sugar/core/constants/app_assets.dart';

class MessageHelper {
  static String getGlucoseMessage(double glucoseLevel) {
    if (glucoseLevel < 75) {
      return _lowGlucoseMessages();
    } else if (glucoseLevel >= 75 && glucoseLevel <= 130) {
      return _normalGlucoseMessages();
    } else {
      return _highGlucoseMessages();
    }
  }

  static String _lowGlucoseMessages() {
    List<String> messages = ["KEEP CALM and eat Sugar", "Blood sugar is down underground!", "Sweet food means sweet life", "You need to eat yourself! (sugar)", "Eat sugar you're too sour"];
    return _getRandomMessage(messages);
  }

  static String _normalGlucoseMessages() {
    List<String> messages = ["All under control", "Glucose normal, Sugary loves you❤️", "Not low. Not high. You did it!", "High five 🙌. Your blood sugar is where it should be", "Perfectoo"];
    return _getRandomMessage(messages);
  }

  static String _highGlucoseMessages() {
    List<String> messages = [
      "A bit high. Did you take insulin?",
      "Be careful!",
      "You are like a piece of sugar. This is not a compliment!",
      "Your blood is turning into sugar!! Sugar",
      "Blood sugar is up in the sky!",
      "Stop sugar you're sweet enough!"
    ];
    return _getRandomMessage(messages);
  }

  static String _getRandomMessage(List<String> messages) {
    final randomIndex = (messages.length * (DateTime.now().millisecondsSinceEpoch % 1000) / 1000).floor();
    return messages[randomIndex];
  }

  static String getGlucoseMessageImage(int glucoseLevel) {
    if (glucoseLevel < 75) {
      return Assets.assetsAppLow;
    } else if (glucoseLevel >= 75 && glucoseLevel <= 130) {
      return Assets.assetsImHomeicon;
    } else {
      return Assets.assetsAppHigh;
    }
  }

  static Color getGlucoseMessageColor(int glucoseLevel) {
    if (glucoseLevel < 75) {
      return Colors.yellow.shade700;
    } else if (glucoseLevel >= 75 && glucoseLevel <= 130) {
      return Colors.green;
    } else {
      return Colors.red;
    }
  }
}
