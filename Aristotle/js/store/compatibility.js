
'use strict';

//import { AsyncStorage } from 'react-native';
//import { compatibleStoreVersion } from '../env';

//const LS_GROUP = 'AriStoreCompatibility';
//const LS_VERSIONING = `${LS_GROUP}:version`;

export async function ensureCompatibility() {
    /*
    try {
        const stored = await AsyncStorage.getItem(LS_VERSIONING);
        if (stored && stored === JSON.stringify(compatibleStoreVersion)) {
            return false;
        }
    }*/
    return await resetCompatibility();
}

async function resetCompatibility() {
    return true;
}

async function updateCompatibility() {
    return true;
}