import React from 'react';
import {AppRegistry, StyleSheet, Text, View, TouchableOpacity, NativeModules} from 'react-native';
var NativeRNRouterModule = NativeModules.F3HNativeRNRouterModule;

class RNHighScores extends React.Component {

  gotoGame = ()=> {
    NativeRNRouterModule.jumpTo("game", (error, events) => {
      if(error) {
        // do something
          console.log('error', error);
      } else {
        // do something
        // this.setState({events: events});
        console.log('events', events)
      }
    })
  }

  render() {
    var contents = this.props['scores'].map(score => (
      <Text key={score.name}>
        {score.name}:{score.value}
        {'\n'}
      </Text>
    ));
    return (
      <View style={styles.container}>
        <Text style={styles.highScoresTitle}>2048 High Scores!</Text>
        <Text style={styles.scores}>{contents}</Text>
        <TouchableOpacity onPress={this.gotoGame}>
          <Text style={styles.scores}>Go to Game</Text>
        </TouchableOpacity>
      </View>
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
    // color: 'red',
  },
  scores: {
    textAlign: 'center',
    color: '#333333',
    marginBottom: 5,
  },
});

module.exports = RNHighScores