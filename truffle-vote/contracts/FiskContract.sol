// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

contract FiskContract {

    // Cuenta propietaria del contrato 
    address owner;

    // Campana -> Votante -> Voto (true o false)
    mapping(uint256 => mapping(uint256 => bool)) private hasVoted;

    // Campana -> Candidato -> Votos (Numeros)
    mapping(uint256 => mapping(uint256 => uint256)) private voteCount;

    // Evento
    event VoteCast(uint256 electionId, uint256 candidateId, uint256 studentId);

    constructor() {
        owner = msg.sender;
    }
    
    modifier onlyAdmin() {
        require(
            msg.sender == owner,
            "Solo el administrador puede ejecutar esta funcion"
        );
        _;
    }

    function vote(
        uint256 electionId,
        uint256 candidateId,
        uint256 userId
    ) public onlyAdmin {
        // Verificar que el votante no haya votado aún
        require(
            !hasVoted[electionId][userId],
            "Ya has votado en esta eleccion"
        );

        hasVoted[electionId][userId] = true;
        voteCount[electionId][candidateId]++;

        // Emitir un evento de voto
        emit VoteCast(electionId, candidateId, userId);
    }


    function getVoteCount(uint256 electionId, uint256 candidateId)
        public
        onlyAdmin
        view
        returns (uint256)
     {
        return voteCount[electionId][candidateId];
    }


    function hasUserVoted(uint256 electionId, uint256 userId)
        public
        view
        returns (bool)
    {
        return hasVoted[electionId][userId];
    }

}
