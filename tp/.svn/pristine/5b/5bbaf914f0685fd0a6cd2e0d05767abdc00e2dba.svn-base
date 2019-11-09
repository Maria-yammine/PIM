

-- Auteur: YAMMINE Maria
-- Gérer un stock de matériel informatique.
--
package body Stocks_Materiel is

    procedure Creer (Stock : out T_Stock) is
    begin
        Stock.Taille := 0;
    end Creer;


    function Nb_Materiels (Stock: in T_Stock) return Integer is
    begin
        return Stock.Taille;
    end;


    procedure Enregistrer (
            Stock        : in out T_Stock;
            Numero_Serie : in     Integer;
            Nature       : in     T_Nature;
            Annee_Achat  : in     Integer
                          ) is
        Materiel : T_Materiel;
       
    begin
        Stock.Taille := Stock.Taille + 1;
        Materiel.Numero_Serie := Numero_Serie;
        Materiel.Nature := Nature;
        Materiel.Annee_Achat := Annee_Achat;
        Stock.Elements (Stock.Taille) := Materiel;
       
    end Enregistrer;


end Stocks_Materiel;
