'use strict';

import { applyMiddleware, createStore } from 'redux';
import thunk from 'redux-thunk';
import promise from './promise';
import array from './array';
import analytics from './analytics';
import reducers from '../reducers';
import { createLogger } from 'redux-logger';
import { persistStore, autoRehydrate } from 'redux-persist';
import { AsyncStorage } from 'react-native';
import { ensureCompatibility } from './compatibility';

const isDebuggingInChrome = false;

const logger = createLogger({
    predicate: (getState, action) => isDebuggingInChrome,
    collapsed: true,
    duration: true
});

const createAriStore = applyMiddleware(thunk, promise, array, analytics, logger) (
    createStore
);

async function configureStore(onComplete: ?() => void) {
    const didReset = await ensureCompatibility();
    const store = autoRehydrate()(createAriStore)(reducers);
    persistStore(store, { storage: AsyncStorage }, _ => onComplete(didReset));

    if (isDebuggingInChrome) {
        window.store = store;
    }
    return store;
}

module.exports = configureStore;