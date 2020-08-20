<?php

class Contacts
{
    private $bdd;

    public function __construct()
    {
        try {
            $this->bdd = new PDO('mysql:host=localhost;dbname=veine;charset=utf8', 'root', '');
            // Activation des erreurs PDO
            $this->bdd->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            // mode de fetch par défaut : FETCH_ASSOC / FETCH_OBJ / FETCH_BOTH
            $this->bdd->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
        } catch (Exception $e) {
            die('Erreur : ' . $e->getMessage());
        }
    }
    public function getContacts($userId)
    {
        $query = 'SELECT have_contacts.users_id, users_pseudo as contact_pseudo, lhp4_contacts.users_id as contact_id, contacts_authorized, contacts_bookmark
        FROM veine.have_contacts
        INNER JOIN lhp4_contacts
        ON lhp4_contacts.contacts_id = have_contacts.contacts_id
        INNER JOIN lhp4_users
        ON lhp4_users.users_id = lhp4_contacts.users_id
        WHERE have_contacts.users_id = :users_id';

        try {

            $resultQuery = $this->bdd->prepare($query);
            $resultQuery->bindValue(':users_id', $userId);
            $resultQuery->execute();
            
            $resultContacts = $resultQuery->fetchAll();
            
            if ($resultContacts) {
                
             return $resultContacts;
               
            } else {
               
               return false;

            }

        } catch (Exception $e) {
            die('Erreur : ' . $e->getMessage());
        }
    }
    
}
?>