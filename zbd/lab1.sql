-- zad 1
-- Zadeklaruj zmienne vTekst i vLiczba o wartościach odpowiednio „Witaj, świecie!” i 1000.456.
-- Następnie wyświetl na konsoli wartości tych zmiennych.

DECLARE
    vTekst STRING(100) := 'Witaj, świecie!';
    vLiczba FLOAT := 1000.456;
BEGIN
    DBMS_OUTPUT.PUT_LINE(vTekst);
    DBMS_OUTPUT.PUT_LINE(vLiczba);
END;


-- 2. Do zmiennych, zadeklarowanych w zadaniu 1., dodaj odpowiednio: do zmiennej vTekst wartość „Witaj,
-- nowy dniu!”, do zmiennej vLiczba dodaj wartość 10^15. Wyświetl wartości tych zmiennych
DECLARE
    vTekst STRING(100) := 'Witaj, świecie!';
    vLiczba FLOAT := 1000.456;
BEGIN
    vTekst := vTekst || ' ' || 'Witaj, nowy dniu!';
    vLiczba := vLiczba + 10**15;
    DBMS_OUTPUT.PUT_LINE('vTekst: ' || vTekst);
    DBMS_OUTPUT.PUT_LINE('vLiczba: ' || vLiczba);
END;



--     3. Napisz program dodający do siebie dwie liczby. Liczby, które mają być do siebie dodane, powinny być
-- podawane za pomocą odpowiednio zainicjalizowanych zmiennych.
DECLARE
    liczbaA FLOAT := 100;
    liczbaB FLOAT := 234;
BEGIN
    DBMS_OUTPUT.PUT_LINE(liczbaA || ' + ' || liczbaB || ' = ' || (liczbaA + liczbaB));
END;


--     4. Napisz program, który oblicza pole powierzchni koła i obwód koła o podanym w zmiennej promieniu.
-- W programie posłuż się zdefiniowaną przez siebie stałą cPI o wartości 3.14.
DECLARE
    cPI FLOAT := 3.14;
    r FLOAT := 5;
BEGIN
    DBMS_OUTPUT.PUT_LINE('promień: ' || r);
    DBMS_OUTPUT.PUT_LINE('pole: ' || (cPI * r**2 ));
    DBMS_OUTPUT.PUT_LINE('obwód: ' || (2*cPI * r));
END;


-- 5. Napisz program, który wyświetli poniższe informacje o najlepiej zarabiającym pracowniku Instytutu.
-- Program powinien korzystać ze zmiennych vNazwisko i vEtat o typach identycznych z typami
-- atrybutów, odpowiednio: nazwisko i etat w relacji Pracownicy.

DECLARE
    vNazwisko Pracownicy.nazwisko%TYPE;
    vEtat PRACOWNICY.ETAT%TYPE;
BEGIN
    SELECT p.NAZWISKO, p.ETAT
    into vNazwisko, vEtat
    from PRACOWNICY p
    order by p.PLACA_POD DESC
    FETCH FIRST ROW ONLY;

    DBMS_OUTPUT.PUT_LINE('Najlepiej zarabia pracownik ' || vNazwisko);
    DBMS_OUTPUT.PUT_LINE('Pracuje on jako ' || vEtat);
END;
-- 6
DECLARE
    TYPE tDane IS RECORD (
        etat VARCHAR(50),
        nazwisko VARCHAR(100)
    );
    vPracownik tDane;
BEGIN
    SELECT p.NAZWISKO, p.ETAT
    into vPracownik
    from PRACOWNICY p
    order by p.PLACA_POD DESC
        FETCH FIRST ROW ONLY;

    DBMS_OUTPUT.PUT_LINE('Najlepiej zarabia pracownik ' || vPracownik.nazwisko);
    DBMS_OUTPUT.PUT_LINE('Pracuje on jako ' || vPracownik.etat);
END;

-- 6
