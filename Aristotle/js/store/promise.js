
'use strict';

// import

function warn(error) {
    throw error;
}

module.exports = store => next => action =>
    typeof action.then === 'function' ?
        Promise.resolve(action).then(next, warn)
        : next(action);