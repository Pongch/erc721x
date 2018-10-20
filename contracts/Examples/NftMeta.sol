pragma solidity 0.4.24;

import "../Core/ERC721X/ERC721XToken.sol";

// Mock NFT token with optional meta data strings

contract NftMeta is ERC721XToken {

    mapping(uint256 => string) private _tokenURIs; 

    function name() external view returns (string) {
        return "NftMeta";
    }

    function symbol() external view returns (string) {
        return "LAST";
    }

    function _setTokenURI(uint256 _tokenId, string _uri) internal {
        require(exists(_tokenId));
        _tokenURIs[_tokenId] = _uri;
    }
    
    function tokenURI(uint256 tokenId) public view returns (string) {
        require(exists(tokenId));
        return _tokenURIs[tokenId];
    }

    // fungible mint with additional tokenURI
    function mint(uint256 _tokenId, address _to, uint256 _supply, string _tokenURI ) external {
        _mint(_tokenId, _to, _supply);
        _setTokenURI(_tokenId, _tokenURI);
    }

    // nft mint with additional tokenURI
    function mint(uint256 _tokenId, address _to, string _tokenURI) external {
        _mint(_tokenId, _to);
        _setTokenURI(_tokenId, _tokenURI);
    }
}