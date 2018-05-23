
'use strict';

import React from 'react';


// Components
//import { Text, View } from 'react-native';
import { Provider } from 'react-redux';
import AriApp from './AriApp';
import configureStore from './store/configureStore';
import LaunchScreen from './common/LaunchScreen';

function setup() {

    //console.disableYellowBox = true;

    class Root extends React.Component {
        state: {
            isLoading: boolean,
            store: any
        };

        constructor() {
            super();
            this.state = {
                storeCreated: false,
                storeRehydrated: false,
                store: null
            };
        }

        componentDidMount() {
            console.warn('componentDidMount()');
            configureStore(
                // rehydration callback (after async compatibility and persistStore
                _ => this.setState({ storeRehydrated: true})
            ).then(
                // creation callback (after async compatibility)
                store => this.setState({ store, storeCreated: true})
            );
        }

        render() {
            console.warn('store => ' + this.state.store);
            if (!this.state.storeCreated || !this.state.storeRehydrated) {
                return <LaunchScreen />
            }
            return (
                <Provider store = {this.state.store}>
                    <AriApp />
                </Provider>
            );
        }
    }

    return Root;
}

module.exports = setup;