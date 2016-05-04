<div id="contenu">
	<h2>Liste des visiteurs</h2>
	<h3>Visiteur à sélectionner : </h3>
	<form action="index.php?uc=listeVisiteurs&action=voirVisiteur" method="post">	
	 <div class="corpsForm">
    <p>
      <label for="Visiteur" accesskey="n">Visiteur : </label>
      <select id="Visiteur" name="id">
      <?php
        foreach ($lesVisiteurs as $unVisiteur)
        {
          $nom = $unVisiteur['nom'];
          $prenom = $unVisiteur['prenom'];
          $id = $unVisiteur['id'];
          ?>
      <option value="<?php echo $id; ?>"> 
      <?php 
          echo $nom." ".$prenom ?>
      </option><?php
        }
      ?>
      </select>
    </p>
    <p>
      <label for="lstMois" accesskey="n">Mois : </label>
      <select id="lstMois" name="lstMois">
      <?php
      foreach ($lesMois as $unMois)
      {
        var_dump($lesMois);
        $mois = $unMois['mois'];
        $numAnnee =  $unMois['numAnnee'];
        $numMois =  $unMois['numMois'];
        if($mois == $moisASelectionner){
        ?>
        <option selected value="<?php echo $mois ?>"><?php echo  $numMois."/".$numAnnee ?> </option>
        <?php
        }
        else{ ?>
        <option value="<?php echo $mois ?>"><?php echo  $numMois."/".$numAnnee ?> </option>
        <?php
        }
      }
       ?>
      </select>
      </p>
      </div>

      <div class="piedForm">
      <p>
        <input id="ok" type="submit" value="Valider" size="20" />
        <input id="annuler" type="reset" value="Effacer" size="20" />
      </p>
      </div>
  </form>

</div>

      