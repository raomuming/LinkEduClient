
'use strict';

import React from 'react';
import AriColors from './AriColors';
import { Dimensions, StyleSheet, View, Image } from 'react-native';

const WIN_WIDTH = Dimensions.get('window').width;
const WIN_HEIGHT = Dimensions.get('window').height;

class LaunchScreen extends React.Component {

    static __cards__;

    render() {
        return (
            <View style={[styles.container, this.props.style]}>
                <Image
                    source={require('./img/launchscreen.png')}
                    style={styles.image}
                />
            </View>
        );
    }
}

const styles = StyleSheet.create({
    container: {
        flex: 1,
        backgroundColor: AriColors.bianca
    },
    image: {
        position: 'absolute',
        left: 0,
        top: 0,
        width: WIN_WIDTH,
        height: WIN_HEIGHT,
        resizeMode: 'cover'
    }
});

const launchScreen = LaunchScreen;
launchScreen.__cards__ = define => {
    define('Default', _ => <LaunchScreen/>);
};

module.exports = launchScreen;