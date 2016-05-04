<div id="contenu">
	<p>
		<h3> Fiche de frais </h3>
		<h2> Etat des frais engagés </h2>
		<i>A retourner accompagné des justificatifs au plus tard le 10 du mois qui suit l’engagement des frais</i>
	</p>

	<table class="listeLegere">
		<caption>Visiteur </caption>
		<tr>
			<th> Mois </th>
			<th> Matricule </th>
			<th> Nom </th>
			<th> Prénom </th>
		</tr>
		<tr>
		<td> <?php echo $leMois ?> </td>
		<td> <?php echo $id ?> </td>
		<td> <?php echo $nom ?> </td>
		<td> <?php echo $prenom ?> </td>
		</tr>
	</table>
</br>

	<table class="listeLegere">
		<caption>Frais Forfaitaires </caption>
		<tr>
			<th class="libelle">Libellé</th>
			<th class="quantite">Quantité</th>
			<th class="montant">Montant</th>
			<th class="total">Total</th>
			<th class="modifier">Modifier</th>
		</tr>
	<?php
	$sousTotal = 0;
	foreach ($lesFraisForfait as $unFrais)
	{
		
	$idFrais = $unFrais['idfrais'];
	$libelle = $unFrais['libelle'];
	$quantite = $unFrais['quantite'];
	$montant = $unFrais['montant'];
	$total = $quantite*$montant;

	$sousTotal += $total;

	?>		
		<tr>
			<td><?php echo $libelle; ?></td>
			<td><?php echo $quantite; ?></td>
			<td><?php echo $montant; ?></td>
			<td><?php echo $total; ?></td>
			<td class="modifier">Faire une modif </td>
		</tr>
	<?php
	}
	?>
		<tr>
			<td colspan="3">
			</td>
			<td> <?php echo $sousTotal; ?> </td>
		</tr>
	</table>
	</br>

	<table class="listeLegere">
		<caption>Descriptif des éléments hors forfait</caption>
		<tr>
			<th class="date">Date</th>
			<th class="libelle">Libellé</th>
			<th class="montant">Montant</th>
			<th class="suppression">Suppression</th>
		</tr>

	<?php
	foreach( $lesFraisHorsForfait as $unFraisHorsForfait)
	{
	$libelle = $unFraisHorsForfait['libelle'];
	$date = $unFraisHorsForfait['date'];
	$montant=$unFraisHorsForfait['montant'];
	$idfrais=$unFraisHorsForfait['id'];
	?>
		<tr>
			<td><?php echo $date ?></td>
			<td><?php echo $libelle ?></td>
			<td><?php echo $montant ?></td>
			<td><a href="index.php?uc=listeVisiteurs&action=supprimerFrais&idFrais=<?php echo $idfrais ?>"
				onclick="return confirm('Voulez-vous vraiment supprimer ce frais ?');">Supprimer ce frais</a></td>
		</tr>
	<?php
	}
	?>
	</table>
	<br>
	<br>
	<?php
	$datetoday = date("Y-m-d");
	$today = dateAnglaisVersFrancais($datetoday);
	?>
	<div class="signature">
		<p>
			Fait à Paris, le <?php echo $today; ?>
			<br>
			<br>
			Vu l'agent comptable
		</p>
	</div>

	<br>
	<hr>
	<div class="petit">
		<sup>1</sup> Les frais forfaitaires doivent être justifiés par une facture acquittée faisant apparaître le montant de la TVA.<br>
		&nbsp;&nbsp;Ces documents ne sont pas à joindre à l’état de frais mais doivent être conservés pendant trois années. Ils <br>
		&nbsp;&nbsp;peuvent être contrôlés par le délégué régional ou le service comptable <br>
		<sup>2</sup> Tarifs en vigueur au 01/09/2010 <br>
		<sup>3</sup> Prix au kilomètre selon la puissance du véhicule  déclaré auprès des services comptables <br>
		<ul style="font-style:italic; font-size:90%;">
			<li>(Véhicule  4CV Diesel) 	0.52 € / Km </li>
			<li>(Véhicule 5/6CV Diesel) 0.58 € / Km </li>
			<li>(Véhicule  4CV Essence) 0.62 € / Km </li>
			<li>(Véhicule 5/6CV Essence) 0.67 € / Km </li>
		</ul>
		<sup>4</sup> Tout frais « hors forfait » doit être dûment justifié par l’envoi d’une facture acquittée faisant apparaître le montant de TVA
	</div>
</div>

