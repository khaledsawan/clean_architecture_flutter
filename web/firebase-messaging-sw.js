importScripts("https://www.gstatic.com/firebasejs/9.10.0/firebase-app-compat.js");
importScripts("https://www.gstatic.com/firebasejs/9.10.0/firebase-messaging-compat.js");

firebase.initializeApp({
  apiKey: 'AIzaSyA4zoI4sidfc7H2SO8ZmHwKIIOQvs24_-4',
  appId: '1:801698897244:web:71f25d1f37cdbb80823599',
  messagingSenderId: '801698897244',
  projectId: 'clean-architecture-212e6',
  authDomain: 'clean-architecture-212e6.firebaseapp.com',
  storageBucket: 'clean-architecture-212e6.appspot.com',
  measurementId: 'G-6L850YWZLS',
});
// Necessary to receive background messages:
const messaging = firebase.messaging();

// Optional:
messaging.onBackgroundMessage((m) => {
  console.log("onBackgroundMessage", m);
});
