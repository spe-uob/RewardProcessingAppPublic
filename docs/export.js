const admin = require('firebase-admin');
const fs = require('fs');
const path = require('path');

// Replace with the path where `credentials.json` is located
const serviceAccount = require('/path/to/your/credentials.json');

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount)
});

const db = admin.firestore();

async function exportCollection(collectionRef, outputPath) {
  //create a folder for each participant
  const snapshot = await collectionRef.get();
  for (const doc of snapshot.docs) {
    const docId = doc.id;
    const docPath = path.join(outputPath, docId);
    fs.mkdirSync(docPath, { recursive: true });

    //create a folder for each day under each participant (e.g., Day1, Day2...)
    const subCollections = await doc.ref.listCollections();
    subCollections.forEach(async (subCollection) => {
      const subCollectionId = subCollection.id;
      const subCollectionPath = path.join(docPath, subCollectionId);
      fs.mkdirSync(subCollectionPath, { recursive: true });

      //export data as json files under each day (questionnaire, game1, game2, feedback)
      const subSnapshot = await subCollection.get();
      subSnapshot.forEach((subDoc) => {
        const subDocId = subDoc.id;
        const subDocPath = path.join(subCollectionPath, subDocId);
        const data = subDoc.data();
        fs.writeFileSync(`${subDocPath}.json`, JSON.stringify(data, Object.keys(data).sort(), 2));
      });
    });
  };
}

const rootCollection = db.collection('participants');

// Replace with the path to the directory you want to the data to put exported to
const outputDirectory = '/path/to/your/output/directory/';

exportCollection(rootCollection, outputDirectory)
  .then(() => {
    console.log('Export completed successfully!');
    process.exit(0);
  })
  .catch((error) => {
    console.error('Export failed:', error);
    process.exit(1);
  });

