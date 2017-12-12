import React from 'react';
import { AppRegistry, StyleSheet, Text, View } from 'react-native';
import { Pages } from './src';
import codePush from "react-native-code-push";

// Module name
AppRegistry.registerComponent('RNHighScores', () => codePush(Pages.RNHighScores));
AppRegistry.registerComponent('About', () => codePush(Pages.About));