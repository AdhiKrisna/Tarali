/**
 * Import function triggers from their respective submodules:
 *
 * const {onCall} = require("firebase-functions/v2/https");
 * const {onDocumentWritten} = require("firebase-functions/v2/firestore");
 *
 * See a full list of supported triggers at https://firebase.google.com/docs/functions
 */

const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp();

exports.sendNotificationOnGrading = functions.firestore
  .document("scoring/{scoreId}")
  .onUpdate(async (change, context) => {
    const newValue = change.after.data();

    const readTestScore = newValue.readTest?.score;
    const readTestMessage = newValue.readTest?.message;
    const title = newValue.title;

    if (readTestScore > 0 && readTestMessage?.trim() !== "") {
      const userRef = admin.firestore().collection("user").doc(newValue.uId);
      const userDoc = await userRef.get();
      const fcmToken = userDoc.data().fcmToken;

      // Remove the additional "message" wrapper
      const message = {
        token: fcmToken,
        notification: {
          title: "Penilaian",
          body: `Anda telah mendapatkan nilai pada Tes Bercerita ${title}.`,
        },
        data: {
          scoreId: context.params.scoreId,
        },
      };

      try {
        const response = await admin
          .messaging()
          .send(message);  // Send the notification without the extra "message" layer
        console.log("Notifikasi berhasil dikirim:", response);
      } catch (error) {
        console.error("Gagal mengirim notifikasi:", error);
      }
    }
  });


// Create and deploy your first functions
// https://firebase.google.com/docs/functions/get-started

// exports.helloWorld = onRequest((request, response) => {
//   logger.info("Hello logs!", {structuredData: true});
//   response.send("Hello from Firebase!");
// });
