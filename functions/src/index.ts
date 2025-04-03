/**
 * Import function triggers from their respective submodules:
 *
 * import {onCall} from "firebase-functions/v2/https";
 * import {onDocumentWritten} from "firebase-functions/v2/firestore";
 *
 * See a full list of supported triggers at https://firebase.google.com/docs/functions
 */

import * as admin from 'firebase-admin/app';
import * as audios from "./audios_functions";
import * as playlists from "./playlists_functions"

admin.initializeApp();

export const getAllAudios =  audios.getAllAudios;
export const getAudio = audios.getAudio;

export const getPlaylist = playlists.getPlaylist;
export const getAllPlaylists = playlists.getAllInitialPlaylists;
export const getAllOtherPlaylists = playlists.getAllOtherPlaylists;
export const createPlaylist = playlists.createPlaylist;
export const updatePlaylist = playlists.updatePlaylist;
export const deletePlaylist = playlists.deletePlaylist;


// Start writing functions
// https://firebase.google.com/docs/functions/typescript

// export const helloWorld = onRequest((request, response) => {
//   logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });
