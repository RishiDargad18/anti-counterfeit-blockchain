# 🔗 Anti-Counterfeit Product Verification System (Blockchain)

## 📌 Overview

This project is a simple blockchain-based anti-counterfeiting system where:

* Manufacturers register products
* Users verify product authenticity

The system uses **Ethereum (Hardhat)** and **Ethers.js**.

---

## 🚀 Features

* ✅ Product registration on blockchain
* ✅ Tamper detection using hashing
* ✅ Duplicate product ID prevention
* ✅ Instant verification (no gas required)
* ✅ Modern UI

---

## 🧰 Tech Stack

* Smart Contract: Solidity
* Blockchain: Hardhat (Local Ethereum)
* Frontend: HTML, CSS, JavaScript
* Library: Ethers.js

---

## ⚙️ Setup Instructions

### 1. Clone the repository

```bash
git clone https://github.com/your-username/anti-counterfeit-blockchain.git
cd anti-counterfeit-blockchain
```

---

### 2. Install dependencies

```bash
npm install
```

---

### 3. Compile Smart Contract

```bash
npx hardhat compile
```

---

### 4. Start Local Blockchain

```bash
npx hardhat node
```

⚠️ Keep this terminal running

---

### 5. Deploy Contract

(Open new terminal)

```bash
npx hardhat run scripts/deploy.js --network localhost
```

👉 Copy the deployed contract address

---

### 6. Update Frontend

Open `index.html` and replace:

```js
const contractAddress = "YOUR_DEPLOYED_ADDRESS";
```

---

### 7. Run Frontend

#### Option 1 (Python):

```bash
python -m http.server 5500
```

Open in browser:

```
http://localhost:5500
```

#### Option 2 (VS Code Live Server):

* Right click `index.html`
* Click "Open with Live Server"

---

## 🦊 MetaMask Setup

1. Install MetaMask

2. Add network:

   * Network Name: Hardhat Local
   * RPC URL: [http://127.0.0.1:8545](http://127.0.0.1:8545)
   * Chain ID: 31337

3. Import account using private key from Hardhat node

---

## 🧪 How to Use

### Register Product

* Enter Product ID, Name, Manufacturer
* Approve MetaMask transaction

### Verify Product

* Enter same details
* System shows:

  * ✅ Authentic (if valid)
  * ❌ Fake (if tampered or not found)

---

## 🧠 Working Principle

* Each product is stored as a **hash (digital fingerprint)**
* During verification, hash is recalculated
* If hashes match → authentic
* Else → counterfeit

---

## ⚠️ Notes

* Do not restart Hardhat node during demo (address changes)
* Always update contract address after redeployment

---

## 🎯 Future Enhancements

* QR code scanning
* Product history tracking
* Mobile app integration

---

## 🗣️ Viva Explanation

> This system uses blockchain to store product data securely. A cryptographic hash ensures data integrity. Any tampering changes the hash, allowing detection of counterfeit products. Verification is implemented as a read-only function for instant and gas-free validation.

---

## 👨‍💻 Author

* Your Name
