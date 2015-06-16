<?php
session_start();

require_once 'config.php';
require_once 'connect.php';
require_once 'fonctions.php';

// si tentative de connexion
if(isset($_POST['lelogin'])){
    $lelogin = traite_chaine($_POST['lelogin']);
    $lemdp = traite_chaine($_POST['lemdp']);
    
    // vérification de l'utilisateur dans la db
    $sql ="SELECT  u.id, u.lemail, u.lenom, 
		d.lenom AS nom_perm, d.ladesc, d.laperm 
	FROM utilisateur u
		INNER JOIN droit d ON u.droit_id = d.id
    WHERE u.lelogin='$lelogin' AND u.lemdp = '$lemdp';";
    $requete = mysqli_query($mysqli, $sql)or die(mysqli_error($mysqli));
    $recup_user = mysqli_fetch_assoc($requete);
    
    // si l'utilisateur est bien connecté
    
    $_SESSION = $recup_user;
    $_SESSION['sid'] = session_id(); // récupération de la clef de session
    var_dump($_SESSION);
    
}
?>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Accueil</title>
    </head>
    <body>
        <div id="content">
            <div id="haut"><h1>photos.be</h1> 
                <div id="connect">
                    <form action="" name="connection" method="POST">
                        <input type="text" name="lelogin" required />
                        <input type="password" name="lemdp" required />
                        <input type="submit" value="Connexion" />
                    </form>
                    <a href="mdp.php">Mot de passe oublié?</a>
                    <a href="inscription.php">Inscription</a>
                </div>
            </div>
            <div id="milieu"></div>
            <div id="bas"></div>
        </div>
    </body>
</html>
