import React from 'react';
import {AppRegistry, StyleSheet, Text, View, Image, SafeAreaView} from 'react-native';

class About extends React.Component {
  render() {
    return (
      <SafeAreaView style={styles.container}>
        <Text style={styles.highScoresTitle}>This is About...</Text>
        <Image style={{flex:1, width: 375, resizeMode: 'contain'}} source={require('../../screenshots/dog.jpg')} />
      </SafeAreaView>
    );
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#FFFFFF',
  },
  highScoresTitle: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
    height: 20
  },
});

module.exports = About