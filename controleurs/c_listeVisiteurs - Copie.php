<?php
include("vues/v_sommaire.php");
$action = $_REQUEST['action'];
$idVisiteur = $_SESSION['idVisiteur'];
switch($action){
	case 'listeVisiteurs':{

	$lesVisiteurs=$pdo->getListeVisiteurs();
	$leVisiteur = array_keys($lesVisiteurs);
	$visiteurASelectionner = $leVisiteur[0];

	$leMois = $_REQUEST['lstMois']; 
	$lesMois=$pdo->getLesMoisDisponibles($idVisiteur);
	$moisASelectionner = $leMois;

	include("vues/v_listeVisiteurs.php");


	break;
	}
	case 'voirVisiteur':{
			$lesFraisHorsForfait = $pdo->getLesFraisHorsForfait($idVisiteur,$leMois);
		$lesFraisForfait= $pdo->getLesFraisForfait($idVisiteur,$leMois);
		$lesInfosFicheFrais = $pdo->getLesInfosFicheFrais($idVisiteur,$leMois);
		$numAnnee =substr( $leMois,0,4);
		$numMois =substr( $leMois,4,2);
		$libEtat = $lesInfosFicheFrais['libEtat'];
		$montantValide = $lesInfosFicheFrais['montantValide'];
		$nbJustificatifs = $lesInfosFicheFrais['nbJustificatifs'];
		$dateModif =  $lesInfosFicheFrais['dateModif'];
		$dateModif =  dateAnglaisVersFrancais($dateModif);
		include("vues/v_voirVisiteur.php");
		break;
	}
}
?>