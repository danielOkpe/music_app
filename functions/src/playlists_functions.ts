import * as admin from 'firebase-admin'
import * as functions from 'firebase-functions'

const { log, error } = require("firebase-functions/logger");
  


export const getAllInitialPlaylists = functions.https.onRequest(async (request, response)=> {
    const db = admin.firestore();

    try {
        const snapshot = await db.collection('playlists').where('isInitial', '==', true).get();

        const playlists = snapshot.docs.map((playlist =>({
            id: playlist.id,
            ...playlist.data()
        })));

        response.status(200).json(playlists);
        
    } catch (error) {
        response.status(500).json({error: "Erreur audios", details: error});
    }
});


export const getAllOtherPlaylists = functions.https.onRequest(async (request, response)=> {
    const db = admin.firestore();

    try {
        const snapshot = await db.collection('playlists').where('isInitial', '==', false).get();

        const playlists = snapshot.docs.map((playlist =>({
            id: playlist.id,
            ...playlist.data()
        })));

        response.status(200).json(playlists);
        
    } catch (error) {
        response.status(500).json({error: "Erreur audios", details: error});
    }
});


export const getPlaylist = functions.https.onRequest(async (request, response) => {
    const db = admin.firestore();
    const { id } = request.query; 

   if (id === undefined) {
         response.status(400).json({ error: "ID de la playlist requis" });
         return;
    }

    try {
        const docRef = await db.collection('playlists').doc(id.toString()).get();

        if (!docRef.exists) {
             response.status(404).json({ error: "Playlist non trouvée" });
        }

        response.status(200).json({ id: docRef.id, ...docRef.data() });

    } catch (error) {
        response.status(500).json({ error: "Erreur lors de la récupération de la playlist", details: error });
    }
});




export const createPlaylist = functions.https.onRequest(async (request, response) => {
    const db = admin.firestore();
    const playlistData = typeof request.body === "string" ? JSON.parse(request.body) : request.body;

    log("audios:",typeof playlistData.playlist)

    if (!playlistData || typeof playlistData.name !== "string" || typeof playlistData.isInitial !== "boolean" || !Array.isArray(playlistData.playlist)) {
        error("Format de la playlist invalide:", playlistData);
        response.status(400).json({ error: "Format de la playlist invalide" });
    }

    for (const song of playlistData.playlist) {
        if (
            typeof song.title !== "string" ||
            typeof song.artist !== "string" ||
            typeof song.img !== "string" ||
            typeof song.audio !== "string" ||
            typeof song.duration !== "number"
        ) {
            error("Format de chanson invalide:", song);
            response.status(400).json({ error: "Une ou plusieurs chansons ont un format invalide" });
        }
    }

    try {
        const docRef = await db.collection('playlists').add(playlistData);

        response.status(201).json({ id: docRef.id, ...playlistData});
        log("playlist créé")

    } catch (e) {
        response.status(500).json({ error: "Erreur lors de la création de la playlist", details: e });
        error("Erreur lors de la création de la playlist:", e)
    }
});




export const updatePlaylist = functions.https.onRequest( async (request, response) => {
    const db = admin.firestore();
    const { id } = request.query;
    const playlistData = typeof request.body === "string" ? JSON.parse(request.body) : request.body;

    if (id === undefined) {
        response.status(400).json({ error: "ID de la playlist requis" });
        return;
   }

   if (!playlistData || typeof playlistData.name !== "string" || typeof playlistData.isInitial !== "boolean" || !Array.isArray(playlistData.playlist)) {
    error("Format de la playlist invalide:", playlistData);
    response.status(400).json({ error: "Format de la playlist invalide" });
   }

    for (const song of playlistData.playlist) {
        if (
            typeof song.title !== "string" ||
            typeof song.artist !== "string" ||
            typeof song.img !== "string" ||
            typeof song.audio !== "string" ||
            typeof song.duration !== "number"
        ) {
            error("Format de chanson invalide:", song);
            response.status(400).json({ error: "Une ou plusieurs chansons ont un format invalide" });
        }
    }

   try {
    const docRef = db.collection('playlists').doc(id.toString());

    const doc = await docRef.get();
    if (!doc.exists) {
        response.status(404).json({ error: "Playlist non trouvée" });
    }

    await docRef.update(playlistData);

    const updatedDoc = await docRef.get();

    log("Playlist modifiée avec succès !");
    response.status(200).json({ id: updatedDoc.id, ...updatedDoc.data()});

   } catch (e) {
    response.status(500).json({ error: "Erreur lors de la modification de la playlist", details: e });
    error("Erreur lors de la modification de la playlist:", e)
   }
});



export const deletePlaylist = functions.https.onRequest(async (request, response) => {
    const db = admin.firestore();
    const { id } = request.query; 

   if (id === undefined) {
         response.status(400).json({ error: "ID de la playlist requis" });
         return;
    }

    try {
        const docRef = await db.collection('playlists').doc(id.toString());
        const doc = await docRef.get();
        if (!doc.exists) {
            response.status(404).json({ error: "Playlist non trouvée" });
        }

        await docRef.delete();
        response.status(200).json("Playlist supprimé avec succès");

    } catch (error) {
        response.status(500).json({ error: "Erreur lors de la suppression de la playlist", details: error });
    }
});

