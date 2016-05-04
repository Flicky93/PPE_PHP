<?php
if(!isset($_REQUEST['action'])){
	$_REQUEST['action'] = 'demandeConnexion';
}
$action = $_REQUEST['action'];
switch($action){
	case 'demandeConnexion':{
		include("vues/v_connexion.php");
		break;
	}
	case 'valideConnexion':{
		$login = $_REQUEST['login'];
		$mdp = $_REQUEST['mdp'];
		$token = $_REQUEST['token'];
		$connect = $pdo->getInfosVisiteur($login,$mdp,$token);
		if(!is_array($connect)){
			ajouterErreur("Login ou mot de passe incorrect");
			include("vues/v_erreurs.php");
			include("vues/v_connexion.php");
		}

		else{
			$id = $connect['id'];
			$nom =  $connect['nom'];
			$prenom = $connect['prenom'];
			$token = $connect['token'];
			if ($token == 1) {
				$classe = "Visiteur";
			}
			elseif ($token ==2){
				$classe = "Comptable";
			}
			connecter($id,$nom,$prenom,$token,$classe);
			include("vues/v_sommaire.php");
		}
		break;
	}
	default :{
		include("vues/v_connexion.php");
		break;
	}
}
?>
