// Script để import dữ liệu mẫu vào Firebase Firestore
// Chạy lệnh: node import-data.js

const { initializeApp } = require('firebase/app');
const { getFirestore, collection, addDoc } = require('firebase/firestore');
const data = require('./data.json');

// Cấu hình Firebase của bạn
const firebaseConfig = {
  // Thay thế bằng config thật từ Firebase Console
  apiKey: "your-api-key",
  authDomain: "your-project.firebaseapp.com",
  projectId: "your-project-id",
  storageBucket: "your-project.appspot.com",
  messagingSenderId: "123456789",
  appId: "your-app-id"
};

async function importData() {
  try {
    console.log('🚀 Đang khởi tạo Firebase...');
    const app = initializeApp(firebaseConfig);
    const db = getFirestore(app);

    console.log('📝 Đang import dữ liệu mẫu...');

    for (const item of data.menuItems) {
      // Tạo document mới trong collection 'menuItems'
      const docRef = await addDoc(collection(db, 'menuItems'), {
        name: item.name,
        description: item.description,
        price: item.price,
        category: item.category,
        imageUrl: item.imageUrl,
        updatedAt: new Date()
      });

      console.log(`✅ Đã thêm: ${item.name} (ID: ${docRef.id})`);
    }

    console.log('🎉 Import hoàn thành! Đã thêm', data.menuItems.length, 'món');
    process.exit(0);

  } catch (error) {
    console.error('❌ Lỗi khi import:', error);
    process.exit(1);
  }
}

// Chạy import
importData();
