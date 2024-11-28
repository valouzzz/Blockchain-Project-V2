// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract SkillNFT is ERC721, Ownable {
    // Structure pour stocker les informations d'une compétence
    struct Skill {
        string name;        // Nom de la compétence
        bool isValidated;   // État de validation
        string description; // Description détaillée
        uint256 createdAt; // Date de création
    }

    // Mapping pour stocker les compétences
    mapping(uint256 => Skill) public skills;
    
    // Compteur pour les IDs des NFTs
    uint256 private _tokenIdCounter;

    constructor() ERC721("SkillNFT", "SKILL") Ownable(msg.sender) {}

    // Fonction pour créer un nouveau NFT de compétence
    function createSkill(
        string memory name,
        string memory description
    ) public returns (uint256) {
        uint256 tokenId = _tokenIdCounter;
        _tokenIdCounter++;

        skills[tokenId] = Skill({
            name: name,
            isValidated: false,
            description: description,
            createdAt: block.timestamp
        });

        _mint(msg.sender, tokenId);
        return tokenId;
    }
}