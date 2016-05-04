<?php
include("vues/v_sommaire.php");
$action = $_REQUEST['action'];
$idVisiteur = $_SESSION['idVisiteur'];
switch($action){
	case 'listeVisiteurs':{
	$lesVisiteurs=$pdo->getListeVisiteurs();
	$leVisiteur = array_keys($lesVisiteurs);
	$visiteurASelectionner = $leVisiteur[0];

	if (isset($_REQUEST['lstMois'])) {
	$leMois = $_REQUEST['lstMois'];
	}
	else
		{ $leMois = 0; 
			
		}
	$lesMois=$pdo->getLesMoisDisponibles($idVisiteur);
	$moisASelectionner = $leMois;
	include("vues/v_listeVisiteurs.php");
	break;
	}

	case 'voirVisiteur':{
			$id = $_POST['id']; // Récupération de l'id
			$tableauVisiteur=$pdo->getInfoNeed($id); // Récupération des infos du nom et du prénom du visiteur 
			$nom = $tableauVisiteur[0][0]; 
			$prenom = $tableauVisiteur[0][1];
			$leMois = $_REQUEST['lstMois'];
			$lesFraisHorsForfait = $pdo->getLesFraisHorsForfait($id,$leMois);
		$lesFraisForfait= $pdo->getLesFraisForfait($id,$leMois);
		$lesInfosFicheFrais = $pdo->getLesInfosFicheFrais($id,$leMois);
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
		case 'supprimerFrais':{
		$idFrais = $_REQUEST['idFrais'];
	    $pdo->supprimerFraisHorsForfait($idFrais);
	    include("vues/v_voirVisiteur.php");

		break;
	}

}
?>