// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ProductAuth {

    struct Product {
        string name;
        string manufacturer;
        bytes32 hash;
        bool exists;
    }

    mapping(string => Product) public products;

    event ProductRegistered(string productId, bytes32 hash);

    function registerProduct(
        string memory productId,
        string memory name,
        string memory manufacturer
    ) public {

        require(!products[productId].exists, "Already registered");

        bytes32 hash = keccak256(
            abi.encodePacked(productId, name, manufacturer)
        );

        products[productId] = Product(name, manufacturer, hash, true);

        emit ProductRegistered(productId, hash);
    }

    function verifyProduct(string memory productId)
        public
        view
        returns (bool, string memory, string memory, bytes32)
    {
        Product memory p = products[productId];

        if (p.exists) {
            return (true, p.name, p.manufacturer, p.hash);
        } else {
            return (false, "", "", 0);
        }
    }
}