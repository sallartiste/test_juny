<?php
function upload_originales($fichier,$destination){
    
    // création d'un tableau de sortie (car plusieures variables peuvent ainsi être récupérées en 1X)
    $sortie = [];
    
    // récupération du nom d'origine
    $nom_origine = $fichier['name'];
    
    // récupération de l'extension du fichier mise en minuscule
    $extension_origine = strtolower(strrchr($nom_origine,'.'));
    
    // transformation en tableau des formats autorisés (contante FORMATS)
    $extension_autorisees = explode(',', FORMATS);
    
    // si l'extension ne se trouve pas (!) dans le tableau contenant les extensions autorisées
    if(!in_array($extension_origine,$extension_autorisees)){
        
        // envoi d'une erreur et arrêt de la fonction
        return "Erreur : Extension non autorisée";
    }
    
    // création du nom final avec la bonne extension (appel de la fonction nom_hasard, pour le nombre aléatoire voire la constante dans config.php
    $nom_final = nom_hasard(NB_HASARD).$extension_origine;
    
    // on a besoin du nom final dans le tableau $sortie si la fonction réussit
    $sortie['nom'] = $nom_final;
    $sortie['extension'] = $extension_origine;

    // on déplace l'image du dossier temporaire vers le dossier 'originales' (constante ORG) avec le nom de fichier complet
    if(@move_uploaded_file($fichier['tmp_name'], ORG.$nom_final)){
        return $sortie;
    // si erreur
    }else{
        return "Erreur lors de l'upload d'image";
    }
    
}