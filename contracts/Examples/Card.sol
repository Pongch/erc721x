pragma solidity 0.4.24;

import "../Core/ERC721X/ERC721XToken.sol";
import "../Libraries/Conversion.sol";

// Example

contract Card is ERC721XToken {

    function name() external view returns (string) {
        return "Card";
    }

    function symbol() external view returns (string) {
        return "CRD";
    }

    // fungible mint
    function mint(uint256 _tokenId, address _to, uint256 _supply) external {
        _mint(_tokenId, _to, _supply);
    }

    // nft mint
    function mint(uint256 _tokenId, address _to) external {
        _mint(_tokenId, _to);
    }

    function tokenURI(uint256 _tokenId) public view returns (string ) {
        require(exists(_tokenId), "Token doesn't exist");
        
        string memory base = "https://rinkeby.loom.games/erc721/zmb/";
        string memory idString = Conversion.uintToStr(_tokenId);
        
        return  appendURI(base, idString);
    }
    
    function appendURI(string base, string id) internal pure returns (string) {
        return string(abi.encodePacked(base, id, ".json"));
    }
}
