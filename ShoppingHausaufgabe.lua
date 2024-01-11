local shop = {
    -- Artikel
    {Preis = 10, Anzahl = 7, Name = "Apfel"},
    {Preis = 5, Anzahl = 2, Name = "Schokokekse"},
    {Preis = 2, Anzahl = 5, Name = "Vollkornbrot"},
    {Preis = 20, Anzahl = 2, Name = "Rotwein"},
    {Preis = 100, Anzahl = 2, Name = "Samsung"}
}


local shop2 = {}

shop2.Apfel = {Preis = 10, Anzahl = 7, Name = "Apfel"}
shop2.Schokokekse = {Preis = 5, Anzahl = 2, Name = "Schokokekse"}
shop2.Vollkornbrot = {Preis = 2, Anzahl = 5, Name = "Vollkornbrot"}
shop2.Wein = {Preis = 20, Anzahl = 2, Name = "Rotwein"}
shop2.TV = {Preis = 100, Anzahl = 2, Name = "Samsung"}





local MaxKaufVersuche = 5
local KaufVersucheCounter = 0
local MengeInTasche = 0
local Ausgaben = 0
local consumer = {Name = "Jack", Alter = 45, Geld = 125, Lebt = true, Tasche = {}
}
-- Wievil Geld noch in der Brieftasche vor dem Kauf
print(consumer.Name.. " hat ".. consumer.Geld.. " Geld in der Brieftasche\n")
-- Ob er noch den Laden fegt
local function fegen(Besen) -- die hier auszuführenden funktionen, müssen mit übergeben werden sonst kommt nil
    if math.random(0,1) > 0 then -- zufälliger Ja/Nein Entscheider
        print(consumer.Name.. " wird heut etwas den Laden fegen!")
        Besen() -- ausführen der mitübergebenen Funktion, zum Verständniss mit dem Namen versehen de die funktion hat,
        --  kann aber auch jeden anderen Namen haben hauptsache der Gleiche wie im Kopf der Funktion
        return
    end

    print(consumer.Name.. " hat heute keine Lust den Laden zu fegen")
    return
end
-- Hier die funktion des Besen
local function Besen ()
    local found = math.random(0, 155)

    if found > 0 then -- sollte der benutzer den Besen benutzen und zuällig geld finden wird dieses ausgegeben
        print("Beim fegen hat ".. consumer.Name.. " ".. found.. " Geld gefunden!")
        consumer.Geld = consumer.Geld+found
        return
    end
    return
end



local function Kaufen(Artikel, Tasche)

    -- print("Artikel ", Artikel.Name, " noch im Geschäft ", Artikel.Anzahl)
    if consumer.Geld < Artikel.Preis then
        print(consumer.Name.. " hat nicht genügend Geld um sich den Artikel ".. Artikel.Name.. " zu leisten")
        return
    end -- Hat er genügend Geld?

    if Artikel.Anzahl > 0 then  -- Sind noch Artikel Vorhanden im Geschäft?


        -- Kaufvorgng
        if #consumer.Tasche  == 0 then  -- Überprüfen ob schon etwas gekauft wurde, damit die Tabelle ihre Formatierung bekommt

            -- Der erte Kauf mit leerer Tasche
            -- print("Die Tasche von ", consumer.Name, " hat 0 Inhalt.")
            consumer.Tasche[#consumer.Tasche+1] = {Name = Artikel.Name, Anzahl = 1, Preis = Artikel.Preis}
            -- #Consumer.Tasche zum ermitteln wie voll sie schon ist und einen neuen Index Anfangen
            -- Artikel die nun in der Tasche sind

            Artikel.Anzahl = Artikel.Anzahl - 1 -- Zieht bei der Anzahl des jeweiligen Artikel einen ab - Bei neu über Dictionary kommt ein Problem mit der rückgabe
        print(consumer.Name.. " hat den Artikel ".. Artikel.Name.. " gekauft, es sind noch ".. Artikel.Anzahl.. " im Lager.")
        Ausgaben = Ausgaben + Artikel.Preis
        consumer.Geld = consumer.Geld - Artikel.Preis -- Preis vom Geld abziehen
            return

        else -- Wenn schon einige Artikel in der Tasche sind

            local SchonVorhanden = false
            local TaschenPlatz = 0

            for Index, GekaufteArtikel in pairs (Tasche) do -- Aufzählen was schon in der Tasche ist
                if GekaufteArtikel.Name == Artikel.Name then -- Artikel schon mal gekauft...,
                    SchonVorhanden = true   -- Speichern ob ein Artikel mit diesem namen gefunden wurde
                    TaschenPlatz = Index    -- An Welchem Indexplatz der Artikel gespeicht ist
                    --print(SchonVorhanden,TaschenPlatz)
                end -- if schon Vorhanden Ja/Nein
            end     -- Ende der for Schleife


            if SchonVorhanden then
                --print("nochmal gekauft wieder ausgelöst")
                consumer.Tasche[TaschenPlatz].Anzahl = consumer.Tasche[TaschenPlatz].Anzahl + 1 -- dann wird nur zum etnsprechenden Index  dazugezählt

            --print("Sind gleich")
            Artikel.Anzahl = Artikel.Anzahl - 1 -- Zieht bei der Anzahl des jeweiligen Artikel einen ab
            print("Jack hat den Artikel ".. Artikel.Name.. " nochmal gekauft, es sind noch ".. Artikel.Anzahl.. " vorhanden ")
            Ausgaben = Ausgaben + Artikel.Preis
            consumer.Geld = consumer.Geld - Artikel.Preis
                return
                -- Das If wird übersprungen wenn der Artikel nicht beim ersten Index gefunden wird dadurch wird ein neuer Datensatz mit else angelegt
                -- die Schleife muss erst durchlaufen werden bevor entschieden wird neu machen oder dazu zählen

            else

                consumer.Tasche[#consumer.Tasche+1] = {Name = Artikel.Name, Anzahl = 1, Preis = Artikel.Preis}
                -- Artikel die nun in der Tasche sind
                print(consumer.Name.. " hat diesmal den Artikel ".. Artikel.Name.. " gekauft")
                --print(#consumer.Tasche.. "Tasche")
                --consumer.Tasche[#consumer.Tasche+1] = Artikel
                consumer.Geld = consumer.Geld - Artikel.Preis
                Ausgaben = Ausgaben + Artikel.Preis

            Artikel.Anzahl = Artikel.Anzahl - 1 -- Zieht bei der Anzahl des jeweiligen Artikel einen ab
            print("Von diesem Artikel noch sind noch ".. Artikel.Anzahl.. " vorhanden.")
            return

            end -- Ende if-Schleife schon vorhanden
            --print(#consumer.Tasche, " ", GekaufteArtikel.Name, " ", Artikel.Name)

        end -- schon gekauft oder nicht




    elseif Artikel.Anzahl == 0 then
        print("Der Artikel", Artikel.Name, " ist ausverkauft") -- Keine Artikel dieses Typs mehr vorhanden
        return
    end
end -- Ausverkauft?

fegen(Besen)

--Kaufen(shop[1])

print("")
while consumer.Geld > 0 and KaufVersucheCounter < MaxKaufVersuche do
    -- consumer.Tasche[#consumer.Tasche+1] =  Kaufen(shop[math.random(1,#shop)])
    -- Kaufen
    Kaufen(shop[math.random(1,#shop)],consumer.Tasche)
    -- Die Funktion Kaufen wird aufgerufen und ihr wird ein zufälliger Artikel übergeben,
    -- dieser wird mit math.random zufällig ermittelt wobei max (#shop) die größe der Tabelle/Array dartsellt
    -- #shop gibt die maximale größe des Array wieder
    print("")

    --Anzahl der Artikel in der Tasche

    KaufVersucheCounter = KaufVersucheCounter + 1

if KaufVersucheCounter == MaxKaufVersuche then
print(consumer.Name.. " hat heut keine Lust mehr einzukaufen")
elseif consumer.Geld == 0 then
print(consumer.Name.. " hat kein Geld mehr zum einkaufen")
end
end

--print(#shop) -- Dient zur Anzeige wie lang die Liste im Shop ist


print(consumer.Name.. " hat noch ".. consumer.Geld.. " Geld in der Brieftasche\n") -- Wiebiel Geld nun noch n der Brieftasche ist
--print (consumer.Name) -- Wer der Kunde ist


local function mengeInTasche()  -- Ausgabe der Menge der Gekauften Artikel
    for Index, ArtikelInTasche in pairs(consumer.Tasche)do
        MengeInTasche = MengeInTasche + ArtikelInTasche.Anzahl -- Die Menge der einzelnen Artikel zusammen gezählt
    end
    print(consumer.Name.. " hat heute ".. MengeInTasche.. " Artikel eingekauft und ".. Ausgaben.. " Geld ausgegeben.") -- Ausgabe der Menge aller Artikel in der Tasche

end

local function inhaltTasche(Inhalt,GeschaeftInhalt)
    if #Inhalt > 0 then -- Ist überhaupt was in der Tasche?

        -- Ja hier weiter
        for TaschenPlatz, ArtikelInTasche in pairs(Inhalt) do -- Aufzählung was in der Tasche ist
            local LagerRest = 0
            for Index, Artikel in pairs(GeschaeftInhalt)do -- wieviel ist denn noch im Lager
                if Artikel.Name == ArtikelInTasche.Name then -- Vergleich der Waren um den korekten Bestand im Lager vergleichen zu können   ---  hier muss mit shop2 wahrscheinlich der Index.Name statt Artikel.name hin
                    LagerRest = Artikel.Anzahl  -- Anzahl der Artikel dazu im Lager, zwischenspeichern für die Aufzählung
                end -- if Abfrage
            end -- Forschleife Lagerbestand

            print("Artikelname: ", ArtikelInTasche.Name, -- Ausgabe Taschenbestand und Rest im Lager
                    "- Artikelpreis: ", ArtikelInTasche.Preis,
                    "Anzahl:", ArtikelInTasche.Anzahl,
                    " noch im Geschäft..: ", LagerRest)

        end -- for Taschenplatz
        --print(Inhalt[1].Name)
        return
    end

    print(consumer.Name,"seine Tasche ist leer") -- falls doch nichts in der Tasche war

end

mengeInTasche()
inhaltTasche(consumer.Tasche,shop) -- Übergabe was in der Tasche und was m Lager ist zur Aufzählung

-- Aufgabe: Überprüfen, ist der artikel bereits in der Tasche und hochzählen bei mehrmaligem Kauf