import * as admin from 'firebase-admin'
import * as functions from 'firebase-functions'

const { error } = require("firebase-functions/logger");


export const getAllAudios = functions.https.onRequest(async (request, response)=> {
    const db = admin.firestore();

    try {
        const snapshot = await db.collection('audios').get();

        const audios = snapshot.docs.map((audio =>({
            id: audio.id,
            ...audio.data()
        })));

        response.status(200).json(audios);
        
    } catch (error) {
        response.status(500).json({error: "Erreur audios", details: error});
    }
});

export const getAudio = functions.https.onRequest(async (request, response)=> {
    const db = admin.firestore();
    const { id } = request.query; 

   if (!id) {
         response.status(400).json({ error: "ID de l'audio requis" });
         error("ID de l'audio requis")
         return;
    }

    try {
        const docRef = await db.collection('audios').doc(id.toString()).get();

        if (!docRef.exists) {
             response.status(404).json({ error: "Audio non trouvée" });
        }

        response.status(200).json({ id: docRef.id, ...docRef.data() });

    } catch (error) {
        response.status(500).json({ error: "Erreur lors de la récupération de l'audio", details: error });
    }
});