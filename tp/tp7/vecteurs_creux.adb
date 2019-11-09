with Ada.Text_IO;                 use Ada.Text_IO;
with Ada.Integer_Text_IO;         use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;           use Ada.Float_Text_IO;
with Ada.Unchecked_Deallocation;

package body Vecteurs_Creux is

    procedure Free is
            new Ada.Unchecked_Deallocation (T_Cellule, T_Vecteur_Creux);

    procedure Initialiser (V : out T_Vecteur_Creux) is
    begin
        V := Null;
    end Initialiser;


    procedure Detruire (V: in out T_Vecteur_Creux) is
    begin
        if V /= Null then
            Detruire (V.all.Suivant);
            Free (V);
        else
            Null;
        end if;
    end Detruire;


    function Est_Nul (V : in T_Vecteur_Creux) return Boolean is
    begin
        return V = Null;
    end Est_Nul;


    function Composante_Recursif (V : in T_Vecteur_Creux ; Indice : in Integer) return Float is
    begin
        if V = Null or else V.all.Indice > Indice then
            return 0.0;
        elsif V.all.Indice = Indice then
            return V.all.Valeur;
        else
            return Composante_Recursif (V.all.Suivant, Indice);
        end if;
    end Composante_Recursif;


    function Composante_Iteratif (V : in T_Vecteur_Creux ; Indice : in Integer) return Float is
        Composante : T_Vecteur_Creux;
        Valeur : Float := 0.0;
    begin
        Composante := V;
        while Composante /= Null and then Composante.all.Indice <= Indice loop
            if Composante.all.Indice = Indice then
                Valeur := Composante.all.Valeur;
            else
                Composante := Composante.all.Suivant;
            end if;
        end loop;
        return Valeur;
    end Composante_Iteratif;

    procedure Modifier (V : in out T_Vecteur_Creux ;
                        Indice : in Integer ;
                        Valeur : in Float ) is
        Nouveau, Ancien : T_Vecteur_Creux;
    begin
        if not (V = Null or else V.all.Indice > Indice) then
            if Valeur /= 0.0 then
                Nouveau := new T_Cellule;
                Nouveau.all.Indice := Indice;
                Nouveau.all.Valeur := Valeur;
                Nouveau.all.Suivant := V;
                V := Nouveau;
            end if;

        elsif V.all.Indice = Indice then
            if Valeur = 0.0 then
                Ancien := V;
                V := V.all.Suivant;
                Free (Ancien);
            else
                V.all.Valeur := Valeur;
            end if;

        else
            Modifier (V.all.Suivant, Indice, Valeur);
        end if;
    end Modifier;


    function Sont_Egaux_Recursif (V1, V2 : in T_Vecteur_Creux) return Boolean is
        Egaux : Boolean;
    begin
        if V1 = Null and V2 = Null then
            return True;
        elsif V1 /= Null and V2 /= Null then
            Egaux := V1.all.Valeur = V2.all.Valeur;
            Egaux := Egaux and then V1.all.Indice = V2.all.Indice;
            return Egaux and then Sont_Egaux_Recursif (V1.all.Suivant, V2.all.Suivant);
        else
            return False;
        end if;
    end Sont_Egaux_Recursif;

    function Sont_Egaux_Iteratif (V1, V2 : in T_Vecteur_Creux) return Boolean is
        Comp1, Comp2 : T_Vecteur_Creux;
        Egaux : Boolean;
    begin
        Comp1 := V1;
        Comp2 := V2;
        Egaux := True;
        while Comp1 /= Null and Comp2 /= Null and Egaux loop
            Egaux := Comp1.all.Valeur = Comp2.all.Valeur;
            Egaux := Egaux and then Comp1.all.Indice = Comp2.all.Indice;
            Comp1 := Comp1.all.Suivant;
            Comp2 := Comp2.all.Suivant;
        end loop;
        return Egaux and then Comp1 = Null and then Comp2 = Null;
    end Sont_Egaux_Iteratif;

    procedure Additionner (V1 : in out T_Vecteur_Creux; V2 : in T_Vecteur_Creux) is
        Comp1, Comp2 : T_Vecteur_Creux;
    begin
        Comp1 := V1;
        Comp2 := V2;
        while (Comp1 /= Null) loop
            Modifier (V1, Comp1.all.Indice, Comp1.all.Valeur + Composante_Recursif (V2, Comp1.all.Indice));
            Comp1 := Comp1.all.Suivant;
        end loop;
        while (Comp2 /= Null) or else (Composante_Recursif (V1, Comp2.all.Indice) = 0.0) loop
            Modifier (V1, Comp2.all.Indice, Comp2.all.Valeur);
        end loop;
    end Additionner;

    --function Norme2_Recursif (V : in T_Vecteur_Creux) return Float is
    --begin
       -- if (V = null) then
            --return 0.0;
        --else
            --return (V.all.Valeur * V.all.Valeur) + Norme2_Recursif (V.all.Suivant);
        --end if;
    --end Norme2_Recursif;

    function Norme2 (V : in T_Vecteur_Creux) return Float is
        Curseur : T_Vecteur_Creux;
        Somme : Float := 0.0;
    begin
        Curseur := V;
        while (Curseur /= Null) loop
            Somme := Somme  + (Curseur.all.Valeur * Curseur.all.Valeur);
            Curseur := Curseur.all.Suivant;
        end loop;
        return Somme;
    end Norme2;


    function Produit_Scalaire (V1, V2: in T_Vecteur_Creux) return Float is
    begin
        if (V1 = Null or V2 = Null) then
            return 0.0;
        else
            if (V1.all.Indice < V2.all.Indice) then
                return 0.0 + Produit_Scalaire (V1.all.Suivant, V2);
            elsif (V1.all.Indice > V2.all.Indice) then
                return 0.0 + Produit_Scalaire (V1, V2.all.Suivant);
            else
                return V1.all.Valeur * V2.all.Valeur + Produit_Scalaire (V1.all.Suivant, V2.all.Suivant);
            end if;
        end if;
    end Produit_Scalaire;


    procedure Afficher (V : T_Vecteur_Creux) is
    begin
        if V = Null then
            Put ("--E");
        else
            Put ("-->[ ");
            Put (V.all.Indice, 0);
            Put (" | ");
            Put (V.all.Valeur, Fore => 0, Aft => 1, Exp => 0);
            Put (" ]");
            Afficher (V.all.Suivant);
        end if;
    end Afficher;


    function Nombre_Composantes_Non_Nulles (V: in T_Vecteur_Creux) return Integer is
    begin
        if V = Null then
            return 0;
        else
            return 1 + Nombre_Composantes_Non_Nulles (V.all.Suivant);
        end if;
    end Nombre_Composantes_Non_Nulles;


end Vecteurs_Creux;
