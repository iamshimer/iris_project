const functions = require("firebase-functions");
const { initializeApp } = require("firebase-admin/app");

const { getAuth } = require("firebase-admin/auth");
const { getFirestore } = require("firebase-admin/firestore");

const createTheUser = require("./auth");

initializeApp();
const auth = getAuth();
const store = getFirestore();

exports.requestUserCreation = functions.https.onCall(async (data) =>
  createTheUser(data, auth, store)
);
