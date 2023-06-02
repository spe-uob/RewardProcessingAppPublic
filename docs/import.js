const admin = require('firebase-admin');

// Replace with the path where `credentials.json` is located
const serviceAccount = require('/path/to/your/credentials.json');

admin.initializeApp({
    credential: admin.credential.cert(serviceAccount)
});

const db = admin.firestore();

async function importData(documentIds, collectionPath, subCollections, subDocuments) {
    try {
        const collectionRef = db.collection(collectionPath);

        for (const docId of documentIds) {
            const docRef = collectionRef.doc(docId);

            // Create the document with no data
            await docRef.set({});

            // Create empty sub-documents under sub-collections
            for (const subDoc of subDocuments) {
                const subDocRef = docRef.collection(subDoc.subCollection).doc(subDoc.docId);
                await subDocRef.set({});
            }
        }
        console.log('Import completed successfully!');
    } catch (error) {
        console.error('Import failed:', error);
    }
}

const collectionPath = 'participants';
// Add a list of prolific IDs here
const documentIds = [
    'ProlificID1',
    'ProlificID2',
    'ProlificID3'
];
const subCollections = ['Day1', 'Day2', 'Day3']; // Array of sub-collection names
const subDocuments = [
    { subCollection: 'Day1', docId: 'questionnaire' },
    { subCollection: 'Day2', docId: 'questionnaire' },
    { subCollection: 'Day3', docId: 'questionnaire' }
]; // Array of sub-document names and their corresponding sub-collection names

importData(documentIds, collectionPath, subCollections, subDocuments);
