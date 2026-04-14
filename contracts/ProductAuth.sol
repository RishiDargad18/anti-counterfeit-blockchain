// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ProductAuth {

    struct Product {
        string name;
        string manufacturer;
        bytes32 dataHash;
        bool exists;
    }

    mapping(string => Product) public products;

    event ProductRegistered(string productId, bytes32 hash);
    event DuplicateAttempt(string productId);

    // 🔹 Register Product
    function registerProduct(
        string memory productId,
        string memory name,
        string memory manufacturer
    ) public {

        // 🚫 Prevent duplicate product IDs
        if (products[productId].exists) {
            emit DuplicateAttempt(productId);
            revert("Product ID already registered");
        }

        bytes32 hash = keccak256(
            abi.encodePacked(productId, name, manufacturer)
        );

        products[productId] = Product({
            name: name,
            manufacturer: manufacturer,
            dataHash: hash,
            exists: true
        });

        emit ProductRegistered(productId, hash);
    }

    // 🔹 Verify Product (NO MetaMask popup)
    function verifyProduct(
        string memory productId,
        string memory name,
        string memory manufacturer
    )
        public
        view
        returns (bool)
    {
        Product memory p = products[productId];

        if (!p.exists) return false;

        bytes32 newHash = keccak256(
            abi.encodePacked(productId, name, manufacturer)
        );

        return (newHash == p.dataHash);
    }

    // 🔹 Get product details
    function getProduct(string memory productId)
        public
        view
        returns (string memory, string memory)
    {
        require(products[productId].exists, "Product not found");

        return (
            products[productId].name,
            products[productId].manufacturer
        );
    }
}